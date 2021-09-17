// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFM is ERC721, ERC721URIStorage, Pausable, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    string private _currentTokenUri = "";

    constructor(string memory tokenUri) ERC721("NFM", "NFM") {
        _currentTokenUri = tokenUri;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function setCurrentTokenUri(string memory tokenUri) public onlyOwner {
        _currentTokenUri = tokenUri;
    }

    function safeMint() public whenNotPaused {
        uint id = _tokenIdCounter.current();
        _safeMint(msg.sender, id);
        _setTokenURI(id, _currentTokenUri);
        _tokenIdCounter.increment();
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}