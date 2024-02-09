//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract voting{
    struct Voter{
        uint id;
        string name;
        uint voteCount; 
        uint age;
    }

    mapping(uint=>bool) public voters; //if voted or not
    mapping(uint => Voter) public candidate; 
    mapping(uint=>bool) public validCandidate; // valid or not (above 18)

    uint public candidateCount;

    function addCandidate(uint _id, string memory _name,uint _age) public{
        candidate[_id].name = _name;
        candidate[_id].age = _age;
        candidateCount++;
    }

    function validate(uint _id) public{
        require(candidate[_id].age>=18,"Validation not possible");
        validCandidate[_id]=true;
    }


    function vote(uint _id) public{
        require(candidate[_id].voteCount == 0,"You already voted");
        require(validCandidate[_id]==true,"You are not a valid candidate");
        candidate[_id].voteCount=1;
        voters[_id]=true;
    }

    
}
