

   MEMBER('EmployeeApp.clw')                               ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('EMPLOYEEAPP001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('EMPLOYEEAPP002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('EMPLOYEEAPP003.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('EMPLOYEEAPP004.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! Wizard Application for C:\Users\user\Documents\Clarion Projects\DictionaryExample\Employees.dct
!!! </summary>
Main PROCEDURE 

AppFrame APPLICATION('Application'),AT(,,449,265),CENTER,IMM,SYSTEM,MAX, |
      ICON('WAFRAME.ICO'),STATUS(-1,80,120,45),FONT('Segoe UI',10,COLOR:Black, |
      FONT:regular,CHARSET:DEFAULT),WALLPAPER('C:\Users\user\Downloads\bg.png'),Tiled, |
      RESIZE
    MENUBAR,USE(?Menubar)
      MENU('&File'),USE(?FileMenu)
        ITEM('&Print Setup ...'),USE(?PrintSetup),MSG('Setup printer'), |
            STD(STD:PrintSetup)
        ITEM(''),SEPARATOR,USE(?SEPARATOR1)
        ITEM('E&xit'),USE(?Exit),MSG('Exit this application'),STD(STD:Close)
      END
      MENU('&Edit'),USE(?EditMenu)
        ITEM('Cu&t'),USE(?Cut),MSG('Cut Selection To Clipboard'),STD(STD:Cut)
        ITEM('&Copy'),USE(?Copy),MSG('Copy Selection To Clipboard'),STD(STD:Copy)
        ITEM('&Paste'),USE(?Paste),MSG('Paste From Clipboard'),STD(STD:Paste)
      END
      MENU('&Browse'),USE(?BrowseMenu)
        ITEM('Browse the Employees file'),USE(?BrowseEmployees),MSG('Browse Employees')
        ITEM('Browse the Phones file'),USE(?BrowsePhones),MSG('Browse Phones')
        ITEM('Browse the Salary file'),USE(?BrowseSalary),MSG('Browse Salary')
        ITEM('Browse the Benefits file'),USE(?BrowseBenefits),MSG('Browse Benefits')
        ITEM('Browse the Qualification file'),USE(?BrowseQualification), |
            MSG('Browse Qualification')
        ITEM('Browse the Schools file'),USE(?BrowseSchools),MSG('Browse Schools')
        ITEM('Browse the LinkBenefitsEmployee file'),USE(?BrowseLinkBenefitsEmployee), |
            MSG('Browse LinkBenefitsEmployee')
        ITEM('Browse the LinkEmployeeQualification file'),USE(?BrowseLinkEmployeeQualification) |
            ,MSG('Browse LinkEmployeeQualification')
      END
      MENU('&Reports'),USE(?ReportMenu),MSG('Report data')
        MENU('Report the Employees file'),USE(?ReportEmployees)
          ITEM('Print by Emp:PhoneGuidKey key'),USE(?ReportEmployeesByEmp:PhoneGuidKey), |
              MSG('Print ordered by the Emp:PhoneGuidKey key')
          ITEM('Print by Emp:BenefitsGuidKey key'),USE(?ReportEmployeesByEmp:BenefitsGuidKey) |
              ,MSG('Print ordered by the Emp:BenefitsGuidKey key')
          ITEM('Print by Emp:SalaryGuidKey key'),USE(?ReportEmployeesByEmp:SalaryGuidKey) |
              ,MSG('Print ordered by the Emp:SalaryGuidKey key')
          ITEM('Print by Emp:QualificationGuidKey key'),USE(?ReportEmployeesByEmp:QualificationGuidKey) |
              ,MSG('Print ordered by the Emp:QualificationGuidKey key')
          ITEM('Print by Emp:GuidKey key'),USE(?ReportEmployeesByEmp:GuidKey), |
              MSG('Print ordered by the Emp:GuidKey key')
        END
        MENU('Report the Phones file'),USE(?ReportPhones)
          ITEM('Print by Pho:EmployeeGuidKey key'),USE(?ReportPhonesByPho:EmployeeGuidKey) |
              ,MSG('Print ordered by the Pho:EmployeeGuidKey key')
          ITEM('Print by Pho:GuidKey key'),USE(?ReportPhonesByPho:GuidKey), |
              MSG('Print ordered by the Pho:GuidKey key')
        END
        MENU('Report the Salary file'),USE(?ReportSalary)
          ITEM('Print by Sal:EmployeeGuidKey key'),USE(?ReportSalaryBySal:EmployeeGuidKey) |
              ,MSG('Print ordered by the Sal:EmployeeGuidKey key')
          ITEM('Print by Sal:GuidKey key'),USE(?ReportSalaryBySal:GuidKey), |
              MSG('Print ordered by the Sal:GuidKey key')
        END
        MENU('Report the Benefits file'),USE(?ReportBenefits)
          ITEM('Print by Ben:EmployeeGuidKey key'),USE(?ReportBenefitsByBen:EmployeeGuidKey) |
              ,MSG('Print ordered by the Ben:EmployeeGuidKey key')
          ITEM('Print by Ben:GuidKey key'),USE(?ReportBenefitsByBen:GuidKey), |
              MSG('Print ordered by the Ben:GuidKey key')
        END
        MENU('Report the Qualification file'),USE(?ReportQualification)
          ITEM('Print by Qua:EmployeeGuidKey key'),USE(?ReportQualificationByQua:EmployeeGuidKey) |
              ,MSG('Print ordered by the Qua:EmployeeGuidKey key')
          ITEM('Print by Qua:SchoolGuidKey key'),USE(?ReportQualificationByQua:SchoolGuidKey) |
              ,MSG('Print ordered by the Qua:SchoolGuidKey key')
          ITEM('Print by Qua:GuidKey key'),USE(?ReportQualificationByQua:GuidKey), |
              MSG('Print ordered by the Qua:GuidKey key')
        END
        MENU('Report the Schools file'),USE(?ReportSchools)
          ITEM('Print by Sch:QualificationGuidKey key'),USE(?ReportSchoolsBySch:QualificationGuidKey) |
              ,MSG('Print ordered by the Sch:QualificationGuidKey key')
          ITEM('Print by Sch:GuidKey key'),USE(?ReportSchoolsBySch:GuidKey), |
              MSG('Print ordered by the Sch:GuidKey key')
        END
        MENU('Report the LinkBenefitsEmployee file'),USE(?ReportLinkBenefitsEmployee)
          ITEM('Print by Lin:GuidKey key'),USE(?ReportLinkBenefitsEmployeeByLin:GuidKey) |
              ,MSG('Print ordered by the Lin:GuidKey key')
          ITEM('Print by Lin:BenefitsGuidKey key'),USE(?ReportLinkBenefitsEmployeeByLin:BenefitsGuidKey) |
              ,MSG('Print ordered by the Lin:BenefitsGuidKey key')
          ITEM('Print by Lin:EmployeeGuidKey key'),USE(?ReportLinkBenefitsEmployeeByLin:EmployeeGuidKey) |
              ,MSG('Print ordered by the Lin:EmployeeGuidKey key')
        END
        MENU('Report the LinkEmployeeQualification file'),USE(?ReportLinkEmployeeQualification) |
            
          ITEM('Print by Lin2:GuidKey key'),USE(?ReportLinkEmployeeQualificationByLin2:GuidKey) |
              ,MSG('Print ordered by the Lin2:GuidKey key')
          ITEM('Print by Lin2:EmployeeGuidKey key'),USE(?ReportLinkEmployeeQualificationByLin2:EmployeeGuidKey) |
              ,MSG('Print ordered by the Lin2:EmployeeGuidKey key')
          ITEM('Print by Lin2:QualificationGuidKey key'),USE(?ReportLinkEmployeeQualificationByLin2:QualificationGuidKey) |
              ,MSG('Print ordered by the Lin2:QualificationGuidKey key')
        END
      END
      MENU('&Window'),USE(?WindowMenu),STD(STD:WindowList)
        ITEM('T&ile'),USE(?Tile),MSG('Arrange multiple opened windows'), |
            STD(STD:TileWindow)
        ITEM('&Cascade'),USE(?Cascade),MSG('Arrange multiple opened windows'), |
            STD(STD:CascadeWindow)
        ITEM('&Arrange Icons'),USE(?Arrange),MSG('Arrange the icons for minimize' & |
            'd windows'),STD(STD:ArrangeIcons)
      END
      MENU('&Help'),USE(?HelpMenu)
        ITEM('&Contents'),USE(?Helpindex),MSG('View the contents of the help file'), |
            STD(STD:HelpIndex)
        ITEM('&Search for Help On...'),USE(?HelpSearch),MSG('Search for help on ' & |
            'a subject'),STD(STD:HelpSearch)
        ITEM('&How to Use Help'),USE(?HelpOnHelp),MSG('Provides general instruct' & |
            'ions on using help'),STD(STD:HelpOnHelp)
      END
    END
    TOOLBAR,AT(0,0,449,23),USE(?TOOLBAR1)
      BUTTON('Export'),AT(13,6),USE(?BUTTON1),FONT(,,,FONT:regular)
    END
  END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::BrowseMenu ROUTINE                                   ! Code for menu items on ?BrowseMenu
  CASE ACCEPTED()
  OF ?BrowseEmployees
    START(BrowseEmployees, 050000)
  OF ?BrowsePhones
    START(BrowsePhones, 050000)
  OF ?BrowseSalary
    START(BrowseSalary, 050000)
  OF ?BrowseBenefits
    START(BrowseBenefits, 050000)
  OF ?BrowseQualification
    START(BrowseQualification, 050000)
  OF ?BrowseSchools
    START(BrowseSchools, 050000)
  OF ?BrowseLinkBenefitsEmployee
    START(BrowseLinkBenefitsEmployee, 050000)
  OF ?BrowseLinkEmployeeQualification
    START(BrowseLinkEmployeeQualification, 050000)
  END
Menu::ReportMenu ROUTINE                                   ! Code for menu items on ?ReportMenu
Menu::ReportEmployees ROUTINE                              ! Code for menu items on ?ReportEmployees
  CASE ACCEPTED()
  OF ?ReportEmployeesByEmp:PhoneGuidKey
    START(ReportEmployeesByEmp:PhoneGuidKey, 050000)
  OF ?ReportEmployeesByEmp:BenefitsGuidKey
    START(ReportEmployeesByEmp:BenefitsGuidKey, 050000)
  OF ?ReportEmployeesByEmp:SalaryGuidKey
    START(ReportEmployeesByEmp:SalaryGuidKey, 050000)
  OF ?ReportEmployeesByEmp:QualificationGuidKey
    START(ReportEmployeesByEmp:QualificationGuidKey, 050000)
  OF ?ReportEmployeesByEmp:GuidKey
    START(ReportEmployeesByEmp:GuidKey, 050000)
  END
Menu::ReportPhones ROUTINE                                 ! Code for menu items on ?ReportPhones
  CASE ACCEPTED()
  OF ?ReportPhonesByPho:EmployeeGuidKey
    START(ReportPhonesByPho:EmployeeGuidKey, 050000)
  OF ?ReportPhonesByPho:GuidKey
    START(ReportPhonesByPho:GuidKey, 050000)
  END
Menu::ReportSalary ROUTINE                                 ! Code for menu items on ?ReportSalary
  CASE ACCEPTED()
  OF ?ReportSalaryBySal:EmployeeGuidKey
    START(ReportSalaryBySal:EmployeeGuidKey, 050000)
  OF ?ReportSalaryBySal:GuidKey
    START(ReportSalaryBySal:GuidKey, 050000)
  END
Menu::ReportBenefits ROUTINE                               ! Code for menu items on ?ReportBenefits
  CASE ACCEPTED()
  OF ?ReportBenefitsByBen:EmployeeGuidKey
    START(ReportBenefitsByBen:EmployeeGuidKey, 050000)
  OF ?ReportBenefitsByBen:GuidKey
    START(ReportBenefitsByBen:GuidKey, 050000)
  END
Menu::ReportQualification ROUTINE                          ! Code for menu items on ?ReportQualification
  CASE ACCEPTED()
  OF ?ReportQualificationByQua:EmployeeGuidKey
    START(ReportQualificationByQua:EmployeeGuidKey, 050000)
  OF ?ReportQualificationByQua:SchoolGuidKey
    START(ReportQualificationByQua:SchoolGuidKey, 050000)
  OF ?ReportQualificationByQua:GuidKey
    START(ReportQualificationByQua:GuidKey, 050000)
  END
Menu::ReportSchools ROUTINE                                ! Code for menu items on ?ReportSchools
  CASE ACCEPTED()
  OF ?ReportSchoolsBySch:QualificationGuidKey
    START(ReportSchoolsBySch:QualificationGuidKey, 050000)
  OF ?ReportSchoolsBySch:GuidKey
    START(ReportSchoolsBySch:GuidKey, 050000)
  END
Menu::ReportLinkBenefitsEmployee ROUTINE                   ! Code for menu items on ?ReportLinkBenefitsEmployee
  CASE ACCEPTED()
  OF ?ReportLinkBenefitsEmployeeByLin:GuidKey
    START(ReportLinkBenefitsEmployeeByLin:GuidKey, 050000)
  OF ?ReportLinkBenefitsEmployeeByLin:BenefitsGuidKey
    START(ReportLinkBenefitsEmployeeByLin:BenefitsGuidKey, 050000)
  OF ?ReportLinkBenefitsEmployeeByLin:EmployeeGuidKey
    START(ReportLinkBenefitsEmployeeByLin:EmployeeGuidKey, 050000)
  END
Menu::ReportLinkEmployeeQualification ROUTINE              ! Code for menu items on ?ReportLinkEmployeeQualification
  CASE ACCEPTED()
  OF ?ReportLinkEmployeeQualificationByLin2:GuidKey
    START(ReportLinkEmployeeQualificationByLin2:GuidKey, 050000)
  OF ?ReportLinkEmployeeQualificationByLin2:EmployeeGuidKey
    START(ReportLinkEmployeeQualificationByLin2:EmployeeGuidKey, 050000)
  OF ?ReportLinkEmployeeQualificationByLin2:QualificationGuidKey
    START(ReportLinkEmployeeQualificationByLin2:QualificationGuidKey, 050000)
  END
Menu::WindowMenu ROUTINE                                   ! Code for menu items on ?WindowMenu
Menu::HelpMenu ROUTINE                                     ! Code for menu items on ?HelpMenu

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  SELF.Open(AppFrame)                                      ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('Main',AppFrame)                            ! Restore window settings from non-volatile store
  SELF.SetAlerts()
      AppFrame{PROP:TabBarVisible}  = False
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.Opened
    INIMgr.Update('Main',AppFrame)                         ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
    CASE ACCEPTED()
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::BrowseMenu                                  ! Process menu items on ?BrowseMenu menu
      DO Menu::ReportMenu                                  ! Process menu items on ?ReportMenu menu
      DO Menu::ReportEmployees                             ! Process menu items on ?ReportEmployees menu
      DO Menu::ReportPhones                                ! Process menu items on ?ReportPhones menu
      DO Menu::ReportSalary                                ! Process menu items on ?ReportSalary menu
      DO Menu::ReportBenefits                              ! Process menu items on ?ReportBenefits menu
      DO Menu::ReportQualification                         ! Process menu items on ?ReportQualification menu
      DO Menu::ReportSchools                               ! Process menu items on ?ReportSchools menu
      DO Menu::ReportLinkBenefitsEmployee                  ! Process menu items on ?ReportLinkBenefitsEmployee menu
      DO Menu::ReportLinkEmployeeQualification             ! Process menu items on ?ReportLinkEmployeeQualification menu
      DO Menu::WindowMenu                                  ! Process menu items on ?WindowMenu menu
      DO Menu::HelpMenu                                    ! Process menu items on ?HelpMenu menu
    END
  ReturnValue = PARENT.TakeAccepted()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Employees file
!!! </summary>
BrowseEmployees PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Employees)
                       PROJECT(Emp:Guid)
                       PROJECT(Emp:Full_Names)
                       PROJECT(Emp:Job_Title)
                       PROJECT(Emp:Address)
                       PROJECT(Emp:PhoneGuid)
                       PROJECT(Emp:Employment_Date)
                       PROJECT(Emp:QualificationGuid)
                       PROJECT(Emp:SalaryGuid)
                       PROJECT(Emp:BenefitsGuid)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Emp:Guid               LIKE(Emp:Guid)                 !List box control field - type derived from field
Emp:Full_Names         LIKE(Emp:Full_Names)           !List box control field - type derived from field
Emp:Job_Title          LIKE(Emp:Job_Title)            !List box control field - type derived from field
Emp:Address            LIKE(Emp:Address)              !List box control field - type derived from field
Emp:PhoneGuid          LIKE(Emp:PhoneGuid)            !List box control field - type derived from field
Emp:Employment_Date    LIKE(Emp:Employment_Date)      !List box control field - type derived from field
Emp:QualificationGuid  LIKE(Emp:QualificationGuid)    !List box control field - type derived from field
Emp:SalaryGuid         LIKE(Emp:SalaryGuid)           !List box control field - type derived from field
Emp:BenefitsGuid       LIKE(Emp:BenefitsGuid)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Employees file'),AT(,,357,208),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowseEmployees'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(5,4,349,151),USE(?Browse:1),HVSCROLL,FORMAT('68L(2)|M~Guid~@s16@80L(2)|M~Full N' & |
  'ames~@s100@80L(2)|M~Job Title~@s20@80L(2)|M~Address~@s255@80L(2)|M~Phone Guid~@s20@7' & |
  '0R(2)|M~Employment Date~C(0)@n-14@69L(2)|M~Qualification Guid~@s16@68L(2)|M~Salary G' & |
  'uid~@s16@68L(2)|M~Benefits Guid~@s16@'),FROM(Queue:Browse:1),IMM,MSG('CapeSoft Employees')
                       BUTTON('&View'),AT(138,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(192,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(246,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,MSG('Change the Record'), |
  TIP('Change the Record')
                       BUTTON('&Delete'),AT(300,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                       END
                       BUTTON('&Close'),AT(250,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(304,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort3:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 4
BRW1::Sort4:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 5
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
BRW1::Sort3:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 4
BRW1::Sort4:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 5
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(Employees:Record)
? DEBUGHOOK(Salary:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowseEmployees')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Employees.Open                                    ! File Employees used by this procedure, so make sure it's RelationManager is open
  Relate:Salary.Open                                       ! File Salary used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Employees,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Emp:BenefitsGuid for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Emp:BenefitsGuidKey) ! Add the sort order for Emp:BenefitsGuidKey for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Emp:BenefitsGuid,1,BRW1)       ! Initialize the browse locator using  using key: Emp:BenefitsGuidKey , Emp:BenefitsGuid
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Emp:SalaryGuid for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Emp:SalaryGuidKey) ! Add the sort order for Emp:SalaryGuidKey for sort order 2
  BRW1.AddRange(Emp:SalaryGuid,Relate:Employees,Relate:Salary) ! Add file relationship range limit for sort order 2
  BRW1::Sort3:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Emp:QualificationGuid for sort order 3
  BRW1.AddSortOrder(BRW1::Sort3:StepClass,Emp:QualificationGuidKey) ! Add the sort order for Emp:QualificationGuidKey for sort order 3
  BRW1.AddLocator(BRW1::Sort3:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort3:Locator.Init(,Emp:QualificationGuid,1,BRW1)  ! Initialize the browse locator using  using key: Emp:QualificationGuidKey , Emp:QualificationGuid
  BRW1::Sort4:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Emp:Guid for sort order 4
  BRW1.AddSortOrder(BRW1::Sort4:StepClass,Emp:GuidKey)     ! Add the sort order for Emp:GuidKey for sort order 4
  BRW1.AddLocator(BRW1::Sort4:Locator)                     ! Browse has a locator for sort order 4
  BRW1::Sort4:Locator.Init(,Emp:Guid,1,BRW1)               ! Initialize the browse locator using  using key: Emp:GuidKey , Emp:Guid
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Emp:PhoneGuid for sort order 5
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Emp:PhoneGuidKey) ! Add the sort order for Emp:PhoneGuidKey for sort order 5
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 5
  BRW1::Sort0:Locator.Init(,Emp:PhoneGuid,1,BRW1)          ! Initialize the browse locator using  using key: Emp:PhoneGuidKey , Emp:PhoneGuid
  BRW1.AddField(Emp:Guid,BRW1.Q.Emp:Guid)                  ! Field Emp:Guid is a hot field or requires assignment from browse
  BRW1.AddField(Emp:Full_Names,BRW1.Q.Emp:Full_Names)      ! Field Emp:Full_Names is a hot field or requires assignment from browse
  BRW1.AddField(Emp:Job_Title,BRW1.Q.Emp:Job_Title)        ! Field Emp:Job_Title is a hot field or requires assignment from browse
  BRW1.AddField(Emp:Address,BRW1.Q.Emp:Address)            ! Field Emp:Address is a hot field or requires assignment from browse
  BRW1.AddField(Emp:PhoneGuid,BRW1.Q.Emp:PhoneGuid)        ! Field Emp:PhoneGuid is a hot field or requires assignment from browse
  BRW1.AddField(Emp:Employment_Date,BRW1.Q.Emp:Employment_Date) ! Field Emp:Employment_Date is a hot field or requires assignment from browse
  BRW1.AddField(Emp:QualificationGuid,BRW1.Q.Emp:QualificationGuid) ! Field Emp:QualificationGuid is a hot field or requires assignment from browse
  BRW1.AddField(Emp:SalaryGuid,BRW1.Q.Emp:SalaryGuid)      ! Field Emp:SalaryGuid is a hot field or requires assignment from browse
  BRW1.AddField(Emp:BenefitsGuid,BRW1.Q.Emp:BenefitsGuid)  ! Field Emp:BenefitsGuid is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseEmployees',QuickWindow)              ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateEmployees
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Employees.Close
    Relate:Salary.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseEmployees',QuickWindow)           ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdateEmployees
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSIF CHOICE(?CurrentTab) = 4
    RETURN SELF.SetSort(3,Force)
  ELSIF CHOICE(?CurrentTab) = 5
    RETURN SELF.SetSort(4,Force)
  ELSE
    RETURN SELF.SetSort(5,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Employees File by Emp:PhoneGuidKey
!!! </summary>
ReportEmployeesByEmp:PhoneGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Employees)
                       PROJECT(Emp:Address)
                       PROJECT(Emp:BenefitsGuid)
                       PROJECT(Emp:Employment_Date)
                       PROJECT(Emp:Full_Names)
                       PROJECT(Emp:Guid)
                       PROJECT(Emp:Job_Title)
                       PROJECT(Emp:PhoneGuid)
                       PROJECT(Emp:QualificationGuid)
                       PROJECT(Emp:SalaryGuid)
                     END
ProgressWindow       WINDOW('Report Employees'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Employees Report'),AT(250,1190,8000,9310),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,940),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Employees file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,610),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,610),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,610),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,610),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Name'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Job Title'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Address'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Phone Guid'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                         STRING('Date'),AT(2050,570,1900,170),USE(?HeaderTitle:6),TRN
                         STRING('Guid'),AT(4050,570,1900,170),USE(?HeaderTitle:7),TRN
                         STRING('Guid'),AT(6050,570,1900,170),USE(?HeaderTitle:8),TRN
                         STRING('Guid'),AT(50,750,1900,170),USE(?HeaderTitle:9),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,750),USE(?Detail)
                         LINE,AT(0,0,0,750),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,750),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,750),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,750),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,750),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Emp:Guid)
                         STRING(@s100),AT(2050,50,1900,170),USE(Emp:Full_Names)
                         STRING(@s20),AT(4050,50,1900,170),USE(Emp:Job_Title)
                         STRING(@s255),AT(6050,50,1900,170),USE(Emp:Address)
                         STRING(@s20),AT(50,230,1900,170),USE(Emp:PhoneGuid)
                         STRING(@n-14),AT(2050,230,1900,170),USE(Emp:Employment_Date),RIGHT(1)
                         STRING(@s16),AT(4050,230,1900,170),USE(Emp:QualificationGuid)
                         STRING(@s16),AT(6050,230,1900,170),USE(Emp:SalaryGuid)
                         STRING(@s16),AT(50,410,1900,170),USE(Emp:BenefitsGuid)
                         LINE,AT(0,750,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,10500,8000,250),USE(?Footer)
                         STRING('Date:'),AT(115,52,344,135),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Time:'),AT(1625,52,271,135),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp:2),FONT('Arial',8,, |
  FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,8000,10500),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,8000,10500),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Employees:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReportEmployeesByEmp:PhoneGuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Employees.Open                                    ! File Employees used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportEmployeesByEmp:PhoneGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Employees, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Emp:PhoneGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Emp:PhoneGuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Employees.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Employees.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportEmployeesByEmp:PhoneGuidKey',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Employees File by Emp:BenefitsGuidKey
