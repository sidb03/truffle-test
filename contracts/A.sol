pragma solidity ^0.4.11;

contract A {

function A() payable {
}
 function  getPhaseCount(uint d) public returns (uint)  
 {
   return ((d/88)+1);
 }
 function  getDayCount() public returns (uint)
 {
  return ((block.timestamp-1491874600)/86400);
 } 
 function min(uint x,uint y) returns (uint)
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
  function safeSub(uint a, uint b) returns (uint) {
    assert(b <= a);
    return a - b;
  }             
function setFactor(uint256 maxMintingPower,uint256 minMintingPower,uint contributionId,uint maxAddresses) returns (uint256){
  uint256 factor=(maxMintingPower-(contributionId*(maxMintingPower-minMintingPower)/maxAddresses));
  return factor;
}
function availableBalanceOf(uint256 factor,uint halvingCycle,uint inbalance,uint decimals,uint startDay) returns (uint256){
    uint endDay=getDayCount();//Cant get of specified 2 days. Need the block timestamp of both the days.
    uint inPhase=safeSub(getPhaseCount(startDay),1);
    uint enPhase=safeSub(getPhaseCount(endDay),1);
    uint balance;
    balance=inbalance*((1+factor/(2**inPhase))**min((safeSub(safeSub(halvingCycle*(inPhase+1),startDay),1)),endDay));
  for(uint i=inPhase+1;i<=enPhase;i++)
  {
    balance*=((1+factor/(2**i)))**min(halvingCycle,(safeSub(endDay,i*halvingCycle)+1));
  }
    return balance;
    
}




}