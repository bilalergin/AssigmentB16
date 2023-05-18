public with sharing class AccountTriggerHandler {
    //! 18.05.2023 extra practice week8
    /*
    1. Allow user to update rating of account record to HOT only if the Account has 3 opportunity
which is not closed. If user tries to update account record’s rating field to HOT which does not
have 3 open opportunity then throw error: ‘This account CANNOT be HOT. Okay?’
    */
    public static void updateAccountRating(List<Account> newAccount, List<Account> oldAccount, Map<Id,Account> newAccMap, Map<Id,Account> oldAccMap){
        Set<id> accID = new Set<id>();
        for (Account eachAcc : newAccount) {//1. aşama: değişiklik olan recordların ıd sini sete atmak.
            if (eachAcc.Rating == 'Hot') {
                accID.add(eachAcc.id);
            }
                    
        }

        List<Account> accList = [SELECT Id, Name, Rating,(SELECT Id from Opportunities where isCLosed = False) FROM Account where id in : accID ];//2.Aşama: ratingi hot olan accountların closed lost olon opportunitileri topladık

        for (Account acc : accList) {// 3.Aşama: adderror ekledik
            if (acc.Opportunities.size() < 3) {
                newAccMap.get(acc.id).rating.addError('This account CANNOT be HOT. Okay?');
                                // newAccMap.get(acc.id).addError('This account CANNOT be HOT. Okay?', true);
             
            }
            
        }

    }

    /*
    2. When the Annual revenue value of an Account is reduced from the previous value then Throw
error with the following message:
a. ‘Annual Revenue for an account cannot be reduced’.
And do not allow the user to save the record.
    */
    public static void checkRevenue(List<Account> newAccount, List<Account> oldAccount, Map<Id,Account> newAccMap, Map<Id,Account> oldAccMap){
         for (Account acc : newAccount) {//* buradaki newwAccount trigger.new demek
            Account oldAcc = oldAccMap.get(acc.id);//* buradaki oldAccMap trigger.oldMAp demek
            Decimal newAnRev = acc.AnnualRevenue;
            Decimal oldAnRev = oldAcc.AnnualRevenue;
            if (newAnRev == null) {// annual revenu boşsa 0 olsun.
                newAnRev =0;
                
            }
            if (oldAnRev == null) {//annual revenu boşsa 0 olsun.
                oldAnRev = 0;
                
            }

            if (oldAnRev > newAnRev && oldAnRev != newAnRev) { //! oldAcc.AnnualRevenue > acc.AnnualRevenue  && oldAcc.AnnualRevenue != acc.AnnualRevenue böyle uzun uzn da olabilir decimalları atamazsak
                acc.AnnualRevenue.addError('Annual Revenue for an account cannot be reduced');//! adderror'u trigger.new veya trigger.newMap içindeki objelerle yapabiliriz.Yoksa hata verir.triggerold,oldmap veya başka objeye yapılamaz.
                // acc.addError('Annual Revenue for an account cannot be reduced'); // böyle de çalışır ama hata yazısı fieldda değil altta olur.

            }
            
         }
        
    }
    
    /*
    3. Whenever a New Account Record is created, an associated Contact Record must be created
automatically. Contact record fields as below:
- Account name as Contact last name
- Account phone as contact phone
    */

    public static void createContactList(List<Account> newAccount, List<Account> oldAccount, Map<Id,Account> newAccMap, Map<Id,Account> oldAccMap) {
        List<Contact> newContact = new List<Contact>();
        for (Account acc : newAccount) {
            Contact newC = new Contact();
            newC.LastName = acc.Name;
            newC.Phone = acc.Phone;
            newC.AccountId = acc.id;
            newContact.add(newC);
        }
        if (!newContact.isEmpty()) {
            
        }
        insert newContact;
    }

    /*
    4. Write a trigger on the Account when the Account is updated, check all opportunities related to
the account. Update all Opportunity Stage to close lost if stage name not already set to closed
won.
    */
    public static void checkOpp(List<Account> newAccount, List<Account> oldAccount, Map<Id,Account> newAccMap, Map<Id,Account> oldAccMap) {
        Set<Id> updateOpp = new Set<Id>();
        for (Account acc : newAccount) {
            updateOpp.add(acc.id);
                       
        }
        List<Opportunity> oppList = [SELECT id, StageName FROM Opportunity where accountId =: updateOpp and StageName != 'Closed Won' and StageName != 'Closed Lost'];
    for (Opportunity Opp : oppList) {
        opp.StageName = 'Closed Lost';
    }
    update oppList;
}
}