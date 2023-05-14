trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {
    /*
    3. Whenever Lead is created with LeadSource as Web then show "Rating should be Cold"
message otherwise show "Rating should be hot".
    */

    if(trigger.isInsert && trigger.isAfter){
        for(lead newL : trigger.new){
            if(newL.LeadSource == 'Web'){
                System.debug('Rating should be Cold');
            }else{
                System.debug('Rating should be hot');
            }
        }
    }
    

}