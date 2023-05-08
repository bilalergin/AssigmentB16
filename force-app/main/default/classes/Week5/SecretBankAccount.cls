public class SecretBankAccount {
   String accountNumber;
   String accountName;
   Decimal balanceAmount;//kalan bakiye

public void createAccount(String accountNumber, String accountName, Decimal balanceAmount){
    this.accountNumber = accountNumber;
    this.accountName = accountName;
    this.balanceAmount = balanceAmount;
}
public void depositAmount(Decimal amount){
    //depositamount para yatırma demek
    this.balanceAmount += amount;//yatırdığımız para bakiyenin üstüne eklenir
    System.debug('Amount Withdrawn Successfully!');
    System.debug('Amount Deposited: ' + amount);
    System.debug('Current balance ' + balanceAmount);
}
public void withdrawAmount(Decimal amount){
    //withdraw para çekme
    if(amount >balanceAmount){
    System.debug('ERROR: Sorry, Sufficient Balance not Available!');
    System.debug('Current balance ' + balanceAmount);

}else{
    balanceAmount-=amount;
    System.debug('Amount Withdrawn Successfully!');
    System.debug('Current balance ' + balanceAmount);

}

}
public void accountDetails(){
    System.debug('Accountnumber ' + accountNumber);
    System.debug('AccountName ' + accountName);
    System.debug('balanceAmount ' + balanceAmount);//ctr + d ile aynı kelimeleri seçebiliyoruz.

}
}