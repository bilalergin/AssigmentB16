public with sharing class AccountTriggerHandler {
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

        List<Account> accList = [SELECT Id, Name, Rating,(SELECT Id from Opportunities where isCLosed = False) FROM Account where id in : accID ];//ratingi hot olan accountların closed lost olon opportunitileri topladık

        for (Account acc : accList) {
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
   
    
}