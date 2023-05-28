public class Payment1TriggerHandler {
    /*
d. Create a field in Customer object called ‘Total Amount’ - this field should be auto-updated
when payments are created/updated/deleted (NO UNDELETE SCENARIO).
*/

public static void newTotalAmount(Set<id> customerId) {
    List<Customer1__c> newCus = [SELECT id, total_amount__c,(SELECT id, Amount__c FROM Payments__r) FROM Customer1__c where id in:customerId];
    if (!newCus.isEmpty()) {
        for (Customer1__c  eachCus: newCus) {
            Decimal totalAmount =0;
            for (Payment1__c eachPay : eachCus.Payments__r) {
                totalAmount += eachPay.Amount__c;
                
            }
            eachCus.total_amount__c = totalAmount;
        }
        update newCus;
    }
}
//Create Senaryosu için
public static void createPayment(List<Payment1__c> newTrigger) {
    Set<id> customerId = new Set<id>();
    for (Payment1__c py : newTrigger) {
        if (py.Amount__c != null && py.Customer1__c != null) {
            customerId.add(py.Customer1__c);
        }
    }
    if (!customerId.isEmpty()) {
        newTotalAmount(customerId);
    }
}
//Update Senaryosu için

public static void updateMetot(List<Payment1__c> newTrigger, Map<Id,Payment1__c> oldMapTrigger) {
    Set<id> customerId = new Set<id>();
    for (Payment1__c p : newTrigger) {
        Payment1__c oldP = oldMapTrigger.get(p.id);
        if (p.Customer1__c != oldP.Customer1__c || p.Amount__c != oldP.Amount__c) {
            customerId.add(p.Customer1__c);
            customerId.add(oldP.Customer1__c);
        }  
    }
    if (!customerId.isEmpty()) {
        newTotalAmount(customerId);
    }
}
//Delete Senaryosu için

public static void deleteMetot(List<Payment1__c> oldTrigger) {
    Set<id> customerId = new Set<id>();
        for (Payment1__c p : oldTrigger) {
        if (p.Customer1__c != null && p.Amount__c != null) {
            customerId.add(p.Customer1__c);
            }
        }
        if (!customerId.isEmpty()) {
            newTotalAmount(customerId);
        }
    }



}
