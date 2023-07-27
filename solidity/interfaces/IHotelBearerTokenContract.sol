//SPDX-License-Identifier: UNLICENSE

pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

import {HotelBearerToken} from "./IBlockHotelIssue.sol";
/**
@dev IHotelBearerTokenContract 
The IHotelBearerTokenContract represents the actual bearer tokens that may or may not have an off chain component 
*/
interface IHotelBearerTokenContract is IERC721 { 

    function getHotelBearerTokens(uint256 [] memory _hotelBearerTokenIds) view external returns(HotelBearerToken [] memory _hotelBearerToken); 

}