// SPDX-License-Identifier: UNLICENCE

pragma solidity >=0.8.2 <0.9.0;

import {Hotel, Night, RoomTypeRequest} from "./IBlockHotelIssue.sol";
/**
    @dev IBlockHotelAllocation 
    The IBlockHotelAllocation contract is responsible for managing the allocation that a distributor or purchaser may have acquired. 
 */

interface IBlockHotelAllocation { 

    // returns the hotel to whom this allocation is bonded
    function getHotel() view external returns (Hotel memory _hotel);

    // returns the dates that are held by this allocation 
    function getDates() view external returns (uint256 [] memory _dates);

    // returns the room types that were originally requested and the dates for which they were requested
    function getRoomTypeRequest() view external returns (RoomTypeRequest [] memory _roomTypeRequest);

    // returns the room nights that are held in this allocation for the dates requested
    function getNights(uint256 [] memory _dates) view external returns (Night [] memory _nights);

    // returns the room nights that are held for the dates for the given roomTypeIds
    function getNightsForRoomTypes(uint256 [] memory _dates, uint256 []  memory _roomTypeIds) view external returns (Night [] memory _nights);

    // returns the bearer token contract from which this allocation is derived
    function getHotelBearerTokenContract() view external returns (address _bearerTokenContract);

    // returns ids for all of the Hotel Bearer Tokens allocated to this contract 
    function getAllAllocatedHotelBearerTokenIds() view external returns (uint256 [] memory _hotelBearerTokenIds);

    // returns the owner of this allocation 
    function getOwner() view external returns (address _owner);
}