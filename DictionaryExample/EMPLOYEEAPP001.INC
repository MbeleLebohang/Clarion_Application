  MODULE('EMPLOYEEAPP001.CLW')
BrowseEmployees        PROCEDURE                      !Browse the Employees file
ReportEmployeesByEmp:PhoneGuidKey PROCEDURE           !Print the Employees File by Emp:PhoneGuidKey
ReportEmployeesByEmp:BenefitsGuidKey PROCEDURE        !Print the Employees File by Emp:BenefitsGuidKey
ReportEmployeesByEmp:SalaryGuidKey PROCEDURE          !Print the Employees File by Emp:SalaryGuidKey
ReportEmployeesByEmp:QualificationGuidKey PROCEDURE   !Print the Employees File by Emp:QualificationGuidKey
ReportEmployeesByEmp:GuidKey PROCEDURE                !Print the Employees File by Emp:GuidKey
BrowsePhones           PROCEDURE                      !Browse the Phones file
ReportPhonesByPho:EmployeeGuidKey PROCEDURE           !Print the Phones File by Pho:EmployeeGuidKey
ReportPhonesByPho:GuidKey PROCEDURE                   !Print the Phones File by Pho:GuidKey
  END
