// SPDX-License-Identifier: MIT
// cast --to-base 0x71b5e dec to convert from hex value to decimal
pragma solidity ^0.8.19;

contract SimpleStorage{
    uint256 myFavNum ;
    struct Person{
        uint256 favNum;
        string name;
    }
    Person[] public people;

    mapping(string => uint256) public nameToFavNum;

    function store(uint256 _favNum) public {
        myFavNum = _favNum;
    }
    function retrieve() public view returns(uint256){
        return myFavNum;
    }
    function addPerson(uint256 _favNum , string memory name) public {
        people.push(Person(_favNum , name));
        nameToFavNum[name] = _favNum;
    }

    function getPerson() external view returns(uint256 , bytes32){
        return ( people[0].favNum , keccak256(abi.encodePacked(people[0].name)));
    }
    function getNameToFavNum(string memory name) external view returns(uint256){
        return nameToFavNum[name];
    }
}
