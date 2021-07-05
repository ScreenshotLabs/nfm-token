const hre = require("hardhat");

async function main() {
  const NFT = await hre.ethers.getContractFactory("NFMToken");
  const URI = "ipfs://QmRfCjP7BQztki2uAtHqzk1qFaKUgF5w8iZRgMv8B7CH14";
  const WALLET_ADDRESS = "0xdC96Ac6B67829E1F701379E4619Bf84D6794BFa6";
  const CONTRACT_ADDRESS = "0xaACF3a8C7440be69e4211d49DDD46dbf77cb31e6";
  const contract = NFT.attach(CONTRACT_ADDRESS);
  await contract.safeMint(WALLET_ADDRESS, URI);
  console.log("NFT minted:", contract);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
