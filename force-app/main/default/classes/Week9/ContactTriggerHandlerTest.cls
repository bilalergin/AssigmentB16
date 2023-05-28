@isTest
public class ContactTriggerHandlerTest {
    @TestSetup
    public static void testSetup(){
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 20; i++) {
            Account newAcc = new Account();
            newAcc.Name ='Test' + i;
            newAcc.Fax = '254879651';
            accList.add(newAcc);
                        
        }
        insert accList;

        List<Contact> conList = new List<Contact>();
        for (Account a : accList) {
            for (Integer i = 0; i < 5; i++) {
                Contact newCon = new Contact();
                newCon.AccountId = a.Id;
                newCon.LastName = 'Deneme' + i;
                conList.add(newCon);
            }    
            
        }
        insert conList;

    }
    @IsTest
    private static void updateContactTest() {
        List<Contact> conList = [SELECT id, name, Main_Contact_Person__c, Fax, accountId FROM contact];
        conList[0].Main_Contact_Person__c = True;
            update conList;
        
        Account accList = [SELECT fax from Account where id =: conList[0].accountId limit 1];
        string cFax = conList[0].Fax;
        assert.areEqual(cFax, accList.Fax);
    
        }
}
