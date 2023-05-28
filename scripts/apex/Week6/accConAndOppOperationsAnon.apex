List <Account> accList = new List <Account>();
accList = AccConAndOppOperations.allAccounts();
system.debug(accList);

List <Opportunity> oppList = new List <Opportunity>();
oppList = AccConAndOppOperations.allOpportunity('Web', 'Closed Won');
system.debug(oppList);

AccConAndOppOperations.accWithOpp('Customer - Direct', 'Closed Won');

Account abc = AccConAndOppOperations.createAccount('Adem', 20000, 'Prospect');
system.debug(abc);



