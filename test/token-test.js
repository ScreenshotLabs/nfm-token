const { expect } = require("chai");

describe("NFMToken", function () {
  it("It should deploy the contract, mint a token, and resolve to the right URI", async function () {
    const NFT = await ethers.getContractFactory("NFMToken");
    const nft = await NFT.deploy();
    const URI = "ipfs://QmRfCjP7BQztki2uAtHqzk1qFaKUgF5w8iZRgMv8B7CH14";

    const data = await nft.deployed();
    await nft.safeMint("0xdC96Ac6B67829E1F701379E4619Bf84D6794BFa6", URI, {
      gas: 2100000,
      gasPrice: 8000000000,
    });

    expect(await nft.tokenURI(1)).to.equal(URI);
  });
});
