// Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Blog is ERC721URIStorage, Ownable
{
    constructor() ERC721("Marketplace", "NFT") Ownable(msg.sender) 
    {}

    uint256 currentTokenID = 0;

    struct ListedArticle
    {
        address author;
        uint price;
        // uint tokenID;
        string articleMetadataURI;
        // bool isMinted;
    }


    ListedArticle[] public listedArticles;
    // mapping( string => uint ) private uri_buyerMap;   // TokenURI => collectionId
 
    // uint currentCollectionId = 0;

    function AddArticle( string memory _articleMetadataURI, uint price ) external
    {
        ListedArticle memory newArticle = ListedArticle( msg.sender, price , _articleMetadataURI );
        listedArticles.push(newArticle);
        // tok_collectionMap[_articleMetadataURI] = currentCollectionId;
    }

    function GetListedArticles() external view returns ( string[] memory )
    {
        string[] memory articleURIs = new string[](listedArticles.length);
        for (uint i = 0; i < listedArticles.length; i++) {
            articleURIs[i] = listedArticles[i].articleMetadataURI;
        }
        return articleURIs;
        // collections[0].GetAvailableNFTs();
    }

    // function GetListedArticlesByAuthor() external view returns ( string[] memory, bool[] memory, bool[] memory, bool[] memory, bool[] memory )
    // {
    //     // uint totalLength = 0;
    //     // for (uint i = 0; i < collections.length; i++) {
    //     //     totalLength += collections[i].GetAvailableNFTs().length;
    //     // }

    //     string[] memory articles = new string[](listedArticles.length);
    //     // bool[] memory isMinted = new bool[](listedArticles.length);
    //     // bool[] memory recieved = new bool[](listedArticles.length);
    //     // bool[] memory cancelled = new bool[](listedArticles.length);
    //     // bool[] memory collected = new bool[](listedArticles.length);
    //     // uint currentIndex = 0;
        
    //     for (uint i = 0; i < listedArticles.length; i++) {
    //         if( listedArticles[i].author == msg.sender )
    //         {
    //             articles[i] = listedArticles[i].articleMetadataURI;
    //             isMinted[i] = listedArticles[i].isMinted;
    //             recieved[i] = listedArticles[i].recieved;
    //             cancelled[i] = listedArticles[i].cancelled;
    //             collected[i] = listedArticles[i].isMoneyCollected;
    //         }
    //         else
    //         {
    //             articles[i] = "";
    //             isMinted[i] = false;
    //             recieved[i] = false;
    //             cancelled[i] = false;
    //             collected[i] = false;
    //         }
    //     }
    //     return (articles,isMinted,recieved,cancelled,collected);
    //     // collections[0].GetAvailableNFTs();
    // }

    // function mintNFT( string memory tokenURI)
    //     payable
    //     external

    // {
    //     uint index = 0;
    //     for( uint i = 0; i < listedArticles.length; i++)
    //     {
    //         if( keccak256(abi.encodePacked(listedArticles[i].articleMetadataURI)) == keccak256(abi.encodePacked(tokenURI)) )
    //         {
    //             console.log("W");
    //             index = i;
    //             break;
    //         }
    //     }
        
    //     // require(price <= msg.value, "Ether paid is incorrect");
    //     // require(URIMapping[tokenURI] == 0, "This NFT has already been minted");
    //     // URIMapping[tokenURI] += 1;
    //     // mintedAddress[msg.sender] += 1
    //     listedArticles[index].isMinted = true;
    //     listedArticles[index].buyer = msg.sender;

    //     _mint(msg.sender, listedArticles[index].tokenID);
    //     _setTokenURI(listedArticles[index].tokenID, tokenURI);

    // }

}