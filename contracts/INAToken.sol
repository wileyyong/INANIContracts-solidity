//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./interfaces/IINAToken.sol";

contract INAToken is IINAToken, ERC20, ERC20Burnable, AccessControl, Pausable, ERC20Permit, ReentrancyGuard  {    

    enum PayType {
        payMatic,
        payUsdt,
        payWeth
    }

    struct SalingSchedule {
        // beneficiary of tokens after they are released
        address  wallet;
        // start time of the saling period
        uint256  start;
        // duration of the saling period in seconds
        uint256  duration;
        // amount of tokens to be saled
        uint256 amount;
        // usd price of each token to be saled
        uint256 price;
        // whether or not the vesting has been revoked
        bool revoked;        
    }

    struct VestingSchedule {
        // beneficiary of tokens after they are released
        address  beneficiary;
        // cliff period in seconds
        uint256  cliff;
        // start time of the vesting period
        uint256  start;
        // duration of the vesting period in seconds
        uint256  duration;  
        // duration of a slice period for the vesting in seconds
        uint256 slicePeriodSeconds;
        // whether or not the vesting is revocable
        bool  revocable;
        // total amount of tokens to be released at the end of the vesting
        uint256 amount;
        // amount of tokens released
        uint256  released;
        // whether or not the vesting has been revoked
        bool revoked;
    }

    bytes32[] private _salingScheduleIds;
    mapping(bytes32 => SalingSchedule) private _salingSchedules;
    mapping(bytes32 => address[]) private _salingWhitelists;

    bytes32[] private _vestingScheduleIds;
    mapping(bytes32 => VestingSchedule) private _vestingSchedules;

    bool private _locked;

    bytes32 public constant TREASURY_WALLET = bytes32("TREASURY_WALLET");
    bytes32 public constant VESTING_WALLET = bytes32("VESTING_WALLET");

    address public constant POLYGON_MUMBAI_USDT = 0xA02f6adc7926efeBBd59Fd43A84f4E0c0c91e832;
    address public constant POLYGON_MUMBAI_WETH = 0xA6FA4fB5f76172d178d61B04b0ecd319C5d1C0aa;

    AggregatorV3Interface private _feedMaticUsd; 
    AggregatorV3Interface private _feedUsdtUsd;    
    AggregatorV3Interface private _feedEthUsd; 

    address public immutable treasury;

    modifier onlyOwner() {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), 
            "Only owner can mint");
        _;
    }

    constructor(
        address _admin,
        address _treasury
    ) 
    ERC20("INANI token", "INA")
    ERC20Permit("INANI token v1") {       

        _setupRole(DEFAULT_ADMIN_ROLE, _admin);
        _setupRole(TREASURY_WALLET, _treasury);
        treasury = _treasury;

        _locked = false; 
        _feedMaticUsd = AggregatorV3Interface(0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada);
        _feedUsdtUsd = AggregatorV3Interface(0x92C09849638959196E976289418e5973CC96d645);
        _feedEthUsd = AggregatorV3Interface(0x0715A7794a1dc8e42615F059dD6e406A6594651A);
    }

    function mint(address to, uint256 amount)
    public onlyOwner {
        _mint(to, amount);
    }

    function lock()
    public onlyOwner {
        _locked = true;
    }

    function unlock()
    public onlyOwner {
        _locked = false;
    }

    function createSaleSchedule(
        address _wallet,
        uint256 _start,
        uint256 _duration,
        uint256 _amount,
        uint256 _priceUsd,
        address[] memory whitelist
    )
    public onlyOwner {
        require(_wallet != address(0), "Sale: invalid wallet");
        require(_start > 0 && _duration > 0 && _start > block.timestamp, 
            "Sale: invalid start, duration");
        require(_amount > 0, "Sale: invalid amount");
        require(_priceUsd > 0, "Sale: invalid usd price");

        bytes32 ssId = keccak256(abi.encode(_wallet, _start, _duration));
        _salingScheduleIds.push(ssId);
        SalingSchedule storage _saleInfo = _salingSchedules[ssId];
        _saleInfo.wallet = _wallet;
        _saleInfo.start = _start;
        _saleInfo.duration = _duration;
        _saleInfo.amount = _amount;
        _saleInfo.price = _priceUsd;
        _salingWhitelists[ssId] = whitelist;

        emit CreatedSale(ssId);
    }

    function revokeSale(bytes32 ssId)
    public onlyOwner {
        require(_salingSchedules[ssId].wallet != address(0),
            "Sale isn't exist");
        require(_salingSchedules[ssId].start > block.timestamp, 
            "Sale is already started");

        _salingSchedules[ssId].revoked = true;
    }
    
    function createVestingSchedule(
        address _beneficiary,
        uint256 _start,
        uint256 _cliff,
        uint256 _duration,
        uint256 _slicePeriodSeconds,
        bool _revocable,
        uint256 _amount
    )
    public onlyOwner {
        require(_beneficiary != address(0), "Vesting: beneficiary wallet");
        require(_start > 0 && _duration > 0 && _start > block.timestamp, 
            "Vesting: invalid start, duration");
        require(_amount > 0, "Vesting: invalid amount");

        bytes32 vsId = keccak256(abi.encode(_beneficiary, _vestingScheduleIds.length));
        _vestingScheduleIds.push(vsId);
        VestingSchedule storage _vestingInfo = _vestingSchedules[vsId];
        _vestingInfo.beneficiary = _beneficiary;
        _vestingInfo.start = _start;
        _vestingInfo.duration = _duration;
        _vestingInfo.amount = _amount;
        _vestingInfo.cliff = _cliff;
        _vestingInfo.slicePeriodSeconds = _slicePeriodSeconds;
        _vestingInfo.revocable = _revocable;

        _mint(_beneficiary, _amount * decimals());
        emit CreatedVest(vsId);
    }

    function revokeVesting(bytes32 vestingId)
    public onlyOwner {

    }
    
    function releaseVesting(bytes32 vestingId, uint256 amount)
    public {

    }

    function buyToken(uint256 amount)
    public payable {
        _buyToken(amount, PayType.payMatic);
    }

    function buyTokenWithUSDT(uint256 amount)
    public {
        _buyToken(amount, PayType.payUsdt);
    }

    function buyTokenWithWETH(uint256 amount)
    public {
        _buyToken(amount, PayType.payWeth);
    }

    function getTokenPrice()
    public 
    view returns (uint256 usdPrice, bytes32 salingId, uint256 amount) {
        salingId = _getCurrentSalingId();
        if (salingId != bytes32(0)) {
            usdPrice = _salingSchedules[salingId].price;
            amount = _salingSchedules[salingId].amount;
        }
    }  

    function getPriceMatic(uint256 usdPrice) 
    public 
    view returns (uint256 matic) {
        (, int price, , , ) = _feedMaticUsd.latestRoundData();
        matic = (10 ** _feedMaticUsd.decimals()) * usdPrice / uint256(price);
    }    

    function getSalingScheduleIds()
    public 
    view returns (bytes32[] memory) {
        return _salingScheduleIds;
    }

    function getVestingScheduleIds()
    public 
    view returns (bytes32[] memory) {
        return _vestingScheduleIds;
    }

    function _buyToken(uint256 _amount, PayType _payType)
    internal {
        (uint256 usdPrice, bytes32 salingId, uint256 amount) = getTokenPrice();

        require(usdPrice > 0, "INA token isn't saling");
        require(amount >= _amount, "Insufficient INA tokens for sale");

        if (_payType == PayType.payMatic) {
            (, int price, , , ) = _feedMaticUsd.latestRoundData();
            uint256 maticPrice = _amount * (10 ** _feedMaticUsd.decimals()) * usdPrice / uint256(price);
            require(msg.value >= maticPrice, "Insufficient MATIC balance");
            payable(treasury).transfer(msg.value);
        }
        else if (_payType == PayType.payUsdt) {
            (, int price, , , ) = _feedUsdtUsd.latestRoundData();
            uint256 usdtPrice = _amount * (10 ** _feedUsdtUsd.decimals()) * usdPrice / uint256(price);        
            require(
                IERC20(POLYGON_MUMBAI_USDT).allowance(msg.sender, address(this)) >= usdtPrice,
                "Insufficient approved USDT"
            );        
            IERC20(POLYGON_MUMBAI_USDT).transferFrom(msg.sender, treasury, usdtPrice);
        }
        else if (_payType == PayType.payWeth) {
            (, int price, , , ) = _feedEthUsd.latestRoundData();
            uint256 wethPrice = _amount * (10 ** _feedEthUsd.decimals()) * usdPrice / uint256(price);
            require(
                IERC20(POLYGON_MUMBAI_WETH).allowance(msg.sender, address(this)) >= wethPrice,
                "Insufficient approved WETH"
            );        
            IERC20(POLYGON_MUMBAI_WETH).transferFrom(msg.sender, treasury, wethPrice);
        }
        SalingSchedule storage _schedule = _salingSchedules[salingId];
        _schedule.amount -= _amount;

        _mint(msg.sender, _amount * decimals());
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) 
    internal 
    override virtual {
        super._beforeTokenTransfer(from, to, amount);

        // checking owner locked tokens
        require(!_locked, "INA is locked by owner");

        // checking private saling now
        bytes32 curSalingId = _getCurrentSalingId();
        if (curSalingId != bytes32(0)) {
            require(from == address(0), "Not allowed trade in Sale stage");
        }

        // checking token is vested
        for (uint256 i = 0; i < _vestingScheduleIds.length; i++) {
            VestingSchedule memory _schedule = _vestingSchedules[_vestingScheduleIds[i]];
            if (block.timestamp >= _schedule.start &&
                block.timestamp < _schedule.start + _schedule.duration &&                
                !_schedule.revoked) {
                require(from != _schedule.beneficiary, "Not allowed transfer in Vesting");
            }
        }
    }

    function _getCurrentSalingId()
    internal view returns (bytes32) {
        for (uint256 i = 0; i < _salingScheduleIds.length; i++) {
            SalingSchedule memory _schedule = _salingSchedules[_salingScheduleIds[i]];
            if (block.timestamp >= _schedule.start &&
                block.timestamp < _schedule.start + _schedule.duration &&
                _schedule.amount > 0 &&
                !_schedule.revoked) {
                return _salingScheduleIds[i];
            }
        }
        return bytes32(0);
    }    
}