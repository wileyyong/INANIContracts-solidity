//SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol

/**
* @dev Interface of the ERC20 standard as defined in the EIP. Does not include
* the optional functions; to access them see `ERC20Detailed`.
*/
interface IERC20 {
    /**
    * @dev Returns the amount of tokens in existence.
    */
    function totalSupply() external view returns (uint256);

    /**
    * @dev Returns the amount of tokens owned by `account`.
    */
    function balanceOf(address account) external view returns (uint256);

    /**
    * @dev Moves `amount` tokens from the caller's account to `recipient`.
    *
    * Returns a boolean value indicating whether the operation succeeded.
    *
    * Emits a `Transfer` event.
    */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
    * @dev Returns the remaining number of tokens that `spender` will be
    * allowed to spend on behalf of `owner` through `transferFrom`. This is
    * zero by default.
    *
    * This value changes when `approve` or `transferFrom` are called.
    */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
    * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
    *
    * Returns a boolean value indicating whether the operation succeeded.
    *
    * > Beware that changing an allowance with this method brings the risk
    * that someone may use both the old and the new allowance by unfortunate
    * transaction ordering. One possible solution to mitigate this race
    * condition is to first reduce the spender's allowance to 0 and set the
    * desired value afterwards:
    * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    *
    * Emits an `Approval` event.
    */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
    * @dev Moves `amount` tokens from `sender` to `recipient` using the
    * allowance mechanism. `amount` is then deducted from the caller's
    * allowance.
    *
    * Returns a boolean value indicating whether the operation succeeded.
    *
    * Emits a `Transfer` event.
    */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
    * @dev Emitted when `value` tokens are moved from one account (`from`) to
    * another (`to`).
    *
    * Note that `value` may be zero.
    */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
    * @dev Emitted when the allowance of a `spender` for an `owner` is set by
    * a call to `approve`. `value` is the new allowance.
    */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol

/**
* @dev Wrappers over Solidity's arithmetic operations with added overflow
* checks.
*
* Arithmetic operations in Solidity wrap on overflow. This can easily result
* in bugs, because programmers usually assume that an overflow raises an
* error, which is the standard behavior in high level programming languages.
* `SafeMath` restores this intuition by reverting the transaction when an
* operation overflows.
*
* Using this library instead of the unchecked operations eliminates an entire
* class of bugs, so it's recommended to use it always.
*/
library SafeMath {
    /**
    * @dev Returns the addition of two unsigned integers, reverting on
    * overflow.
    *
    * Counterpart to Solidity's `+` operator.
    *
    * Requirements:
    * - Addition cannot overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
    * @dev Returns the subtraction of two unsigned integers, reverting on
    * overflow (when the result is negative).
    *
    * Counterpart to Solidity's `-` operator.
    *
    * Requirements:
    * - Subtraction cannot overflow.
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Returns the multiplication of two unsigned integers, reverting on
    * overflow.
    *
    * Counterpart to Solidity's `*` operator.
    *
    * Requirements:
    * - Multiplication cannot overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
    * @dev Returns the integer division of two unsigned integers. Reverts on
    * division by zero. The result is rounded towards zero.
    *
    * Counterpart to Solidity's `/` operator. Note: this function uses a
    * `revert` opcode (which leaves remaining gas untouched) while Solidity
    * uses an invalid opcode to revert (consuming all remaining gas).
    *
    * Requirements:
    * - The divisor cannot be zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
    * Reverts when dividing by zero.
    *
    * Counterpart to Solidity's `%` operator. This function uses a `revert`
    * opcode (which leaves remaining gas untouched) while Solidity uses an
    * invalid opcode to revert (consuming all remaining gas).
    *
    * Requirements:
    * - The divisor cannot be zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

// File: @openzeppelin/contracts/utils/Address.sol

/**
* @dev Collection of functions related to the address type,
*/
library Address {
    /**
    * @dev Returns true if `account` is a contract.
    *
    * This test is non-exhaustive, and there may be false-negatives: during the
    * execution of a contract's constructor, its address will be reported as
    * not containing a contract.
    *
    * > It is unsafe to assume that an address for which this function returns
    * false is an externally-owned account (EOA) and not a contract.
    */
    function isContract(address account) internal view returns (bool) {
        // This method relies in extcodesize, which returns 0 for contracts in
        // construction, since the code is only stored at the end of the
        // constructor execution.

        uint256 size;
        // solhint-disable-next-line no-inline-assembly
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}

// File: @openzeppelin/contracts/token/ERC20/SafeERC20.sol

/**
* @title SafeERC20
* @dev Wrappers around ERC20 operations that throw on failure (when the token
* contract returns false). Tokens that return no value (and instead revert or
* throw on failure) are also supported, non-reverting calls are assumed to be
* successful.
* To use this library you can add a `using SafeERC20 for ERC20;` statement to your contract,
* which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
*/
library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint256 value) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        // solhint-disable-next-line max-line-length
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).add(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender).sub(value);
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    /**
    * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
    * on the return value: the return value is optional (but if data is returned, it must not be false).
    * @param token The token targeted by the call.
    * @param data The call data (encoded using abi.encode or one of its variants).
    */
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves.

