const main=async()=>{
const[_,randomPerson]=await hre.ethers.getSigners();
const waveContractFactory=await hre.ethers.getContractFactory('WavePortal');
const waveContract=await waveContractFactory.deploy({
    value: hre.ethers.utils.parseEther('0.1'),
});
await waveContract.deployed();
console.log('Contract deployed to:', waveContract.address);

let contractBalance = await hre.ethers.provider.getBalance(
    waveContract.address
  );

  console.log(
    'Contract balance:',
    hre.ethers.utils.formatEther(contractBalance)
  );


let waveCount;
waveCount=await waveContract.getTotalWaves();

let waveTxn=await waveContract.wave("message");
await waveTxn.wait();


contractBalance = await hre.ethers.provider.getBalance(waveContract.address);

  console.log(
    'Contract balance:',
    hre.ethers.utils.formatEther(contractBalance)
  );

waveCount=await waveContract.getTotalWaves();

waveTxn=await waveContract.connect(randomPerson).wave("Another messafe");
await waveTxn.wait();

waveCount=await waveContract.getTotalWaves();
console.log(waveCount);



};

const runMain=async ()=>{
    try{
        await main();
        process.exit(0);
    }catch(error){
    console.log(error);
    process.exit(1)
    }

};

runMain();