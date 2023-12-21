// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract LW3_ToDo {

    struct Task {
        uint id;
        address taskOwner;
        string taskName;
        bool completedYet;
        uint completedTime;
    }

    mapping (uint256 => Task) task;

    uint256 taskCount;

    function createTask(string memory _task) external returns(uint256) {

        uint256 id = taskCount++;

        Task storage t = task[id];

        t.taskOwner = msg.sender;
        t.taskName = _task;
        t.completedYet = false;
        t.completedTime = 0;

        return id;
    }

    function toggleTask(uint index) external {
        Task storage t = task[index];

        require(t.taskOwner == msg.sender, "You're not the owner");
        if(!task[index].completedYet) {
            task[index].completedTime = block.timestamp;
        } else {
            task[index].completedTime = 0;
        }
        task[index].completedYet = !task[index].completedYet;
    } 

    function getTaskName(uint256 id) external view returns (string memory) {
        Task storage t = task[id];
        require(t.taskOwner == msg.sender, "You're not the owner");

        return t.taskName;
    }

     function getTaskCompleted(uint256 id) external view returns (bool) {
        Task storage t = task[id];
        require(t.taskOwner == msg.sender, "You're not the owner");

        return t.completedYet;
    }
}

// https://sepolia.etherscan.io/address/0x6b9e8b933a67afecace67a5b7c4d977d04793c4f#code