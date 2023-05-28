trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    //! 9.Haftanın assigmentı
    if (Trigger.isAfter && Trigger.isUpdate) {
        ContactTriggerHandler.updateContact(Trigger.new, Trigger.oldMap);
        
    }
    
    
    /*
    //! 8.Haftanın assigmentı
    4. Whenever Contact is created with ‘Account’ then print ‘[Contact Name] contact created
WITH Account’. If contact is created without ‘Account’ then print ‘[Contact Name]
contact create WITHOUT Account’
examples:
Sachin contact created with Account.
Jake contact created WITHOUT Account
    */
    if(trigger.isInsert && trigger.isAfter){
        for(Contact newC : trigger.new){
            if(newC.AccountId !=null){
                System.debug(Contact.lastname + ' contact created WITH Account');
            }else{
                System.debug(Contact.lastname + ' contact created WITHOUT Account');

            }
        }
    }

}