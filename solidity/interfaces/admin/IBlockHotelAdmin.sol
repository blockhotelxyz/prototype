// SPDX-License-Identifier: UNLICENSE

pragma solidity >=0.8.2 <0.9.0;

import {Hotel, RoomType} from "../IHotel.sol";
import {RoomTypeRequest, HotelBearerTokenEpoc} from "../IBlockHotelIssue.sol";


struct HotelBearerTokenMetadata { 
    HotelRoom room; 
    uint256 useDate; 
}

struct HotelRoom {
    uint256 id; 
    uint256 roomNumber; 
    uint256 roomTypeId; 
}

struct ProvisioningCost { 
    uint256 id; 
    uint256 agreementId; 
    address customer; 
    address staff; 
    RoomTypeRequest [] roomTypeRequest; 
    uint256 [] allocatedHotelBearerTokenIds; 
}

struct ProvisioningAgreement { 
    uint256 id; 
    uint256 startDate; 
    uint256 endDate; 
    address customer; 
    string aperReference; 


}

interface IBlockHotelAdmin { 

    function getHotel() view external returns (Hotel memory _hotel);

    function getTotalRegisteredRooms() view external returns (uint256 _count);

    function registerRooms(HotelRoom [] memory hotelRooms) external returns (uint256 _count);

    function isRegisteredRoom(uint256 _roomNumber) view external returns (bool _isRegistered);

    function getRoom(uint256 _roomNumber) view external returns (HotelRoom memory _hotelRoom);

    function updateHotel(Hotel memory _hotel) external returns (bool _updated);

    function uploadHotelBearerTokenInventory(HotelBearerTokenMetadata [] memory _metadata, bool _newEpoc) external returns (uint256 _uploadCount, HotelBearerTokenEpoc memory _epoc);

    function registerAgreement(ProvisioningAgreement memory _agreement) external returns (bool _registered);

    function cancelAgreement(uint256 _agreementId) external returns (bool _cancelled);

    function provisionAllocation(address _customer, uint256 agreementId, RoomTypeRequest [] memory _roomTypeRequest) external returns (ProvisioningCost memory _cost); 

}