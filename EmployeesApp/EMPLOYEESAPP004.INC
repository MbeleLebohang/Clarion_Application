  MODULE('EMPLOYEESAPP004.CLW')
SelectBenefits         PROCEDURE                      !Select a Benefits Record
UpdateLinkBenefitsEmployee PROCEDURE                  !Form LinkBenefitsEmployee
SelectQualification    PROCEDURE                      !Select a Qualification Record
UpdateLinkEmployeeQualification PROCEDURE             !Form LinkEmployeeQualification
Export_File            PROCEDURE(FILE pTableFile)     !Procedure for manipulating files
Window_Info            PROCEDURE(Window pWindow)      !Information about window frames
Export_View            PROCEDURE(VIEW pTableView)     !Generate an XML for a VIEW
  END
