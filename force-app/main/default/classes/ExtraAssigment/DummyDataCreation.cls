public  class DummyDataCreation {
    //1. Update the description field of top 10 opportunities as "This is one of the top 10 opportunities.Please work on this properly “.
    public static void topTenOpp() {
        List<Opportunity> opp = [SELECT id, name, amount, description from Opportunity where amount != null order by amount desc limit 10];
        System.debug('Opp top 10 List= ' + opp);
        for (opportunity eachOpp : opp) {
            eachOpp.description = 'This is one of the top 10 opportunities. Please work on this properly';
            System.debug('Update description= ' + eachOpp);
        }
        update opp;
    }
    /*
    2. Write a logic to create and return n number of opportunities(buradan integer olduğunu anladık) for a particular AccountId. AccountId and n will be passed as parameters in the method.
    Populate opportunity fields as follows:Close date as 3 years from today. Stage name as Prospecting. Opportunity amount as Account’s annual revenue divided by n 
    and Opportunity name same as Account name For Ex: if n=2, Then two new opportunities If n=0, Print the message as “Please tell us how many opportunities needs
    to be created”
    */
    //data type list(opportunity)
    public static List<Opportunity> createOpp(id accId, integer n) {
        List<Opportunity> oppList = new List<Opportunity>();
        if (n <= 0) {
            System.debug('Please tell us how many opportunities needs to be created');            
        }else {
            account acc = [SELECT id, name,annualRevenue from Account where annualRevenue !=null and id = : accId];
            for (Integer i = 1; i <= n ; i++){
                Opportunity opp = new Opportunity();
                opp.CloseDate = date.today().addYears(3);//Close date as 3 years from today
                opp.stageName = 'Prospecting';//Stage name as Prospecting
                opp.amount = acc.annualRevenue/n;
                opp.name = acc.name;
                opp.AccountId = acc.id;
                oppList.add(opp);
            }
            insert oppList;
        }
        return oppList;
        
    }
    /*
    3. Find out all the Account which have no contacts attached to them. Add a contact for each one of
them and update the last Name of contact with the Name field of account.
    */
    public static void addContact(){
        List<Account> noContact = [select id, name from Account where Id NOT IN (select accountId from Contact)];
        List<Contact> contactUpdate = new List<Contact>();
    
        for(account acc : noContact){
            Contact c = new Contact();
            c.AccountId = acc.Id;
            c.LastName=acc.Name;
           contactUpdate.add(c);
        }
    insert contactUpdate;
    }
//4. Delete all the opportunities with amount less than 20000 and status as closed lost.
    public static void deleteOpp(){
        List<Opportunity> listOpp = [select id, name, stageName, amount from opportunity where StageName = 'Closed Lost' and amount<20000];
        delete listOpp;
}
/*
5. Write a logic to create N number of Accounts, and return all the accounts created.
Populate - Account Name, Rating, Phone, Shipping Address, and Billing Address.
Example - parameter -> 5. Method returns 5 newly created accounts.
a. Call this method from anonymous apex file
*/
public static List<Account> createAcc(integer n){
    List<Account> accounts = new List<Account>();

    for(integer i = 1; i <= n; i++){
        Account acc = new Account();
        acc.Name = 'Account ' + i;
        acc.Rating = 'Hot ';
        acc.Phone = '123 45 67 ';
        acc.shippingStreet = 'Shipping ';
        acc.billingStreet = 'Billing ';
        accounts.add(acc);
        

    }
    insert accounts;
    return accounts;

    
}

/*
6. Write a logic to create N number of Contacts for each account (pass List of account in
parameter), and return all Contacts created.
Populate - contact first name, last name, accountid, phone, mailing address, other address.
Example - parameters - (3, listAcc). Method creates 3 contacts for each account passed in list.
a. Call this method from anonymous file, pass the list of account returned from (1.a)
*/
public static list<contact> createCon(integer n, List<Account> accounts) {
    List<Contact> contactA = new List<Contact>();
    for (Account acc : accounts) {
        for (Integer i = 1; i <= n; i++) {
            contact ContactB =new contact();
            ContactB.FirstName = 'Contact ' +i;
            ContactB.LastName = 'ContactLastName '+i;
            ContactB.AccountId = acc.id;
            ContactB.Phone = '87667676';
            ContactB.MailingStreet = 'Mailing St';
            
            contactA.add(ContactB);
        }
    }
    insert contactA;
    return contactA;
}

/*
7. Write a logic to create CASE for each contact (pass list of contact in parameter)
populate fields - contact, account, subject, status, case origin.
Example - parameter - (listcontact). Method created case for each contact, and return all the
cases.
a. Call this method from anonymous file, pass the list of contacts returned from (2.a)
*/
public static List<Case> createCase(List<Contact> contactA ) {
    List<Case> listOfCase = new List<Case>();
    for (contact con : contactA) {
        case cas = new case();
        cas.contactid = con.id;
        cas.accountid = con.accountId;
        cas.subject = 'Subject 1';
        cas.status = 'New';
        cas.origin = 'Web';
        listOfCase.add(cas);
        
    }
    insert listOfCase;
    return listOfCase;
    
}

}