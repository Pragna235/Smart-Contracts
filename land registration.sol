// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract landReg{
    address public owner;
    struct Land{
        string name;
        address landOwner;
        string location;
        uint price;
    }

    mapping(address => uint) public balance;
    mapping(uint => Land) public land; //uint = survey number
    mapping(uint => bool) public check;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==owner,"You are not the Owner");
        _;
    }

    modifier onlySeller(uint _surveyNum, address from){
        require(msg.sender == land[_surveyNum].landOwner,"You are not Owner");
        _;
    }

    function addLand(uint _surveyNum, address _landOwner, string memory _name, string memory _location, uint _price)public onlyOwner{
        land[_surveyNum].landOwner = _landOwner;
        land[_surveyNum].name = _name;
        land[_surveyNum].location = _location;
        land[_surveyNum].price = _price;
        check[_surveyNum] = true;
    }

    function addBalance(address _add) public{
        balance[_add] += 50000;
    }

    function transfer(uint _surveyNum,string memory _name, address from, address to) public onlySeller(_surveyNum,from){
        require(check[_surveyNum]==true,"Survey Number does not exist");
        require(balance[to]>land[_surveyNum].price,"Sorry, not wnough balance");
        balance[to] -= land[_surveyNum].price;
        balance[from] += land[_surveyNum].price;
        land[_surveyNum].name = _name;
        land[_surveyNum].landOwner = to;
    }

    
    
}
