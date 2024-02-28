async function main() {
  const BlogContract = await ethers.getContractFactory("Blog");
  const blogContract = await BlogContract.deploy();
  await blogContract.deployed();
  console.log("Contract deployed to address:", blogContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  }
);