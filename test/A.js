var A = artifacts.require("./A.sol");

contract('A', function(accounts) {
  
    it("should return current day and phase", async function(){
      let aInstance= await A.new();
      let day=(await aInstance.getDayCount.call()).valueOf();
      console.log("Current Day is :",day);
      console.log("Current Phase Count:", (await aInstance.getPhaseCount.call(day)).valueOf());
    });
    it("Should set factors", async function(){
      let aInstance= await A.new();
      let result=(await aInstance.setFactor.call(10000,5000,2,3333)).valueOf();
      let balance=(await aInstance.availableBalanceOf.call(result,88,792,4,0)).valueOf();
      console.log("factor is:",result);
      console.log("balance is:",balance);
    });

});
