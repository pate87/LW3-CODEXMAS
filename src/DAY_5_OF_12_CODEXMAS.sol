// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract LW3_Baskeball_Struct {

    struct Player {
        uint256 id;
        address creater;
        string playerName;
        string teamName;
        uint8 age;
        string position;
        uint8 heigt;
    }

    mapping (uint256 => Player) player;

    uint256 numPlayer;

    function setPlayer(string calldata _playerName, string calldata _teamName, uint8 _age, string calldata _position, uint8 _height) external returns(uint256) {

        uint256 _id = numPlayer++;

        Player storage p = player[_id];
    
        p.creater = msg.sender;
        p.playerName = _playerName;
        p.teamName = _teamName;
        p.age = _age;
        p.position = _position;
        p.heigt = _height;

        return _id;
    }

    function getPlayerName(uint256 _id) external view returns(string memory) {
        Player storage p = player[_id];
        return p.playerName;
    }
}