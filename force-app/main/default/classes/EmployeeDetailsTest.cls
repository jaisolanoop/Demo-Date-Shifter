@isTest
public class EmployeeDetailsTest {
@isTest
    static void testGetEmployeeByAccount() {
        // Set up test data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;

        Employee__c emp1 = new Employee__c(Name = 'John Doe', Salary__c = 60000, Email__c = 'john.doe@example.com', Account__c = testAccount.Id);
        Employee__c emp2 = new Employee__c(Name = 'Jane Smith', Salary__c = 40000, Email__c = 'jane.smith@example.com', Account__c = testAccount.Id);
        Employee__c emp3 = new Employee__c(Name = 'Bob Johnson', Salary__c = 70000, Email__c = 'bob.johnson@example.com', Account__c = testAccount.Id);
        insert new List<Employee__c> { emp1, emp2, emp3 };
            
            // Call the method to be tested
        List<Employee__c> result = EmployeeDetails.getEmployeeByAccount(testAccount.Id);

        // Verify results
        System.assertEquals(2, result.size(), 'There should be 2 employees with a salary greater than 50000');
        
        // Check if the employees are sorted by Salary__c in descending order
        System.assert(result[0].Salary__c > result[1].Salary__c, 'The employees should be sorted by salary in descending order');
        
        // Check if the returned employees belong to the correct account and have a salary greater than 50000
        for (Employee__c emp : result) {
            System.assertEquals(testAccount.Id, emp.Account__c, 'The employee should belong to the test account');
            System.assert(emp.Salary__c > 50000, 'The employee salary should be greater than 50000');
        }
    }
}