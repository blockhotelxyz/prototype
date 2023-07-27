// SPDX-License-Identifier: Unlicense

pragma solidity >=0.8.2 <0.9.0;
/**
    @dev IBlockHotelIssue 
    The IBlockHotelIssue is responsible for issuing Hotel Bearer Token Allocations to the market on request. 
    All allocations have to be paid for before they are issued. 
    The allocation to a distributor or purchasing party is encapsulated within an allocation contract 
 */

struct Hotel { 
    uint256 id; 
    string name;
    address paymentCurrency;
    RoomType [] roomTypes; 
    uint256 totalRoomCount;
}

struct RoomType { 
    uint256 id; 
    string name; 
    uint256 maxOccupancy; 
    uint256 roomCount; 
    uint256 rate; 
}

struct RoomTypeRequest {
    uint256 roomTypeId; 
    uint256 roomCountPerNight; 
    uint256 [] dates; 
}

struct RoomNight { 
    uint256 id; 
    uint256 roomTypeId; 
    uint256 night; 
    uint256 bearerTokenId;
}

struct HotelBearerTokenEpoc {
    uint256 id; 
    address hotelBearerTokenContract;   
    uint256 startDate; 
    uint256 endDate; 
}

interface IBlockHotelIssue { 

    function getHotel() view external returns (Hotel memory _hotel);

    function getHotelBearerTokenEpocs() view external returns (HotelBearerTokenEpoc [] memory _epoc);

    function requestAllocation(RoomTypeRequest [] memory _roomTypeRequest) payable external returns (address _allocation);

}