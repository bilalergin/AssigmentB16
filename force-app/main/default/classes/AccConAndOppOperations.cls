public  class AccConAndOppOperations {
    public Static List <Account> allAccounts(){
        List <Account> accList = [select ID, Name, AnnualRevenue, Type, AccountSource from Account];
        return accList;


    }
    public Static List<Opportunity> allOpportunity(string LeadSrc, string Stage){
        List<Opportunity> oppList = [select ID, Name from Opportunity where LeadSource = :LeadSrc and StageName = : Stage];
        return oppList;


    }
    public Static void accWithOpp(string accType, string oppStage){
        list<Account> accList2 = [select ID, Name, AnnualRevenue, Type, (select ID, Name, Amount, StageName from Opportunities where StageName = : oppStage)from Account where Type = :accType];
        for (Account eachAcc : accList2) {
            System.debug('Account Name : ' + eachAcc.Name);
        for (Opportunity eachOpp : eachAcc.Opportunities) {
            system.debug('Opportunity Name :' + eachOpp);
            
        }
        } 
    }
   
    public Static Account createAccount(string Name, decimal annualRevenue, string Type){
        Account abc;

        
        if (!string.isBlank(Name) && Name != null) {
            abc = new Account();
            abc.Name = Name;
            abc.annualRevenue = annualRevenue;
            abc.Type = Type; 
            insert abc;
           } else {
                system.debug('Account without name cannot be created');   
            }

            return abc;
      
        
    }

    
}