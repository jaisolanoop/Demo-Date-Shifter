public class EmployeeDetails {
   Public static List<Employee__c>  getEmployeeByAccount(Id accountId) {
        List<Employee__c> employees = new List<Employee__c>();
        employees = [
                SELECT Id, Name, Salary__c, Email__c, Account__c FROM Employee__c
                WHERE Account__c = :accountId AND Salary__c > 50000
                ORDER BY Salary__c DESC
            ];
            System.debug('Number of employees retrieved for Account : ' + employees.size());
			System.debug('Employees who is having Salary greater than 50000' + employees);
        return employees;

    } 

}