!!! </summary>
ReportEmployeesByEmp:BenefitsGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Employees)
                       PROJECT(Emp:Address)
                       PROJECT(Emp:BenefitsGuid)
                       PROJECT(Emp:Employment_Date)
                       PROJECT(Emp:Full_Names)
                       PROJECT(Emp:Guid)
                       PROJECT(Emp:Job_Title)
                       PROJECT(Emp:PhoneGuid)
                       PROJECT(Emp:QualificationGuid)
                       PROJECT(Emp:SalaryGuid)
                     END
ProgressWindow       WINDOW('Report Employees'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Employees Report'),AT(250,1190,8000,9310),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,940),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Employees file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,610),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,610),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,610),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,610),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Name'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Job Title'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Address'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Phone Guid'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                         STRING('Date'),AT(2050,570,1900,170),USE(?HeaderTitle:6),TRN
                         STRING('Guid'),AT(4050,570,1900,170),USE(?HeaderTitle:7),TRN
                         STRING('Guid'),AT(6050,570,1900,170),USE(?HeaderTitle:8),TRN
                         STRING('Guid'),AT(50,750,1900,170),USE(?HeaderTitle:9),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,750),USE(?Detail)
                         LINE,AT(0,0,0,750),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,750),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,750),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,750),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,750),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Emp:Guid)
                         STRING(@s100),AT(2050,50,1900,170),USE(Emp:Full_Names)
                         STRING(@s20),AT(4050,50,1900,170),USE(Emp:Job_Title)
                         STRING(@s255),AT(6050,50,1900,170),USE(Emp:Address)
                         STRING(@s20),AT(50,230,1900,170),USE(Emp:PhoneGuid)
                         STRING(@n-14),AT(2050,230,1900,170),USE(Emp:Employment_Date),RIGHT(1)
                         STRING(@s16),AT(4050,230,1900,170),USE(Emp:QualificationGuid)
                         STRING(@s16),AT(6050,230,1900,170),USE(Emp:SalaryGuid)
                         STRING(@s16),AT(50,410,1900,170),USE(Emp:BenefitsGuid)
                         LINE,AT(0,750,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,10500,8000,250),USE(?Footer)
                         STRING('Date:'),AT(115,52,344,135),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Time:'),AT(1625,52,271,135),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp:2),FONT('Arial',8,, |
  FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,8000,10500),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,8000,10500),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Employees:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReportEmployeesByEmp:BenefitsGuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Employees.Open                                    ! File Employees used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportEmployeesByEmp:BenefitsGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Employees, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Emp:BenefitsGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Emp:BenefitsGuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Employees.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Employees.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportEmployeesByEmp:BenefitsGuidKey',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Employees File by Emp:SalaryGuidKey
