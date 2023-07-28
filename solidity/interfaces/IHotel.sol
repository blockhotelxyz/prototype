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

    // returns the hotel data
    function getHotel() view external returns (Hotel memory _hotel);

    // returns the latest active stay of the caller, reverts if there isn't one
    function getStay() view external returns (Stay memory _stay);

    // checks the caller into the hotel for the nights represented by the given hotelBearerTokenIds, returns a stay describing the guest's entire stay
    // if the hotel bearer token ids presented are not contiguous, the stay represents the stay to the first break
    function checkIn(uint256 [] memory _hotelBearerTokenIds) external returns (Stay memory _stay);

    // extends any existing stay with the given hotel bearer token ids if they are contiguous or overlapping otherwise revert 
    function extendStay(uint256 [] memory _hotelBearerTokenIds) external returns (Stay memory _newStay);

    // checks the caller out of their stay, returning the stay updated with nights spent and nights remaining
    // any unspent nights are valid for further use via re-checkin
    function checkOut() external returns (Stay memory _stay);

    // returns whether or not the caller is checked in
    function isCheckedIn() view external returns (bool _isCheckedIn);

}