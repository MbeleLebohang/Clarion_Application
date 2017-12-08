  MODULE('EMPLOYEEAPP003.CLW')
BrowseSchools          PROCEDURE                      !Browse the Schools file
ReportSchoolsBySch:QualificationGuidKey PROCEDURE     !Print the Schools File by Sch:QualificationGuidKey
ReportSchoolsBySch:GuidKey PROCEDURE                  !Print the Schools File by Sch:GuidKey
BrowseLinkBenefitsEmployee PROCEDURE                  !Browse the LinkBenefitsEmployee file
ReportLinkBenefitsEmployeeByLin:GuidKey PROCEDURE     !Print the LinkBenefitsEmployee File by Lin:GuidKey
ReportLinkBenefitsEmployeeByLin:BenefitsGuidKey PROCEDURE !Print the LinkBenefitsEmployee File by Lin:BenefitsGuidKey
ReportLinkBenefitsEmployeeByLin:EmployeeGuidKey PROCEDURE !Print the LinkBenefitsEmployee File by Lin:EmployeeGuidKey
BrowseLinkEmployeeQualification PROCEDURE             !Browse the LinkEmployeeQualification file
ReportLinkEmployeeQualificationByLin2:GuidKey PROCEDURE !Print the LinkEmployeeQualification File by Lin2:GuidKey
ReportLinkEmployeeQualificationByLin2:EmployeeGuidKey PROCEDURE !Print the LinkEmployeeQualification File by Lin2:EmployeeGuidKey
  END