!!! </summary>
ReportEmployeesByEmp:SalaryGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Employees)
                       PROJECT(Emp:Address)
                       PROJECT(Emp:BenefitsGuid)
                       PROJECT(Emp:Employment_Date)
                       PROJECT(Emp:Full_Names)
                       PROJECT(Emp:Guid)
                       PROJECT(Emp:Job_Title)
                       PROJECT(Emp:PhoneGuid)
                       PROJECT(Emp:QualificationGuid)
                       PROJECT(Emp:SalaryGuid)
                     END
ProgressWindow       WINDOW('Report Employees'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Employees Report'),AT(250,1190,8000,9310),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,940),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Employees file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,610),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,610),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,610),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,610),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Name'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Job Title'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Address'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Phone Guid'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                         STRING('Date'),AT(2050,570,1900,170),USE(?HeaderTitle:6),TRN
                         STRING('Guid'),AT(4050,570,1900,170),USE(?HeaderTitle:7),TRN
                         STRING('Guid'),AT(6050,570,1900,170),USE(?HeaderTitle:8),TRN
                         STRING('Guid'),AT(50,750,1900,170),USE(?HeaderTitle:9),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,750),USE(?Detail)
                         LINE,AT(0,0,0,750),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,750),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,750),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,750),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,750),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Emp:Guid)
                         STRING(@s100),AT(2050,50,1900,170),USE(Emp:Full_Names)
                         STRING(@s20),AT(4050,50,1900,170),USE(Emp:Job_Title)
                         STRING(@s255),AT(6050,50,1900,170),USE(Emp:Address)
                         STRING(@s20),AT(50,230,1900,170),USE(Emp:PhoneGuid)
                         STRING(@n-14),AT(2050,230,1900,170),USE(Emp:Employment_Date),RIGHT(1)
                         STRING(@s16),AT(4050,230,1900,170),USE(Emp:QualificationGuid)
                         STRING(@s16),AT(6050,230,1900,170),USE(Emp:SalaryGuid)
                         STRING(@s16),AT(50,410,1900,170),USE(Emp:BenefitsGuid)
                         LINE,AT(0,750,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,10500,8000,250),USE(?Footer)
                         STRING('Date:'),AT(115,52,344,135),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Time:'),AT(1625,52,271,135),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp:2),FONT('Arial',8,, |
  FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,8000,10500),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,8000,10500),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Employees:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReportEmployeesByEmp:SalaryGuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Employees.Open                                    ! File Employees used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportEmployeesByEmp:SalaryGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Employees, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Emp:SalaryGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Emp:SalaryGuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Employees.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Employees.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportEmployeesByEmp:SalaryGuidKey',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Employees File by Emp:QualificationGuidKey
