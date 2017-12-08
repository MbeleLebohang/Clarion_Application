  MODULE('EMPLOYEEAPP002.CLW')
BrowseSalary           PROCEDURE                      !Browse the Salary file
ReportSalaryBySal:EmployeeGuidKey PROCEDURE           !Print the Salary File by Sal:EmployeeGuidKey
ReportSalaryBySal:GuidKey PROCEDURE                   !Print the Salary File by Sal:GuidKey
BrowseBenefits         PROCEDURE                      !Browse the Benefits file
ReportBenefitsByBen:EmployeeGuidKey PROCEDURE         !Print the Benefits File by Ben:EmployeeGuidKey
ReportBenefitsByBen:GuidKey PROCEDURE                 !Print the Benefits File by Ben:GuidKey
BrowseQualification    PROCEDURE                      !Browse the Qualification file
ReportQualificationByQua:EmployeeGuidKey PROCEDURE    !Print the Qualification File by Qua:EmployeeGuidKey
ReportQualificationByQua:SchoolGuidKey PROCEDURE      !Print the Qualification File by Qua:SchoolGuidKey
ReportQualificationByQua:GuidKey PROCEDURE            !Print the Qualification File by Qua:GuidKey
ExportFile             PROCEDURE(FILE pTableFile )
  END
