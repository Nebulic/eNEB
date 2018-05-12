pragma solidity ^0.4.18;

import './SafeMath.sol';
import './ERC20Interface.sol';

contract NebToken is ERC20 {
  using SafeMath for uint256;

  string public name = "Nebula Network Token";
  string public symbol = "NEB";
  uint8 public decimals = 0;
  address public treasury;
  uint256 public totalSupply;

  mapping (address => uint256) public balances;
  mapping (address => mapping (address => uint256)) internal allowed;

  constructor(uint256 _totalSupply) public {
    treasury = msg.sender;
    totalSupply = _totalSupply;
    balances[treasury] = totalSupply;
    emit Transfer(0x0, treasury, totalSupply);
  }

  function balanceOf(address _addr) public view returns(uint256) {
    return balances[_addr];
  }

  function transfer(address _to, uint256 _amount) public returns (bool) {
    require(_to != address(0));
    require(_amount <= balances[msg.sender]);

    balances[msg.sender] = balances[msg.sender].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    emit Transfer(msg.sender, _to, _amount);
    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }

  function transferFrom(address _from, address _to, uint256 _amount) public returns (bool) {
    require(_to != address(0));
    require(_amount <= balances[_from]);
    require(_amount <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].sub(_amount);
    balances[_to] = balances[_to].add(_amount);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
    emit Transfer(_from, _to, _amount);
    return true;
  }

  function approve(address _spender, uint256 _amount) public returns (bool) {
      allowed[msg.sender][_spender] = _amount;
      emit Approval(msg.sender, _spender, _amount);
      return true;
  }

}
