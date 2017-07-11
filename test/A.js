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
      let result=(await aInstance.setFactor.call(100000000000000000,50000000000000000,2,3333)).valueOf();
      let balance=(await aInstance.availableBalanceOf.call(result,452895350633,1541)).valueOf();
      //let results= (await aInstance.availableBalanceOf.call(result,88,2007.8,4,100,110).logs).valueOf();
      console.log("Result is:",result);
      console.log("balance is:",balance);
    });

});