!!! </summary>
ReportEmployeesByEmp:QualificationGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Employees)
                       PROJECT(Emp:Address)
                       PROJECT(Emp:BenefitsGuid)
                       PROJECT(Emp:Employment_Date)
                       PROJECT(Emp:Full_Names)
                       PROJECT(Emp:Guid)
                       PROJECT(Emp:Job_Title)
                       PROJECT(Emp:PhoneGuid)
                       PROJECT(Emp:QualificationGuid)
                       PROJECT(Emp:SalaryGuid)
                     END
ProgressWindow       WINDOW('Report Employees'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Employees Report'),AT(250,1190,8000,9310),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,940),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Employees file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,610),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,610),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,610),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,610),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Name'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Job Title'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Address'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Phone Guid'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                         STRING('Date'),AT(2050,570,1900,170),USE(?HeaderTitle:6),TRN
                         STRING('Guid'),AT(4050,570,1900,170),USE(?HeaderTitle:7),TRN
                         STRING('Guid'),AT(6050,570,1900,170),USE(?HeaderTitle:8),TRN
                         STRING('Guid'),AT(50,750,1900,170),USE(?HeaderTitle:9),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,750),USE(?Detail)
                         LINE,AT(0,0,0,750),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,750),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,750),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,750),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,750),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Emp:Guid)
                         STRING(@s100),AT(2050,50,1900,170),USE(Emp:Full_Names)
                         STRING(@s20),AT(4050,50,1900,170),USE(Emp:Job_Title)
                         STRING(@s255),AT(6050,50,1900,170),USE(Emp:Address)
                         STRING(@s20),AT(50,230,1900,170),USE(Emp:PhoneGuid)
                         STRING(@n-14),AT(2050,230,1900,170),USE(Emp:Employment_Date),RIGHT(1)
                         STRING(@s16),AT(4050,230,1900,170),USE(Emp:QualificationGuid)
                         STRING(@s16),AT(6050,230,1900,170),USE(Emp:SalaryGuid)
                         STRING(@s16),AT(50,410,1900,170),USE(Emp:BenefitsGuid)
                         LINE,AT(0,750,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,10500,8000,250),USE(?Footer)
                         STRING('Date:'),AT(115,52,344,135),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Time:'),AT(1625,52,271,135),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp:2),FONT('Arial',8,, |
  FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,8000,10500),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,8000,10500),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Employees:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReportEmployeesByEmp:QualificationGuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Employees.Open                                    ! File Employees used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportEmployeesByEmp:QualificationGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Employees, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Emp:QualificationGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Emp:QualificationGuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Employees.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Employees.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportEmployeesByEmp:QualificationGuidKey',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Employees File by Emp:GuidKey
