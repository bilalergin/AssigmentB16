trigger Payment1Trigger on Payment1__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUndelete) {
            Payment1TriggerHandler.createPayment(Trigger.new);
            
        }
        if (Trigger.isUpdate) {
            Payment1TriggerHandler.updateMetot(Trigger.new, Trigger.oldMap);
            
        }
        if (trigger.isDelete) {
            Payment1TriggerHandler.deleteMetot(trigger.old);
          }
        
    }

}