        // A Solidity high level call has three parts:
        //  1. The target address is checked to verify it contains contract code
        //  2. The call itself is made, and success asserted
        //  3. The return value is decoded, which in turn checks the size of the returned data.
        // solhint-disable-next-line max-line-length
        require(address(token).isContract(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

// File: @openzeppelin/contracts/utils/ReentrancyGuard.sol

/**
* @dev Contract module that helps prevent reentrant calls to a function.
*
* Inheriting from `ReentrancyGuard` will make the `nonReentrant` modifier
* available, which can be aplied to functions to make sure there are no nested
* (reentrant) calls to them.
*
* Note that because there is a single `nonReentrant` guard, functions marked as
* `nonReentrant` may not call one another. This can be worked around by making
* those functions `private`, and then adding `external` `nonReentrant` entry
* points to them.
*/
contract ReentrancyGuard {
    /// @dev counter to allow mutex lock with only one SSTORE operation
    uint256 private _guardCounter;

    constructor () {
        // The counter starts at one to prevent changing it from zero to a non-zero
        // value, which is a more expensive operation.
        _guardCounter = 1;
    }

    /**
    * @dev Prevents a contract from calling itself, directly or indirectly.
    * Calling a `nonReentrant` function from another `nonReentrant`
    * function is not supported. It is possible to prevent this from happening
    * by making the `nonReentrant` function external, and make it call a
    * `private` function that does the actual work.
    */
    modifier nonReentrant() {
        _guardCounter += 1;
        uint256 localCounter = _guardCounter;
        _;
        require(localCounter == _guardCounter, "ReentrancyGuard: reentrant call");
    }
}

// File: @openzeppelin/contracts/ownership/Ownable.sol

/**
* @dev Contract module which provides a basic access control mechanism, where
* there is an account (an owner) that can be granted exclusive access to
* specific functions.
*
* This module is used through inheritance. It will make available the modifier
* `onlyOwner`, which can be aplied to your functions to restrict their use to
* the owner.
*/
contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
    * @dev Initializes the contract setting the deployer as the initial owner.
    */
    constructor () {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    /**
    * @dev Returns the address of the current owner.
    */
    function owner() public view returns (address) {
        return _owner;
    }

    /**
    * @dev Throws if called by any account other than the owner.
    */
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    /**
    * @dev Returns true if the caller is the current owner.
    */
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }

    /**
    * @dev Leaves the contract without owner. It will not be possible to call
    * `onlyOwner` functions anymore. Can only be called by the current owner.
    *
    * > Note: Renouncing ownership will leave the contract without an owner,
    * thereby removing any functionality that is only available to the owner.
    */
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    /**
    * @dev Transfers ownership of the contract to a new account (`newOwner`).
    * Can only be called by the current owner.
    */
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }

    /**
    * @dev Transfers ownership of the contract to a new account (`newOwner`).
    */
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

interface AggregatorInterface {
    function latestAnswer() external view returns (int256);
    function latestTimestamp() external view returns (uint256);
    function latestRound() external view returns (uint256);
    function getAnswer(uint256 roundId) external view returns (int256);
    function getTimestamp(uint256 roundId) external view returns (uint256);

    event AnswerUpdated(int256 indexed current, uint256 indexed roundId, uint256 updatedAt);
    event NewRound(uint256 indexed roundId, address indexed startedBy, uint256 startedAt);
}

// File: contracts/PrivateSale.sol

contract PrivateSale is Ownable, ReentrancyGuard{
    
    using SafeMath for uint256;
    using SafeERC20 for IERC20;

    struct User{
        address userAddresss;
        uint tokenPurchased;
        uint amountPayedInETH;
        uint amountPayedInMATIC;
        uint amountPayedInUSDT;
        address[] referlist;
    }
    
    // The token being sold
    IERC20 public _token;
    
    IERC20 public _usdt;

    IERC20 public _matic;

    AggregatorInterface public datafeed = AggregatorInterface(0x0567F2323251f0Aab15c8dFb1967E4e8A7D42aeE);
    
    // Address where funds are collected
    address payable internal _wallet;
    
    uint256 public minAmount = 70 ether;

    uint256 public maxAmount = 700 ether;
    
    // How many token units a buyer gets per wei.
    // The rate is the conversion between wei and the smallest and indivisible token unit.
    // So, if you are using a rate of 1 with a ERC20Detailed token with 3 decimals called TOK
    // 1 wei will give you 1 unit, or 0.001 TOK.
    uint256 internal _bonus;
    uint256 internal _rate;

    // Amount of wei raised
    uint256 private _weiRaised;

    uint256 public precisionFactor;

    uint256 public prePrecisionFactor;

    uint256 public hardcap;

    uint256 public startTime;

    uint256 public expiryTime = 180 days;
    
    bool public isPaused;
    
    mapping (address => bool) public isValidUser;
    mapping (address => User) public userInfo;

    /**
    * Event for token purchase logging
    * @param purchaser who paid for the tokens
    * @param beneficiary who got the tokens
    * @param value weis paid for purchase
    * @param amount amount of tokens purchased
    */
    event TokensPurchased(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);
    
    constructor(uint rate, address payable wallet, IERC20 token, IERC20 usdt, IERC20 matic) {
        require(rate > 0, "PrivateSale: rate is 0");
        require(wallet != address(0), "PrivateSale: wallet is the zero address");
        require(address(token) != address(0), "PrivateSale: token is the zero address");

        _rate = rate;
        _wallet = wallet;
        _token = token;
        _usdt = usdt;
        _matic = matic;
        startTime = block.timestamp;
        isPaused = true;
    }
    
    function pauseSale() public onlyOwner{
        isPaused = true;
    }
    
    function unPauseSale() public onlyOwner{
        isPaused = false;
    }
    
    function setMinAmount(uint _amount) public onlyOwner{
        minAmount = _amount;
    }
    
    function setMaxAmount(uint _amount) public onlyOwner{
        maxAmount = _amount;
    }

    function withdrawToken(address beneficary, uint tokenAmount) public onlyOwner{
        _token.transfer(beneficary, tokenAmount);
    }
    
    function withdrawBUSDToken(address beneficary, uint tokenAmount) public onlyOwner{
        _usdt.transfer(beneficary, tokenAmount);
    }

    function setPrecisionFactor(uint value) public onlyOwner{
        precisionFactor = value;
    }

    function setPrePrecisionFactor(uint value) public onlyOwner{
        prePrecisionFactor = value;
    }
    
    function setRate(uint Rate) public onlyOwner returns(uint){ 
        _rate = Rate;
        return _rate;
    }
    
    function setBonus(uint Bonus) public onlyOwner returns(uint){ 
        _bonus = Bonus;
        return _bonus;
    }

    function setWallet(address payable Wallet) public onlyOwner returns(address){ 
        _wallet = Wallet;
        return _wallet;
    }
    
    /**
    * @return the token being sold.
    */
    function getToken() public view returns (IERC20) {
        return _token;
    }

    /**
    * @return the address where funds are collected.
    */
    function getwallet() public view returns (address payable) {
        return _wallet;
    }

    /**
    * @return the number of token units a buyer gets per wei.
    */
    function getRate() public view returns (uint256) {
        return _rate;
    }
    
    /**
    * @return the bonus percentage user get on buy tokens.
    */
    function getBonus() public view returns (uint256) {
        return _bonus;
    }

    /**
    * @return the amount of wei raised.
    */
    function weiRaised() public view returns (uint256) {
        return _weiRaised;
    }

    /**
    * @dev low level token purchase ***DO NOT OVERRIDE***
    * This function has a non-reentrancy guard, so it shouldn't be called by
    * another `nonReentrant` function.
    * @param beneficiary Recipient of the token purchase
    */
    function buyTokens(IERC20 tokenAddress, address referral, address beneficiary, uint256 _amount) public nonReentrant {
        require(!isPaused, "ICO is Paused");
        require(_amount >= minAmount, "Please purchase min amount of INA");
        require(tokenAddress == _usdt || tokenAddress == _matic, "Please enter valid token address");
        require(block.timestamp < startTime.add(expiryTime), "Sale ended");
        require(hardcap >= _weiRaised.add(_amount), "Hardcap reached");
        uint256 weiAmount = _amount;
        
        tokenAddress.transferFrom(msg.sender, address(this), _amount);
        
        _preValidatePurchase(beneficiary, weiAmount);

        // calculate token amount to be created
        uint256 tokens = _getTokenAmount(weiAmount);

        // update state
        _weiRaised = _weiRaised.add(weiAmount);

        userInfo[beneficiary].userAddresss = beneficiary;
        if(tokenAddress == _matic){
            userInfo[beneficiary].amountPayedInMATIC = userInfo[beneficiary].amountPayedInMATIC.add(_amount);
        }else{
            userInfo[beneficiary].amountPayedInUSDT = userInfo[beneficiary].amountPayedInUSDT.add(_amount);
        }
        
        userInfo[beneficiary].tokenPurchased = userInfo[beneficiary].tokenPurchased.add(tokens);

        _processPurchase(beneficiary, tokens);
        
        isValidUser[beneficiary] = true;
        emit TokensPurchased(msg.sender, beneficiary, weiAmount, tokens);

        // _forwardFunds(_amount);

    }

    /**
    * @dev low level token purchase ***DO NOT OVERRIDE***
    * This function has a non-reentrancy guard, so it shouldn't be called by
    * another `nonReentrant` function.
    * @param beneficiary Recipient of the token purchase
    */
    function buyTokensWithBNB(address referral, address beneficiary) public nonReentrant payable {
        require(!isPaused, "ICO is Paused");
        uint256 weiAmount = msg.value;
        uint256 price = getprice(weiAmount);
    
        require(price >= minAmount, "Please purchase min amount of INA");
        _preValidatePurchase(beneficiary, price);

        // calculate token amount to be created
        uint256 tokens = _getTokenAmount(price);

        // update state
        _weiRaised = _weiRaised.add(price);

        userInfo[beneficiary].userAddresss = beneficiary;
        
        userInfo[beneficiary].amountPayedInETH = userInfo[beneficiary].amountPayedInETH.add(weiAmount);
        
        
        userInfo[beneficiary].tokenPurchased = userInfo[beneficiary].tokenPurchased.add(tokens);

        _processPurchase(beneficiary, tokens);
        
        isValidUser[beneficiary] = true;
        emit TokensPurchased(msg.sender, beneficiary, price, tokens);

        // _forwardFunds();

    }

    /**
    * @dev Validation of an incoming purchase. Use require statements to revert state when conditions are not met.
    * Use `super` in contracts that inherit from Crowdsale to extend their validations.
    * Example from CappedCrowdsale.sol's _preValidatePurchase method:
    *     super._preValidatePurchase(beneficiary, weiAmount);
    *     require(weiRaised().add(weiAmount) <= cap);
    * @param beneficiary Address performing the token purchase
    * @param weiAmount Value in wei involved in the purchase
    */
    function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal view {
        require(beneficiary != address(0), "Crowdsale: beneficiary is the zero address");
        require(weiAmount != 0, "Crowdsale: weiAmount is 0");
    }

    /**
    * @dev Source of tokens. Override this method to modify the way in which the crowdsale ultimately gets and sends
    * its tokens.
    * @param beneficiary Address performing the token purchase
    * @param tokenAmount Number of tokens to be emitted
    */
    function _deliverTokens(address beneficiary, uint256 tokenAmount) private {
        _token.transfer(beneficiary, tokenAmount);
    }

    /**
    * @dev Executed when a purchase has been validated and is ready to be executed. Doesn't necessarily emit/send
    * tokens.
    * @param beneficiary Address receiving the tokens
    * @param tokenAmount Number of tokens to be purchased
    */
    function _processPurchase(address beneficiary, uint256 tokenAmount) private {
        _deliverTokens(beneficiary, tokenAmount);
    }

    /**
    * @dev Override to extend the way in which ether is converted to tokens.
    * @param weiAmount Value in wei to be converted into tokens
    * @return Number of tokens that can be purchased with the specified _weiAmount
    */
    function _getTokenAmount(uint256 weiAmount) public view returns (uint256) {
        uint tokens = weiAmount.mul(_rate).div(prePrecisionFactor);
        return (tokens + (tokens.mul(_bonus).div(precisionFactor)));
    }

    function getRateBNB(uint256 weiAmount) public view returns (uint256) {
        uint256 usdAmount = getprice(weiAmount.div(1e18));
        uint256 tokens = usdAmount.mul(1e18).mul(_rate).div(prePrecisionFactor);
        return (tokens + (tokens.mul(_bonus).div(precisionFactor)));
    }

    /**
    * @dev Determines how ETH is stored/forwarded on purchases.
    */
    function _forwardFunds(uint256 amount) private {
        _usdt.transfer(address(this), amount);
    }
    
    function withdrawAnyERC20Token(address tokenAddress, address beneficary, uint tokenAmount) public onlyOwner{
        IERC20(tokenAddress).transfer(beneficary, tokenAmount);
    }

    function withdrawFund(address destination) public onlyOwner returns(bool){
        uint balance = address(this).balance;
        (bool success, ) = destination.call{value:balance}("");
        return success;
    }

    function getprice(uint value) public view returns(uint256) {
        uint256 price = ((uint256(datafeed.latestAnswer()).mul(1e10)).mul(value)).div(1e18);
        return price;
    }

}