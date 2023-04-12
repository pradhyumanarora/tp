//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract VotingSystem {
    
    // Define a structure for each candidate
    struct Candidate {
        string name;
        uint voteCount;
    }
    
    // Define an array of candidates
    Candidate[] public candidates;
    
    // Define a mapping to store the voter's address and their vote
    mapping(address => bool) public voters;
    
    // Define a function to add a candidate
    function addCandidate(string memory name) public {
        candidates.push(Candidate({
            name: name,
            voteCount: 0
        }));
    }
    
    // Define a function to vote for a candidate
    function vote(uint candidateIndex) public {
        // Check if the voter has already voted
        require(!voters[msg.sender], "You have already voted.");
        
        // Check if the candidate index is valid
        require(candidateIndex >= 0 && candidateIndex < candidates.length, "Invalid candidate index.");
        
        // Record the voter's vote
        voters[msg.sender] = true;
        
        // Increment the candidate's vote count
        candidates[candidateIndex].voteCount++;
    }
    
    // Define a function to get the total number of candidates
    function getCandidateCount() public view returns (uint) {
        return candidates.length;
    }
    
    // Define a function to get a candidate's name and vote count
    function getCandidate(uint candidateIndex) public view returns (string memory, uint) {
        // Check if the candidate index is valid
        require(candidateIndex >= 0 && candidateIndex < candidates.length, "Invalid candidate index.");
        
        // Return the candidate's name and vote count
        return (candidates[candidateIndex].name, candidates[candidateIndex].voteCount);
    }
}
