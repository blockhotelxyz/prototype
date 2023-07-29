// SPDX-License-Identifier: UNLICENSE

pragma solidity >=0.8.2 <0.9.0;

import {Hotel, RoomType} from "../IHotel.sol";
import {RoomTypeRequest, HotelBearerTokenEpoc} from "../IBlockHotelIssue.sol";
/**
 @dev IBlockHotelAdmin 
 The IBlockHotelAdmin interface represents the mid and back office operations of the Hotel. 
 This is where the configuration of the Hotel, minting of Hotel Bearer Tokens and management of special provisioning agreements is done. 
 */
// the metadata used to create the Hotel Bearer Token on chain 
struct HotelBearerTokenMetadata { 
    HotelRoom room; 
    uint256 useDate; 
}

// the Hotel Room represents the room numbered physical hotel room 
// NOTE: a Hotel should typically NOT issue more bearer tokens than it has capacity for. 
struct HotelRoom {
    uint256 id; 
    uint256 roomNumber; 
    uint256 roomTypeId; 
    bool active; 
}
// the provisioning cost is the cost to issue the allocation of Hotel Bearer Tokens. 
// This is calculated based on the level of availability serviced based on the roomTypeRequest
struct ProvisioningCost { 
    uint256 id; 
    uint256 agreementId; 
    address customer; 
    address staff; 
    RoomTypeRequest [] roomTypeRequest; 
    address allocation; 
}

// the provisioning agreement is a representation of an off chain commercial agreement by which the Hotel will issue an allocation of Hotel Bearer Tokens 
// to the customer in exchange for off chain payment 
struct ProvisioningAgreement { 
    uint256 id; 
    uint256 startDate; 
    uint256 endDate; 
    address customer; 
    string paperReference; 
}

interface IBlockHotelAdmin { 

    function getHotel() view external returns (Hotel memory _hotel);

    function getRoom(uint256 _roomNumber) view external returns (HotelRoom memory _hotelRoom);

    function isRegisteredRoom(uint256 _roomNumber) view external returns (bool _isRegistered);

    function getTotalRegisteredRooms() view external returns (uint256 _count);

    function getProvisioningAgreement(uint256 _id) view external returns (ProvisioningAgreement memory _provisioningAgreement);

    function getProvisioningAgreementCosts(uint256 _id) view external returns (ProvisioningCost [] memory _cost);

    function isValidProvisioningAgreement(uint256 _id) view external returns (bool _isValidProvisioningAgreement);


    function updateHotel(Hotel memory _hotel) external returns (bool _updated);

    function registerRooms(HotelRoom [] memory _hotelRooms) external returns (uint256 _count);

    function updateRoom(HotelRoom [] memory _hotelRooms) external returns (uint256 _count);


    function registerAgreement(ProvisioningAgreement memory _agreement) external returns (bool _registered);

    function cancelAgreement(uint256 _agreementId) external returns (bool _cancelled);



    function uploadHotelBearerTokenInventory(HotelBearerTokenMetadata [] memory _metadata, bool _newEpoc) external returns (uint256 _uploadCount, HotelBearerTokenEpoc memory _epoc);

    function provisionAllocation(address _customer, uint256 agreementId, RoomTypeRequest [] memory _roomTypeRequest) external returns (ProvisioningCost memory _cost); 

}