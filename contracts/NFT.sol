// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";


contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;
    address admin;

    constructor(address marketplaceAddress) ERC721("Onexi NFT", "ONEXINFT") {
        contractAddress = marketplaceAddress;
        admin = msg.sender;
    }

    function createToken(string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);
        return newItemId;
    }

    function burn(uint tokenId) external {
        require(_isApprovedOrOwner(msg.sender, tokenId), "caller is not owner nor approved");
        _burn(tokenId);
    }

    function changeMarketplace(address marketplaceAddress) public {
        require(msg.sender == admin, "You are not Admin");
        contractAddress = marketplaceAddress;
    }
}