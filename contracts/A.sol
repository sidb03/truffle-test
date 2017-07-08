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
  return 10;
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
  uint256 factor=(maxMintingPower-(contributionId*(maxMintingPower-minMintingPower)/maxAddresses));
  return factor;
  //  uint256 cent=77;
  //uint256 cent1=10**cent;
  //return cent1;
}
function availableBalanceOf(uint256 factor,uint256 halvingCycle,uint256 inbalance,uint256 decimals,uint256 startDay) returns (uint256){
    //Cant get of specified 2 days. Need the block timestamp of both the days.
    uint256 inPhase=getPhaseCount(startDay)-1;
    uint256 enPhase=getPhaseCount(getDayCount())-1;
    uint256 balance;
    uint256 dec=54;
    uint mini=min((halvingCycle*(inPhase+1)-startDay-1),getDayCount());
    balance=inbalance;
   // for(uint j=1;j<=7;j++)
    //{
    balance=balance*((10**(decimals+2)+factor/(2**inPhase))**mini);
    //}
    
  for(uint256 i=inPhase+1;i<=enPhase;i++)
  {
    balance*=((10**(decimals+2)+factor/(2**i)))**min(halvingCycle,(safeSub(getDayCount(),i*halvingCycle)+1));
  }
  return balance;

   //
   // return ((10**(decimals+2))+factor/(2**inPhase))**min((safeSub(safeSub(halvingCycle*(inPhase+1),startDay),1)),getDayCount());
}
}

//Need to know the number of decimals in final answer.
