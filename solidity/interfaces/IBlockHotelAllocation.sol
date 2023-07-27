// SPDX-License-Identifier: Unlicense

pragma solidity >=0.8.2 <0.9.0;

import {Hotel, RoomNight} from "./IBlockHotelIssue.sol";
/**
    @dev IBlockHotelAllocation 
    The IBlockHotelAllocation contract is responsible for managing the allocation that a distributor or purchaser may have acquired. 
 */

interface IBlockHotelAllocation { 

    function getHotel() view external returns (Hotel memory _hotel);

    function getDates() view external returns (uint256 [] memory _dates);

    function getRooms(uint256 [] memory _dates) view external returns (RoomNight [] memory _roomNights);

    function getRooms(uint256 [] memory _dates, uint256 []  memory _roomTypeIds) view external returns (RoomNight [] memory _roomNights);

    function getHotelBearerTokenContract() view external returns (address _bearerTokenContract);

    function getOwner() view external returns (address _owner);

}