trigger OpportunityTrigger on Opportunity (before insert, after insert, before update, after update) {
    /*
    5. When an opportunity is created show a debug message ([OpportunityName] –
[CloseDate] – [Amount]) for each opportunity and print the total number of
opportunities created in the transaction. For example: Demo Opportunity – 20/10/2022
– 40000.
    */
    if(trigger.isAfter && trigger.isInsert){
        System.debug('Total Opportunity = ' + trigger.new.size());
        for(Opportunity newOp : trigger.new){
            System.debug('total number of opportunities created in the transaction'+ newOp.name + '--'+  newOp.closedate + '--' + newOp.Amount);
            /*
            6. When opportunity is created print the StageName, value of description field and
opportunity name.
            */
            System.debug(newOp.name + '--' + newOp.stagename + '--'+  newOp.Description + '--' + newOp.Amount);


        }

    }



    /*
    7. Print the new and old field values for (Opportunity Name and Amount) fields whenever
an opportunity is updated.
    */

    if(trigger.isAfter && trigger.isUpdate){
        for(Opportunity opp: trigger.new){
           Opportunity oldOp = trigger.oldMap.get(opp.id);
           System.debug('Old oppname '+ oldOp.name+ ' -- ' + oldOp.Amount );
           System.debug('New oppname ' + opp.name + ' -- ' + opp.Amount );

    /*
    8. When the StageName of an opportunity is updated, then print the value of description
field and opportunity name.
    */       
    if(oldOp.stagename != opp.StageName){
        System.debug('Description: ' + opp.Description + ' opportunity name: ' + opp.Name);
    }
        }
    }


}