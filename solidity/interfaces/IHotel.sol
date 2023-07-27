// SPDX-License-Identifier: UNLICENSE

pragma solidity >=0.8.2 <0.9.0;

import {Hotel} from "./IBlockHotelIssue.sol"; 

struct Stay {
    uint256 hotelId; 
    uint256 totalNights; 
    uint256 nightsSpent; 
    uint256 nightsRemaining; 
    uint256 [] hotelBearerTokenIds; 
    uint256 dateCheckedIn;
    address guest;  
}
/** 
 @dev IHotel 
 The IHotel represents the front desk of the hotel. The guest is able to check in, extend their stay and check out. 
 They can also check the status of their stay
 */
interface IHotel { 

    function getHotel() view external returns (Hotel memory _hotel);

    function getStay() view external returns (Stay memory _stay);

    function checkIn(uint256 [] memory _hotelBearerTokenIds) external returns (Stay memory _stay);

    function extendStay(uint256 [] memory _hotelBearerTokenIds) external returns (Stay memory _newStay);

    function checkOut() external returns (Stay memory _stay);

    function isCheckedIn() view external returns (bool _isCheckedIn);

}