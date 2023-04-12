// SPDX-License-Identifier: GPL-3.0 

pragma solidity >= 0.7.0 <0.9.0;

contract MedicalReviewSystem {
    struct Review {
        string patientName;
        string doctorName;
        uint date;
        string diagnosis;
        string treatmentPlan;
        uint rating;
    }
    
    mapping(address => Review[]) private reviews;
    
    function addReview(string memory _patientName, string memory _doctorName, uint _date, string memory _diagnosis, string memory _treatmentPlan, uint _rating) public {
        Review memory newReview = Review({
            patientName: _patientName,
            doctorName: _doctorName,
            date: _date,
            diagnosis: _diagnosis,
            treatmentPlan: _treatmentPlan,
            rating: _rating
        });
        reviews[msg.sender].push(newReview);
    }
    
    function getReviews(address _user) public view returns (Review[] memory) {
        return reviews[_user];
    }
    
    function updateReview(uint _index, string memory _patientName, string memory _doctorName, uint _date, string memory _diagnosis, string memory _treatmentPlan, uint _rating) public {
        require(_index < reviews[msg.sender].length, "Invalid index");
        
        Review storage reviewToUpdate = reviews[msg.sender][_index];
        
        reviewToUpdate.patientName = _patientName;
        reviewToUpdate.doctorName = _doctorName;
        reviewToUpdate.date = _date;
        reviewToUpdate.diagnosis = _diagnosis;
        reviewToUpdate.treatmentPlan = _treatmentPlan;
        reviewToUpdate.rating = _rating;
    }
}
