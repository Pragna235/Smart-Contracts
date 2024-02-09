//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Library{
    struct Book{
        uint id;
        string name;
        string author;
        uint rating;
        string language;
    }

    mapping(uint=>Book) public books;

    function addBook(uint _id, string memory _name, string memory _author, uint _rating, string memory _language) public{
        books[_id].id = _id;
        books[_id].name = _name;
        books[_id].author = _author;
        books[_id].rating = _rating;
        books[_id].language = _language;
    }

    function getDetails(uint _id) public view returns(Book memory){
        return books[_id];
    }
}
