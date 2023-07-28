// SPDX-License-Identifier: UNLICENSE

pragma solidity >=0.8.2 <0.9.0;
/**
    @dev IBlockHotelIssue 
    The IBlockHotelIssue is responsible for issuing Hotel Bearer Token Allocations to the market on request. 
    All allocations have to be paid for before they are issued. 
    The allocation to a distributor or purchasing party is encapsulated within an allocation contract 
 */

/**
 @dev Hotel 
 Basic on chain representation of a Hotel with it's associated room types
 */
struct Hotel { 
    uint256 id; 
    string name;
    address paymentCurrency;
    RoomType [] roomTypes; 
    uint256 totalRoomCount;
}
/**
 @dev RoomType 
 Representation of a Hotel Room Type with a basic rate attached this is the evergreen rate
 */
struct RoomType { 
    uint256 id; 
    string name; 
    uint256 maxOccupancy; 
    uint256 roomCount; 
    uint256 rate; 
}
/**
 @dev RoomTypeRequest
 Representation of a request for a max number of particular roomType over a set of dates 
 */
struct RoomTypeRequest {
    uint256 roomTypeId; 
    uint256 roomCountPerNight; 
    uint256 [] dates; 
}
/**
 @dev Night 
 Representation of a particular Night at the Hotel with the associated HotelBearerTokenIds for the available rooms on that night
 */
struct Night { 
    uint256 id; 
    uint256 date; 
    uint256 [] hotelBearerTokenIds; 
}
/**
 @dev HotelBearerToken 
 The onchain representation of the Hotel Bearer Token. This may have an off chain non-functional element 
 */
struct HotelBearerToken {
    uint256 id; // this should be the same as the NFT id
    uint256 roomNightId; 
    uint256 roomTypeId; 
    uint256 issueDate;
    uint256 useDate; 
}
/**
 @dev HotelBearerTokenEpoc
 This is the time period covered by the given HotelBearerTokenContract ranging from 3 months to a year 
 */
struct HotelBearerTokenEpoc {
    uint256 id; 
    address hotelBearerTokenContract;   
    uint256 startDate; 
    uint256 endDate; 
}
/**
 @dev IBlockHotelIssue
 This is the Hotel Bearer Token Issuance interface used by Hotel Bearer Token Distributors usually at the beginning of the value chain
 */
interface IBlockHotelIssue { 

    // returns the Hotel for which Hotel Bearer Tokens will be issued
    function getHotel() view external returns (Hotel memory _hotel);

    // returns the epocs that have been traversed by the Hotel 
    function getHotelBearerTokenEpocs() view external returns (HotelBearerTokenEpoc [] memory _epoc);

    // requests an allocation of roomTypes on particular dates from the Hotel in exchange for payment for said allocation 
    // payment sent should be for the maximum cost of the allocation 
    // discounts will be applied by the hotel and will reflect in the amount not charged
    function requestAllocation(RoomTypeRequest [] memory _roomTypeRequest) payable external returns (address _allocation);

}