!!! </summary>
ReportEmployeesByEmp:GuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Employees)
                       PROJECT(Emp:Address)
                       PROJECT(Emp:BenefitsGuid)
                       PROJECT(Emp:Employment_Date)
                       PROJECT(Emp:Full_Names)
                       PROJECT(Emp:Guid)
                       PROJECT(Emp:Job_Title)
                       PROJECT(Emp:PhoneGuid)
                       PROJECT(Emp:QualificationGuid)
                       PROJECT(Emp:SalaryGuid)
                     END
ProgressWindow       WINDOW('Report Employees'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Employees Report'),AT(250,1190,8000,9310),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,940),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Employees file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,610),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,610),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,610),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,610),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Name'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Job Title'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Address'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Phone Guid'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                         STRING('Date'),AT(2050,570,1900,170),USE(?HeaderTitle:6),TRN
                         STRING('Guid'),AT(4050,570,1900,170),USE(?HeaderTitle:7),TRN
                         STRING('Guid'),AT(6050,570,1900,170),USE(?HeaderTitle:8),TRN
                         STRING('Guid'),AT(50,750,1900,170),USE(?HeaderTitle:9),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,750),USE(?Detail)
                         LINE,AT(0,0,0,750),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,750),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,750),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,750),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,750),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Emp:Guid)
                         STRING(@s100),AT(2050,50,1900,170),USE(Emp:Full_Names)
                         STRING(@s20),AT(4050,50,1900,170),USE(Emp:Job_Title)
                         STRING(@s255),AT(6050,50,1900,170),USE(Emp:Address)
                         STRING(@s20),AT(50,230,1900,170),USE(Emp:PhoneGuid)
                         STRING(@n-14),AT(2050,230,1900,170),USE(Emp:Employment_Date),RIGHT(1)
                         STRING(@s16),AT(4050,230,1900,170),USE(Emp:QualificationGuid)
                         STRING(@s16),AT(6050,230,1900,170),USE(Emp:SalaryGuid)
                         STRING(@s16),AT(50,410,1900,170),USE(Emp:BenefitsGuid)
                         LINE,AT(0,750,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,10500,8000,250),USE(?Footer)
                         STRING('Date:'),AT(115,52,344,135),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Time:'),AT(1625,52,271,135),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp:2),FONT('Arial',8,, |
  FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,8000,10500),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,8000,10500),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Employees:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReportEmployeesByEmp:GuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Employees.Open                                    ! File Employees used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportEmployeesByEmp:GuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Employees, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Emp:Guid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Emp:GuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Employees.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Employees.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportEmployeesByEmp:GuidKey',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Phones file
