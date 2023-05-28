public class OpportunityTriggerHandler {
    /*
    Create methods which takes in the set of Account Ids (or any other required parameter) and do the
following tasks:
A. Update the "Highest Amount Opportunity Name" field at Account level with the
opportunity Name which have the Highest amount among the opportunities related to
the account.
    */
   public static void insertOpp(List<Opportunity> newTrigger){
Set<Id> accId = new Set<Id>();
    for(Opportunity eachOpp : newTrigger){
        if(eachOpp.AccountId != null){
            accId.add(eachOpp.AccountId);
        }
    }
    if(!accId.isEmpty()){
        OpportunityTriggerHandler.updateHighestAmount(accId);//class ismini de yazabiliriz bu şekilde.
    }
   }
   //Metotlar
   public static void updateHighestAmount(Set<Id> accId){
    List<Account> accList = [SELECT id, Highest_Amount_Opportunity_Name__c,(SELECT id, name, amount FROM Opportunities WHERE amount !=null ORDER BY Amount DESC) FROM Account WHERE id in : accId];

    for(Account acc : accList){
        if(acc.Opportunities.size()>0){
            acc.Highest_Amount_Opportunity_Name__c = acc.Opportunities[0].Name;

        }
    }
    update accList;

   }
   /*
   B. Update the 'Target Amount Achieved Opportunity Name' at Account level with the
Closed Won Opportunity Name. Populate the opportunity name which have highest
value in Amount field, and it should be more than 'Target Amount' field value at account
   */
    public static void updateTargetOppName(Set<Id> accIds) {
        List<Account> lstAcc = [SELECT Id,Target_Amount__c,Target_Amount_Achieved_Opportunity_Name__c,(SELECT Id,Name,Amount FROM Opportunities Where StageName = 'Closed Won' and Amount != null Order by Amount DESC) FROM Account Where Id IN: accIds];
        // System.debug(lstAcc);
        for (Account acc : lstAcc) {
            // System.debug(acc.Opportunities);
            if(acc.Opportunities.size()>0 && acc.Opportunities[0].Amount >= acc.Target_Amount__c){ 
                acc.Target_Amount_Achieved_Opportunity_Name__c = acc.Opportunities[0].Name;
            }else{
                acc.Target_Amount_Achieved_Opportunity_Name__c = null;
            }
        }
        update lstAcc;
    }
} 