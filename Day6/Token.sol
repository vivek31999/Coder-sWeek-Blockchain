pragma solidity >=0.4.22 <0.7.0;

contract Token{
    address owner;
    uint totalTokens;
    string name;
    
    mapping(address=>uint) balance;
    
    constructor(string memory _name, uint _totalTokens) public{
        owner = msg.sender;
        name = _name;
        totalTokens = _totalTokens;
    
        balance[owner] = totalTokens;
        
    }
    
    event Transfer(address indexed _from, address indexed _to, uint _value);
    
    function totalOnNet() view public returns(uint){
        return totalTokens;
    }
    
    function balanceMoney(address _owner) view public returns(uint){
        return balance[_owner];
    }
    
    function transfer(address _to, uint _value) public returns (bool){
        require(balance[msg.sender]> _value);
        address _from = msg.sender;
        owner = _to;
        emit Transfer(_from, _to, _value);
        balance[_from] -= _value;
        balance[_to] += _value;
        return true;
    }
    
}
