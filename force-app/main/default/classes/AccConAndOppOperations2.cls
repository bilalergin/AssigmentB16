public  class AccConAndOppOperations2 {
    public static decimal oppSum(){
        list<opportunity> oppList = [select id, name, amount, stageName FROM opportunity where amount != null and stageName = 'Closed Won'];
        decimal sum = 0;
        for (opportunity eachOpp: oppList) {
            sum += eachOpp.amount;
        }
        system.debug('sum = ' + sum);
        return sum;
    }
    public static list<account> WonOpp(string oppStage){
        list<account> WonList = [select id, name from account where id In (select accountid from opportunity where stageName= :oppStage)];
        system.debug('Won list : ' + WonList);
        return WonList;
    }
    // 3. sorunun 2. Sıkkinin 2. Yontemi
    public static list<account> WonOpp2(string oppStage){
        Set<id> accIds = new Set<id>();
        list<opportunity> oppList = [select accountId from opportunity where stageName = :oppStage];
        for (opportunity eachOpp : oppList) {
            accIds.add(eachOpp.accountId);
        }
        list<account> accountList = [select id,name FROM account where id In :accIds ];
        system.debug('Account List : ' + accountList);
        return accountList ;
    }
    public static list<account> oneContact(){
        list<contact> conList = [select accountId FROM contact];
        Set<id> accountIds = new Set<id>();
        for (contact eachCon : conList) {
            accountIds.add(eachCon.accountId);
        }
        list<account> accountList = [select id, name, (select id, name FROM contacts) from account where id In: accountIds];
        system.debug(accountList);
        return accountList;
    }
    public static void runDynamicContactQuery(list <string> ListSt){
        string fieldName = '';
        for (string eachSt : ListSt) {
            fieldName += eachSt + (',');
        }
        fieldName = fieldName.removeEnd(',');
        string queryString = 'select ' + fieldName + ' from Contact';
        system.debug(queryString);
        list<contact>contactList = database.query(queryString);
        for (contact eachContact : contactList) {
            system.debug(eachContact);
        }
    }
    public static contact popCont(id accountId){
        contact con1;
        if (accountId != null) {
            account acc = [select name from account where id = :accountId];
            con1 = new contact();
            con1.lastname = acc.name;
            con1.accountId = acc.Id;
            insert con1;
        }
        return con1;
    }
}