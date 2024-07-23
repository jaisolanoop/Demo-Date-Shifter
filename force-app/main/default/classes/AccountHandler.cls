public class AccountHandler {
 // retrieve all Account records where Phone is null
    public static List<Account> getAccountsWherePhoneIsNull() {
        return [SELECT Id, Name, Industry, Phone FROM Account WHERE Phone = null];
    }
}