pragma solidity ^0.4.10;

contract A {

function A() {
}
 function  getPhaseCount(uint256 d) public returns (uint256)  
 {
   return ((d/88)+1);
 }
 function  getDayCount() public returns (uint256)
 {
  //return ((block.timestamp-1498867200)/86400);
  return 1542;
 } 
 function min(uint256 x,uint256 y) returns (uint256)
 {
     if(x>=y)
     {
         return y;
     }
     else
     {
         return x;
     }
 }
  function safeSub(uint256 a, uint256 b) returns (uint256) {
    assert(b <= a);
    return a - b;
  }             
function setFactor(uint256 maxMintingPower,uint256 minMintingPower,uint256 contributionId,uint256 maxAddresses) returns (uint256){
  uint256 factor=(maxMintingPower-(contributionId*(maxMintingPower-minMintingPower))/maxAddresses);
  return factor;
}
event returned(uint balance);
function availableBalanceOf(uint256 factor,uint256 inbalance,uint lastUpdated) returns (uint256){
    uint dec=17;
    uint256 balance=inbalance;
    for(uint i=lastUpdated;i<getDayCount();i++)
    {
      balance=(balance*((10**(dec+2)*(2**(getPhaseCount(i)-1)))+factor))/(2**(getPhaseCount(i)-1));
    }
    balance=balance/10**((dec+2)*(getDayCount()-lastUpdated));
    return balance;
}
}

//Need to know the number of decimals in final answer.
