public class ContactTriggerHandler {
    /*
    1. Create one new field in the contact object ‘Main Contact Person’ (checkbox).
When ‘Main Contact Person’ is changed to Checked in contact → Update its account’s FAX field
as that contact’s FAX Field.
- Example:
Account → Name = AccQnC, Fax = 999888777
Contacts → Name = QnC1 , Main Contact Person = false, Fax = 111222333
Contacts → Name = QnC2 , Main Contact Person = false, Fax = 111222444
Contacts → Name = QnC3 , Main Contact Person = false, Fax = 111222555
Contacts → Name = QnC6 , Main Contact Person = false, Fax = 111222666
Update QnC6 contact → Main contact person = true
→ Auto update account’s FAX to 111222666 (QnC6’s fax value)
2. Write the Test class for the triggers and trigger handlers written for the above logic.
    */
    public static void updateContact(List<Contact> newTrigger, Map<Id,Contact> oldMap) {
        Set<Id> accId = new Set<Id>();
        for (Contact con : newTrigger) {
            Contact oldCon =oldMap.get(con.Id);
            if (con.Main_Contact_Person__c != oldCon.Main_Contact_Person__c) {
                accId.add(con.AccountId);
                
            }
            
        }
        List<Account> accConList = [SELECT id, fax,(SELECT fax FROM contacts where Main_Contact_Person__c = True LIMIT 1) FROM account where Id =:accId];
        for (Account acc : accConList) {
            acc.fax = acc.Contacts[0].fax;
            
        }
        update accConList;

    }

}