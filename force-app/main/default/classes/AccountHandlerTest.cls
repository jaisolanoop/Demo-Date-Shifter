@isTest
public class AccountHandlerTest {

    @isTest
    static void testGetAccountsWherePhoneIsNull() {
        // test data
        Account acc1 = new Account(Name = 'Test Account 1', Industry = 'Technology');
        Account acc2 = new Account(Name = 'Test Account 2', Industry = 'Healthcare');
        Account acc3 = new Account(Name = 'Test Account 3', Industry = 'Finance', Phone = '9876543210');
        insert new List<Account>{acc1, acc2, acc3};

        
        Test.startTest();
        List<Account> accounts = AccountHandler.getAccountsWherePhoneIsNull();
        Test.stopTest();

        System.assertEquals(2, accounts.size(), 'Expected two accounts with Phone as null');
        System.assert(accounts.contains(acc1), 'Expected account Test Account 1 to be returned');
        System.assert(accounts.contains(acc2), 'Expected account Test Account 2 to be returned');
        System.assert(!accounts.contains(acc3), 'Expected account Test Account 3 not to be returned');
    }
}