!!! </summary>
BrowsePhones PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Phones)
                       PROJECT(Pho:Guid)
                       PROJECT(Pho:EmployeeGuid)
                       PROJECT(Pho:Phone_Type)
                       PROJECT(Pho:Phone_Number)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pho:Guid               LIKE(Pho:Guid)                 !List box control field - type derived from field
Pho:EmployeeGuid       LIKE(Pho:EmployeeGuid)         !List box control field - type derived from field
Pho:Phone_Type         LIKE(Pho:Phone_Type)           !List box control field - type derived from field
Pho:Phone_Number       LIKE(Pho:Phone_Number)         !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Phones file'),AT(,,304,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowsePhones'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,288,124),USE(?Browse:1),HVSCROLL,FORMAT('68L(2)|M~Guid~L(2)@s16@68L(2)|M~G' & |
  'uid~L(2)@s16@80L(2)|M~Phone Type~L(2)@s20@80L(2)|M~Phone Number~L(2)@s20@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Phones file')
                       BUTTON('&View'),AT(84,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(138,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(192,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(246,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,296,172),USE(?CurrentTab)
                         TAB('&1) EmployeeGuidKey'),USE(?Tab:2)
                           BUTTON('Select Employees'),AT(8,158,120,14),USE(?SelectEmployees),LEFT,ICON('WAPARENT.ICO'), |
  FLAT,MSG('Select Parent Field'),TIP('Select Parent Field')
                         END
                         TAB('&2) GuidKey'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Close'),AT(196,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(250,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
  STD(STD:Help),TIP('See Help Window')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(USHORT Number,BYTE Request),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(Employees:Record)
? DEBUGHOOK(Phones:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('BrowsePhones')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.AddItem(Toolbar)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Employees.Open                                    ! File Employees used by this procedure, so make sure it's RelationManager is open
  Relate:Phones.Open                                       ! File Phones used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Phones,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Pho:Guid for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Pho:GuidKey)     ! Add the sort order for Pho:GuidKey for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Pho:Guid,1,BRW1)               ! Initialize the browse locator using  using key: Pho:GuidKey , Pho:Guid
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Pho:EmployeeGuid for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Pho:EmployeeGuidKey) ! Add the sort order for Pho:EmployeeGuidKey for sort order 2
  BRW1.AddRange(Pho:EmployeeGuid,Relate:Phones,Relate:Employees) ! Add file relationship range limit for sort order 2
  BRW1.AddField(Pho:Guid,BRW1.Q.Pho:Guid)                  ! Field Pho:Guid is a hot field or requires assignment from browse
  BRW1.AddField(Pho:EmployeeGuid,BRW1.Q.Pho:EmployeeGuid)  ! Field Pho:EmployeeGuid is a hot field or requires assignment from browse
  BRW1.AddField(Pho:Phone_Type,BRW1.Q.Pho:Phone_Type)      ! Field Pho:Phone_Type is a hot field or requires assignment from browse
  BRW1.AddField(Pho:Phone_Number,BRW1.Q.Pho:Phone_Number)  ! Field Pho:Phone_Number is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowsePhones',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdatePhones
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Employees.Close
    Relate:Phones.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowsePhones',QuickWindow)              ! Save window data to non-volatile store
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE(USHORT Number,BYTE Request)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run(Number,Request)
  IF SELF.Request = ViewRecord
    ReturnValue = RequestCancelled                         ! Always return RequestCancelled if the form was opened in ViewRecord mode
  ELSE
    GlobalRequest = Request
    UpdatePhones
    ReturnValue = GlobalResponse
  END
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?SelectEmployees
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectEmployees()
      ThisWindow.Reset
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


BRW1.ResetSort PROCEDURE(BYTE Force)

ReturnValue          BYTE,AUTO

  CODE
  IF CHOICE(?CurrentTab) = 2
    RETURN SELF.SetSort(1,Force)
  ELSE
    RETURN SELF.SetSort(2,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Phones File by Pho:EmployeeGuidKey
!!! </summary>
ReportPhonesByPho:EmployeeGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Phones)
                       PROJECT(Pho:EmployeeGuid)
                       PROJECT(Pho:Guid)
                       PROJECT(Pho:Phone_Number)
                       PROJECT(Pho:Phone_Type)
                     END
ProgressWindow       WINDOW('Report Phones'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Phones Report'),AT(250,850,8000,9650),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,600),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Phones file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Phone Type'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Phone Number'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,250),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Pho:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Pho:EmployeeGuid)
                         STRING(@s20),AT(4050,50,1900,170),USE(Pho:Phone_Type)
                         STRING(@s20),AT(6050,50,1900,170),USE(Pho:Phone_Number)
                         LINE,AT(0,250,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,10500,8000,250),USE(?Footer)
                         STRING('Date:'),AT(115,52,344,135),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Time:'),AT(1625,52,271,135),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp:2),FONT('Arial',8,, |
  FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,8000,10500),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,8000,10500),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Phones:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReportPhonesByPho:EmployeeGuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Phones.Open                                       ! File Phones used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportPhonesByPho:EmployeeGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Phones, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pho:EmployeeGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Pho:EmployeeGuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Phones.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Phones.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPhonesByPho:EmployeeGuidKey',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Phones File by Pho:GuidKey
!!! </summary>
ReportPhonesByPho:GuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Phones)
                       PROJECT(Pho:EmployeeGuid)
                       PROJECT(Pho:Guid)
                       PROJECT(Pho:Phone_Number)
                       PROJECT(Pho:Phone_Type)
                     END
