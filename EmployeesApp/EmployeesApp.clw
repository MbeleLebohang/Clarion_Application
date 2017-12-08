   PROGRAM


StringTheory:TemplateVersion equate('2.66')

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
   INCLUDE('ABFUZZY.INC'),ONCE
  include('StringTheory.Inc'),ONCE
include('CWSYNCHC.INC'), ONCE
include('XMLGenerator.Inc'),ONCE

   MAP
     MODULE('EMPLOYEESAPP_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('EMPLOYEESAPP001.CLW')
Main                   PROCEDURE   !Wizard Application for C:\Users\user\Documents\Clarion Projects\Clarion_Application\DictionaryExample\Employees.dct
     END
   END

Glo:str              StringTheory,THREAD
Glo:xml              XMLGenerator
Glo:cs               CriticalSection
Glo:RecentBrowser    STRING(50)
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
Employees            FILE,DRIVER('TOPSPEED'),PRE(Emp),CREATE,BINDABLE,THREAD !                     
PhoneGuidKey             KEY(Emp:PhoneGuid),NOCASE         !                     
BenefitsGuidKey          KEY(Emp:BenefitsGuid),NOCASE      !                     
SalaryGuidKey            KEY(Emp:SalaryGuid),NOCASE        !                     
QualificationGuidKey     KEY(Emp:QualificationGuid),NOCASE !                     
GuidKey                  KEY(Emp:Guid),NOCASE,PRIMARY      !                     
Record                   RECORD,PRE()
Guid                        STRING(16),THREAD              !                     
Full_Names                  STRING(100)                    !                     
Job_Title                   STRING(20)                     !                     
Address                     STRING(255)                    !                     
PhoneGuid                   STRING(20)                     !                     
Employment_Date             LONG                           !                     
QualificationGuid           STRING(16),THREAD              !                     
SalaryGuid                  STRING(16),THREAD              !                     
BenefitsGuid                STRING(16),THREAD              !                     
                         END
                     END                       

Phones               FILE,DRIVER('TOPSPEED'),PRE(Pho),CREATE,BINDABLE,THREAD !                     
EmployeeGuidKey          KEY(Pho:EmployeeGuid),NOCASE      !                     
GuidKey                  KEY(Pho:Guid),NOCASE,PRIMARY      !                     
Record                   RECORD,PRE()
Guid                        STRING(16),THREAD              !                     
EmployeeGuid                STRING(16),THREAD              !                     
Phone_Type                  STRING(20)                     !                     
Phone_Number                STRING(20)                     !                     
                         END
                     END                       

Salary               FILE,DRIVER('TOPSPEED'),PRE(Sal),CREATE,BINDABLE,THREAD !                     
EmployeeGuidKey          KEY(Sal:EmployeeGuid),NOCASE      !                     
GuidKey                  KEY(Sal:Guid),NOCASE,PRIMARY      !                     
Record                   RECORD,PRE()
Guid                        STRING(16),THREAD              !                     
EmployeeGuid                STRING(16),THREAD              !                     
Salary_Type                 STRING(20)                     !                     
Salary                      DECIMAL(12,2)                  !                     
                         END
                     END                       

Benefits             FILE,DRIVER('TOPSPEED'),PRE(Ben),CREATE,BINDABLE,THREAD !                     
EmployeeGuidKey          KEY(Ben:EmployeeGuid),NOCASE      !                     
GuidKey                  KEY(Ben:Guid),NOCASE,PRIMARY      !                     
Record                   RECORD,PRE()
Guid                        STRING(16),THREAD              !                     
EmployeeGuid                STRING(16),THREAD              !                     
Benefit_Type                STRING(20)                     !                     
Description                 STRING(255)                    !                     
                         END
                     END                       

Qualification        FILE,DRIVER('TOPSPEED'),PRE(Qua),CREATE,BINDABLE,THREAD !                     
EmployeeGuidKey          KEY(Qua:EmployeeGuid),NOCASE      !                     
SchoolGuidKey            KEY(Qua:SchoolGuid),NOCASE        !                     
GuidKey                  KEY(Qua:Guid),NOCASE,PRIMARY      !                     
Record                   RECORD,PRE()
Guid                        STRING(16),THREAD              !                     
EmployeeGuid                STRING(16),THREAD              !                     
SchoolGuid                  STRING(16),THREAD              !                     
Major                       STRING(100)                    !                     
Year                        STRING(4)                      ! The year when the qualification was obtained
                         END
                     END                       

Schools              FILE,DRIVER('TOPSPEED'),PRE(Sch),CREATE,BINDABLE,THREAD !                     
QualificationGuidKey     KEY(Sch:QualificationGuid),NOCASE !                     
GuidKey                  KEY(Sch:Guid),NOCASE,PRIMARY      !                     
Record                   RECORD,PRE()
Guid                        STRING(16),THREAD              !                     
Name                        STRING(100)                    !                     
Address                     STRING(255)                    !                     
QualificationGuid           STRING(16),THREAD              !                     
                         END
                     END                       

LinkBenefitsEmployee FILE,DRIVER('TOPSPEED'),PRE(Lin),CREATE,BINDABLE,THREAD !                     
GuidKey                  KEY(Lin:Guid),NOCASE,PRIMARY      !                     
BenefitsGuidKey          KEY(Lin:BenefitsGuid),NOCASE      !                     
EmployeeGuidKey          KEY(Lin:EmployeeGuid),NOCASE      !                     
Record                   RECORD,PRE()
Guid                        STRING(16),THREAD              !                     
EmployeeGuid                STRING(16),THREAD              !                     
BenefitsGuid                STRING(16),THREAD              !                     
                         END
                     END                       

LinkEmployeeQualification FILE,DRIVER('TOPSPEED'),PRE(Lin2),CREATE,BINDABLE,THREAD !                     
GuidKey                  KEY(Lin2:Guid),NOCASE,PRIMARY     !                     
EmployeeGuidKey          KEY(Lin2:EmployeeGuid),NOCASE     !                     
QualificationGuidKey     KEY(Lin2:QualificationGuid),NOCASE !                     
Record                   RECORD,PRE()
Guid                        STRING(16),THREAD              !                     
EmployeeGuid                STRING(16),THREAD              !                     
QualificationGuid           STRING(16),THREAD              !                     
                         END
                     END                       

!endregion

Access:Employees     &FileManager,THREAD                   ! FileManager for Employees
Relate:Employees     &RelationManager,THREAD               ! RelationManager for Employees
Access:Phones        &FileManager,THREAD                   ! FileManager for Phones
Relate:Phones        &RelationManager,THREAD               ! RelationManager for Phones
Access:Salary        &FileManager,THREAD                   ! FileManager for Salary
Relate:Salary        &RelationManager,THREAD               ! RelationManager for Salary
Access:Benefits      &FileManager,THREAD                   ! FileManager for Benefits
Relate:Benefits      &RelationManager,THREAD               ! RelationManager for Benefits
Access:Qualification &FileManager,THREAD                   ! FileManager for Qualification
Relate:Qualification &RelationManager,THREAD               ! RelationManager for Qualification
Access:Schools       &FileManager,THREAD                   ! FileManager for Schools
Relate:Schools       &RelationManager,THREAD               ! RelationManager for Schools
Access:LinkBenefitsEmployee &FileManager,THREAD            ! FileManager for LinkBenefitsEmployee
Relate:LinkBenefitsEmployee &RelationManager,THREAD        ! RelationManager for LinkBenefitsEmployee
Access:LinkEmployeeQualification &FileManager,THREAD       ! FileManager for LinkEmployeeQualification
Relate:LinkEmployeeQualification &RelationManager,THREAD   ! RelationManager for LinkEmployeeQualification

FuzzyMatcher         FuzzyClass                            ! Global fuzzy matcher
GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               INIClass                              ! Global non-volatile storage manager
GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  FuzzyMatcher.Init                                        ! Initilaize the browse 'fuzzy matcher'
  FuzzyMatcher.SetOption(MatchOption:NoCase, 1)            ! Configure case matching
  FuzzyMatcher.SetOption(MatchOption:WordOnly, 0)          ! Configure 'word only' matching
  INIMgr.Init('.\EmployeesApp.INI', NVD_INI)               ! Configure INIManager to use INI file
  DctInit()
  Main
  INIMgr.Update
  INIMgr.Kill                                              ! Destroy INI manager
  FuzzyMatcher.Kill                                        ! Destroy fuzzy matcher


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()

