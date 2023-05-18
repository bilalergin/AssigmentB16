trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
   
   if (trigger.isBefore && trigger.isUpdate) {
      AccountTriggerHandler.updateAccountRating(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
      
   }
   
   
   
   
   
   
   
   /*
   2. When Account’s rating field is updated to HOT, get count of opportunity in this account. If the
count of opportunity is MORE than 3 and Rating of account is updated to HOT print following…
Account is NOW HOT!And it has 4 opportunities.
   */
   // Set<Id> accIds = new set<Id>();
   // for(Account newAcc : trigger.new){
   //  if(newAcc.Rating == 'Hot'){
   //      accIds.add(newAcc.id);
   //  }

   // }
   // List<Account> newListAcc= [SELECT id, name, rating, (Select id from Opportunities) from Account where Id in : accIds];
   // for(Account acc : newListAcc){
   //    if(acc.Opportunities.size()>3){
   //       System.debug('Account is NOW HOT!And it has 4 opportunities');

   //    }

   // }
   
   
   
   /*
   1. When the Annual revenue value of an Account is reduced from the previous value then print the
following message:
‘Annual Revenue for an account cannot be reduced’.
   */
    // if(trigger.isBefore && trigger.isUpdate){
    //     for(Account newAcc : trigger.new){
    //         Account oldAcc = trigger.oldMap.get(newAcc.id);
    //         if(newAcc.AnnualRevenue <= oldAcc.AnnualRevenue){
    //             System.debug('Annual Revenue for an account cannot be reduced');
    //         }

    //     }

    // }

}