ProgressWindow       WINDOW('Report Phones'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Phones Report'),AT(250,850,8000,9650),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,600),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Phones file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Phone Type'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Phone Number'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,250),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Pho:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Pho:EmployeeGuid)
                         STRING(@s20),AT(4050,50,1900,170),USE(Pho:Phone_Type)
                         STRING(@s20),AT(6050,50,1900,170),USE(Pho:Phone_Number)
                         LINE,AT(0,250,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
                       END
                       FOOTER,AT(250,10500,8000,250),USE(?Footer)
                         STRING('Date:'),AT(115,52,344,135),USE(?ReportDatePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Date Stamp -->'),AT(490,52,927,135),USE(?ReportDateStamp:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('Time:'),AT(1625,52,271,135),USE(?ReportTimePrompt:2),FONT('Arial',8,,FONT:regular), |
  TRN
                         STRING('<<-- Time Stamp -->'),AT(1927,52,927,135),USE(?ReportTimeStamp:2),FONT('Arial',8,, |
  FONT:regular),TRN
                         STRING(@pPage <<#p),AT(6950,52,700,135),USE(?PageCount:2),FONT('Arial',8,,FONT:regular),PAGENO
                       END
                       FORM,AT(250,250,8000,10500),USE(?Form),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         IMAGE,AT(0,0,8000,10500),USE(?FormImage),TILED
                       END
                     END
ThisWindow           CLASS(ReportManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
OpenReport             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ThisReport           CLASS(ProcessClass)                   ! Process Manager
TakeRecord             PROCEDURE(),BYTE,PROC,DERIVED
                     END

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Phones:Record)
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('ReportPhonesByPho:GuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Phones.Open                                       ! File Phones used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportPhonesByPho:GuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Phones, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Pho:Guid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Pho:GuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Phones.SetQuickScan(1,Propagate:OneMany)
  ProgressWindow{PROP:Timer} = 10                          ! Assign timer interval
  SELF.SkipPreview = False
  Previewer.SetINIManager(INIMgr)
  Previewer.AllowUserZoom = True
  Previewer.Maximize = True
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Phones.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportPhonesByPho:GuidKey',ProgressWindow) ! Save window data to non-volatile store
  END
  ProgressMgr.Kill()
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.OpenReport PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.OpenReport()
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportDateStamp:2{PROP:Text} = FORMAT(TODAY(),@D17)
  END
  IF ReturnValue = Level:Benign
    SELF.Report $ ?ReportTimeStamp:2{PROP:Text} = FORMAT(CLOCK(),@T7)
  END
  RETURN ReturnValue


ThisReport.TakeRecord PROCEDURE

ReturnValue          BYTE,AUTO

SkipDetails BYTE
  CODE
  ReturnValue = PARENT.TakeRecord()
  PRINT(RPT:Detail)
  RETURN ReturnValue

