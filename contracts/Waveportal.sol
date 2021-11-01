// SDPX License-Identifier:UNLICENSED

import "hardhat/console.sol";

contract WavePortal{
     uint256 totalWaves;
      uint256 private seed;
   // mapping(address => uint) public waveByUsers;
    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

     Wave[] waves;
    mapping(address => uint256) public lastWavedAt;

    constructor() payable {
        console.log("Yo yo,my first contract");
         seed = (block.timestamp + block.difficulty) % 100;

    }

    function wave(string memory _message) public{

        // waveByUsers[msg.sender]= waveByUsers[msg.sender]+1;
        //  console.log("%s has waved!", msg.sender);
          require(
            lastWavedAt[msg.sender] + 30 seconds < block.timestamp,
            "Wait 15m"
        );

                lastWavedAt[msg.sender] = block.timestamp;

        totalWaves +=1;
       console.log("%s has waved!", msg.sender);
        waves.push(Wave(msg.sender, _message, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _message);

        seed = (block.difficulty + block.timestamp + seed) % 100;

     
        if(seed<50)
        {

         uint256 prizeAmount = 0.0001 ether;

         require(prizeAmount<address(this).balance,
         "You dont have enough balance");
         (bool success, )=(msg.sender).call{value:prizeAmount}(" ");
         require(success,"Failed to withdraw the amount");
        }

    }

 function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

   function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    // function getTotalWaves() public view returns (uint256){
    //      console.log("We have %d total waves for %s!", waveByUsers[msg.sender],msg.sender);
    //     return totalWaves;

    // }

    //   function getTotalWavesForAddress(address _address) public view returns (uint256){
    //      console.log("We have %d total waves for %s!", waveByUsers[_address],_address);
    //     return totalWaves;

    // }

}