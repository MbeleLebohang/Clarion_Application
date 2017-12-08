

   MEMBER('EmployeesApp.clw')                              ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('EMPLOYEESAPP001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('EMPLOYEESAPP002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('EMPLOYEESAPP003.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! Wizard Application for C:\Users\user\Documents\Clarion Projects\Clarion_Application\DictionaryExample\Employees.dct
!!! </summary>
Main PROCEDURE 

AppFrame             APPLICATION('Application'),AT(,,505,318),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,TILED,CENTER,ICON('WAFRAME.ICO'),MAX,STATUS(-1,80,120,45),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png'),IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&File'),USE(?FileMenu)
                           ITEM('&Print Setup ...'),USE(?PrintSetup),MSG('Setup printer'),STD(STD:PrintSetup)
                           ITEM,SEPARATOR
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
                           ITEM('Browse the Qualification file'),USE(?BrowseQualification),MSG('Browse Qualification')
                           ITEM('Browse the Schools file'),USE(?BrowseSchools),MSG('Browse Schools')
                           ITEM('Browse the LinkBenefitsEmployee file'),USE(?BrowseLinkBenefitsEmployee),MSG('Browse Lin' & |
  'kBenefitsEmployee')
                           ITEM('Browse the LinkEmployeeQualification file'),USE(?BrowseLinkEmployeeQualification),MSG('Browse Lin' & |
  'kEmployeeQualification')
                         END
                         MENU('&Reports'),USE(?ReportMenu),MSG('Report data')
                           ITEM('Print the Employees file'),USE(?ReportEmployees),MSG('Print in record order')
                           ITEM('Print the Phones file'),USE(?ReportPhones),MSG('Print in record order')
                           ITEM('Print the Salary file'),USE(?ReportSalary),MSG('Print in record order')
                           ITEM('Print the Benefits file'),USE(?ReportBenefits),MSG('Print in record order')
                           ITEM('Print the Qualification file'),USE(?ReportQualification),MSG('Print in record order')
                           ITEM('Print the Schools file'),USE(?ReportSchools),MSG('Print in record order')
                           MENU('Report the LinkBenefitsEmployee file'),USE(?ReportLinkBenefitsEmployee)
                             ITEM('Print by Lin:GuidKey key'),USE(?ReportLinkBenefitsEmployeeByLin:GuidKey),MSG('Print orde' & |
  'red by the Lin:GuidKey key')
                             ITEM('Print by Lin:BenefitsGuidKey key'),USE(?ReportLinkBenefitsEmployeeByLin:BenefitsGuidKey), |
  MSG('Print ordered by the Lin:BenefitsGuidKey key')
                             ITEM('Print by Lin:EmployeeGuidKey key'),USE(?ReportLinkBenefitsEmployeeByLin:EmployeeGuidKey), |
  MSG('Print ordered by the Lin:EmployeeGuidKey key')
                           END
                           MENU('Report the LinkEmployeeQualification file'),USE(?ReportLinkEmployeeQualification)
                             ITEM('Print by Lin2:GuidKey key'),USE(?ReportLinkEmployeeQualificationByLin2:GuidKey),MSG('Print orde' & |
  'red by the Lin2:GuidKey key')
                             ITEM('Print by Lin2:EmployeeGuidKey key'),USE(?ReportLinkEmployeeQualificationByLin2:EmployeeGuidKey), |
  MSG('Print ordered by the Lin2:EmployeeGuidKey key')
                             ITEM('Print by Lin2:QualificationGuidKey key'),USE(?ReportLinkEmployeeQualificationByLin2:QualificationGuidKey), |
  MSG('Print ordered by the Lin2:QualificationGuidKey key')
                           END
                         END
                         MENU('&Window'),USE(?WindowMenu),STD(STD:WindowList)
                           ITEM('T&ile'),USE(?Tile),MSG('Arrange multiple opened windows'),STD(STD:TileWindow)
                           ITEM('&Cascade'),USE(?Cascade),MSG('Arrange multiple opened windows'),STD(STD:CascadeWindow)
                           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Arrange the icons for minimized windows'),STD(STD:ArrangeIcons)
                         END
                         MENU('&Help'),USE(?HelpMenu)
                           ITEM('&Contents'),USE(?Helpindex),MSG('View the contents of the help file'),STD(STD:HelpIndex)
                           ITEM('&Search for Help On...'),USE(?HelpSearch),MSG('Search for help on a subject'),STD(STD:HelpSearch)
                           ITEM('&How to Use Help'),USE(?HelpOnHelp),MSG('Provides general instructions on using help'), |
  STD(STD:HelpOnHelp)
                         END
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
  CASE ACCEPTED()
  OF ?ReportEmployees
    START(ReportEmployees, 050000)
  OF ?ReportPhones
    START(ReportPhones, 050000)
  OF ?ReportSalary
    START(ReportSalary, 050000)
  OF ?ReportBenefits
    START(ReportBenefits, 050000)
  OF ?ReportQualification
    START(ReportQualification, 050000)
  OF ?ReportSchools
    START(ReportSchools, 050000)
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
                       PROJECT(Emp:Full_Names)
                       PROJECT(Emp:Job_Title)
                       PROJECT(Emp:Address)
                       PROJECT(Emp:PhoneGuid)
                       PROJECT(Emp:Employment_Date)
                       PROJECT(Emp:QualificationGuid)
                       PROJECT(Emp:SalaryGuid)
                       PROJECT(Emp:Guid)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Emp:Full_Names         LIKE(Emp:Full_Names)           !List box control field - type derived from field
Emp:Job_Title          LIKE(Emp:Job_Title)            !List box control field - type derived from field
Emp:Address            LIKE(Emp:Address)              !List box control field - type derived from field
Emp:PhoneGuid          LIKE(Emp:PhoneGuid)            !List box control field - type derived from field
Emp:Employment_Date    LIKE(Emp:Employment_Date)      !List box control field - type derived from field
Emp:QualificationGuid  LIKE(Emp:QualificationGuid)    !List box control field - type derived from field
Emp:SalaryGuid         LIKE(Emp:SalaryGuid)           !List box control field - type derived from field
Emp:Guid               LIKE(Emp:Guid)                 !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Employees file'),AT(,,358,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowseEmployees'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,342,124),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M~Name~L(2)@s100@80L(2)|M~' & |
  'Job Title~L(2)@s20@80L(2)|M~Address~L(2)@s255@80L(2)|M~Phone Guid~L(2)@s20@64R(2)|M~' & |
  'Date~C(0)@n-14@68L(2)|M~Guid~L(2)@s16@68L(2)|M~Guid~L(2)@s16@'),FROM(Queue:Browse:1),IMM, |
  MSG('Browsing the Employees file')
                       BUTTON('&View'),AT(138,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(192,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(246,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(300,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,350,172),USE(?CurrentTab)
                         TAB('&1) Record Order'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(250,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(304,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
                     END

BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
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
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Employees,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddField(Emp:Full_Names,BRW1.Q.Emp:Full_Names)      ! Field Emp:Full_Names is a hot field or requires assignment from browse
  BRW1.AddField(Emp:Job_Title,BRW1.Q.Emp:Job_Title)        ! Field Emp:Job_Title is a hot field or requires assignment from browse
  BRW1.AddField(Emp:Address,BRW1.Q.Emp:Address)            ! Field Emp:Address is a hot field or requires assignment from browse
  BRW1.AddField(Emp:PhoneGuid,BRW1.Q.Emp:PhoneGuid)        ! Field Emp:PhoneGuid is a hot field or requires assignment from browse
  BRW1.AddField(Emp:Employment_Date,BRW1.Q.Emp:Employment_Date) ! Field Emp:Employment_Date is a hot field or requires assignment from browse
  BRW1.AddField(Emp:QualificationGuid,BRW1.Q.Emp:QualificationGuid) ! Field Emp:QualificationGuid is a hot field or requires assignment from browse
  BRW1.AddField(Emp:SalaryGuid,BRW1.Q.Emp:SalaryGuid)      ! Field Emp:SalaryGuid is a hot field or requires assignment from browse
  BRW1.AddField(Emp:Guid,BRW1.Q.Emp:Guid)                  ! Field Emp:Guid is a hot field or requires assignment from browse
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Employees File
!!! </summary>
ReportEmployees PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Employees)
                       PROJECT(Emp:Address)
                       PROJECT(Emp:Employment_Date)
                       PROJECT(Emp:Full_Names)
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

Report               REPORT('Employees Report'),AT(250,1020,8000,9480),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,770),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Employees file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,430),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,430),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,430),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,430),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Name'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Job Title'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Address'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Phone Guid'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Date'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                         STRING('Guid'),AT(2050,570,1900,170),USE(?HeaderTitle:6),TRN
                         STRING('Guid'),AT(4050,570,1900,170),USE(?HeaderTitle:7),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,500),USE(?Detail)
                         LINE,AT(0,0,0,500),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,500),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,500),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,500),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,500),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s100),AT(50,50,1900,170),USE(Emp:Full_Names)
                         STRING(@s20),AT(2050,50,1900,170),USE(Emp:Job_Title)
                         STRING(@s255),AT(4050,50,1900,170),USE(Emp:Address)
                         STRING(@s20),AT(6050,50,1900,170),USE(Emp:PhoneGuid)
                         STRING(@n-14),AT(50,230,1900,170),USE(Emp:Employment_Date),RIGHT(1)
                         STRING(@s16),AT(2050,230,1900,170),USE(Emp:QualificationGuid)
                         STRING(@s16),AT(4050,230,1900,170),USE(Emp:SalaryGuid)
                         LINE,AT(0,500,8000,0),USE(?DetailEndLine),COLOR(COLOR:Black)
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

Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
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
  GlobalErrors.SetProcedureName('ReportEmployees')
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
  INIMgr.Fetch('ReportEmployees',ProgressWindow)           ! Restore window settings from non-volatile store
  ThisReport.Init(Process:View, Relate:Employees, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
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
    INIMgr.Update('ReportEmployees',ProgressWindow)        ! Save window data to non-volatile store
  END
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
                       PROJECT(Pho:Phone_Type)
                       PROJECT(Pho:Phone_Number)
                       PROJECT(Pho:Guid)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Pho:Phone_Type         LIKE(Pho:Phone_Type)           !List box control field - type derived from field
Pho:Phone_Number       LIKE(Pho:Phone_Number)         !List box control field - type derived from field
Pho:Guid               LIKE(Pho:Guid)                 !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Phones file'),AT(,,228,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowsePhones'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,212,124),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M~Phone Type~L(2)@s20@80L(' & |
  '2)|M~Phone Number~L(2)@s20@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Phones file')
                       BUTTON('&View'),AT(8,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(62,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(116,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(170,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,220,172),USE(?CurrentTab)
                         TAB('&1) Record Order'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(120,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(174,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
                     END

BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
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
  Relate:Phones.Open                                       ! File Phones used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Phones,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddField(Pho:Phone_Type,BRW1.Q.Pho:Phone_Type)      ! Field Pho:Phone_Type is a hot field or requires assignment from browse
  BRW1.AddField(Pho:Phone_Number,BRW1.Q.Pho:Phone_Number)  ! Field Pho:Phone_Number is a hot field or requires assignment from browse
  BRW1.AddField(Pho:Guid,BRW1.Q.Pho:Guid)                  ! Field Pho:Guid is a hot field or requires assignment from browse
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


BRW1.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert:3
    SELF.ChangeControl=?Change:3
    SELF.DeleteControl=?Delete:3
  END
  SELF.ViewControl = ?View:2                               ! Setup the control used to initiate view only mode


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Phones File
!!! </summary>
ReportPhones PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Phones)
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
                         LINE,AT(4000,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         STRING('Phone Type'),AT(50,390,3900,170),USE(?HeaderTitle:1),TRN
                         STRING('Phone Number'),AT(4050,390,3900,170),USE(?HeaderTitle:2),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         STRING(@s20),AT(50,50,3900,170),USE(Pho:Phone_Type)
                         STRING(@s20),AT(4050,50,3900,170),USE(Pho:Phone_Number)
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

Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
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
  GlobalErrors.SetProcedureName('ReportPhones')
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
  INIMgr.Fetch('ReportPhones',ProgressWindow)              ! Restore window settings from non-volatile store
  ThisReport.Init(Process:View, Relate:Phones, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
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
    INIMgr.Update('ReportPhones',ProgressWindow)           ! Save window data to non-volatile store
  END
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
!!! Browse the Salary file
!!! </summary>
BrowseSalary PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Salary)
                       PROJECT(Sal:Salary_Type)
                       PROJECT(Sal:Salary)
                       PROJECT(Sal:Guid)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Sal:Salary_Type        LIKE(Sal:Salary_Type)          !List box control field - type derived from field
Sal:Salary             LIKE(Sal:Salary)               !List box control field - type derived from field
Sal:Guid               LIKE(Sal:Guid)                 !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Salary file'),AT(,,228,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowseSalary'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,212,124),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M~Salary Type~L(2)@s20@76D' & |
  '(32)|M~Salary~C(0)@n-17.2@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Salary file')
                       BUTTON('&View'),AT(8,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(62,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(116,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(170,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,220,172),USE(?CurrentTab)
                         TAB('&1) Record Order'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(120,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(174,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
                     END

BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
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
  GlobalErrors.SetProcedureName('BrowseSalary')
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
  Relate:Salary.Open                                       ! File Salary used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Salary,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddField(Sal:Salary_Type,BRW1.Q.Sal:Salary_Type)    ! Field Sal:Salary_Type is a hot field or requires assignment from browse
  BRW1.AddField(Sal:Salary,BRW1.Q.Sal:Salary)              ! Field Sal:Salary is a hot field or requires assignment from browse
  BRW1.AddField(Sal:Guid,BRW1.Q.Sal:Guid)                  ! Field Sal:Guid is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseSalary',QuickWindow)                 ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateSalary
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Salary.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseSalary',QuickWindow)              ! Save window data to non-volatile store
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
    UpdateSalary
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Salary File
!!! </summary>
ReportSalary PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Salary)
                       PROJECT(Sal:Salary)
                       PROJECT(Sal:Salary_Type)
                     END
ProgressWindow       WINDOW('Report Salary'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Salary Report'),AT(250,850,8000,9650),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,600),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Salary file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         STRING('Salary Type'),AT(50,390,3900,170),USE(?HeaderTitle:1),TRN
                         STRING('Salary'),AT(4050,390,3900,170),USE(?HeaderTitle:2),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         STRING(@s20),AT(50,50,3900,170),USE(Sal:Salary_Type)
                         STRING(@n-17.2),AT(4050,50,3900,170),USE(Sal:Salary),DECIMAL(12)
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

Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
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
  GlobalErrors.SetProcedureName('ReportSalary')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Salary.Open                                       ! File Salary used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportSalary',ProgressWindow)              ! Restore window settings from non-volatile store
  ThisReport.Init(Process:View, Relate:Salary, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Salary.SetQuickScan(1,Propagate:OneMany)
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
    Relate:Salary.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportSalary',ProgressWindow)           ! Save window data to non-volatile store
  END
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
!!! Browse the Benefits file
!!! </summary>
BrowseBenefits PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Benefits)
                       PROJECT(Ben:EmployeeGuid)
                       PROJECT(Ben:Benefit_Type)
                       PROJECT(Ben:Description)
                       PROJECT(Ben:Guid)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ben:EmployeeGuid       LIKE(Ben:EmployeeGuid)         !List box control field - type derived from field
Ben:Benefit_Type       LIKE(Ben:Benefit_Type)         !List box control field - type derived from field
Ben:Description        LIKE(Ben:Description)          !List box control field - type derived from field
Ben:Guid               LIKE(Ben:Guid)                 !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Benefits file'),AT(,,236,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowseBenefits'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,220,124),USE(?Browse:1),HVSCROLL,FORMAT('68L(2)|M~Guid~L(2)@s16@80L(2)|M~B' & |
  'enefit Type~L(2)@s20@80L(2)|M~Description~L(2)@s255@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
  'he Benefits file')
                       BUTTON('&View'),AT(16,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(70,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(124,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(178,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,228,172),USE(?CurrentTab)
                         TAB('&1) Record Order'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(128,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(182,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
                     END

BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
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
  GlobalErrors.SetProcedureName('BrowseBenefits')
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
  Relate:Benefits.Open                                     ! File Benefits used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Benefits,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddField(Ben:EmployeeGuid,BRW1.Q.Ben:EmployeeGuid)  ! Field Ben:EmployeeGuid is a hot field or requires assignment from browse
  BRW1.AddField(Ben:Benefit_Type,BRW1.Q.Ben:Benefit_Type)  ! Field Ben:Benefit_Type is a hot field or requires assignment from browse
  BRW1.AddField(Ben:Description,BRW1.Q.Ben:Description)    ! Field Ben:Description is a hot field or requires assignment from browse
  BRW1.AddField(Ben:Guid,BRW1.Q.Ben:Guid)                  ! Field Ben:Guid is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseBenefits',QuickWindow)               ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateBenefits
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Benefits.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseBenefits',QuickWindow)            ! Save window data to non-volatile store
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
    UpdateBenefits
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Benefits File
!!! </summary>
ReportBenefits PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Benefits)
                       PROJECT(Ben:Benefit_Type)
                       PROJECT(Ben:Description)
                       PROJECT(Ben:EmployeeGuid)
                     END
ProgressWindow       WINDOW('Report Benefits'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Benefits Report'),AT(250,850,8000,9650),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,600),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Benefits file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft Sans Serif', |
  8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,250),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2666,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(5332,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,2566,170),USE(?HeaderTitle:1),TRN
                         STRING('Benefit Type'),AT(2716,390,2566,170),USE(?HeaderTitle:2),TRN
                         STRING('Description'),AT(5382,390,2566,170),USE(?HeaderTitle:3),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2666,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(5332,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:3),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,2566,170),USE(Ben:EmployeeGuid)
                         STRING(@s20),AT(2716,50,2566,170),USE(Ben:Benefit_Type)
                         STRING(@s255),AT(5382,50,2566,170),USE(Ben:Description)
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

Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
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
  GlobalErrors.SetProcedureName('ReportBenefits')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Benefits.Open                                     ! File Benefits used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportBenefits',ProgressWindow)            ! Restore window settings from non-volatile store
  ThisReport.Init(Process:View, Relate:Benefits, ?Progress:PctText, Progress:Thermometer)
  ThisReport.AddSortOrder()
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Benefits.SetQuickScan(1,Propagate:OneMany)
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
    Relate:Benefits.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportBenefits',ProgressWindow)         ! Save window data to non-volatile store
  END
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
!!! Browse the Qualification file
!!! </summary>
BrowseQualification PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Qualification)
                       PROJECT(Qua:Major)
                       PROJECT(Qua:Year)
                       PROJECT(Qua:Guid)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Qua:Major              LIKE(Qua:Major)                !List box control field - type derived from field
Qua:Year               LIKE(Qua:Year)                 !List box control field - type derived from field
Qua:Guid               LIKE(Qua:Guid)                 !Primary key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Qualification file'),AT(,,228,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowseQualification'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,212,124),USE(?Browse:1),HVSCROLL,FORMAT('80L(2)|M~Name~L(2)@s100@20L(2)|M~' & |
  'Year~L(2)@s4@'),FROM(Queue:Browse:1),IMM,MSG('Browsing the Qualification file')
                       BUTTON('&View'),AT(8,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(62,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(116,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(170,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,220,172),USE(?CurrentTab)
                         TAB('&1) Record Order'),USE(?Tab:2)
                         END
                       END
                       BUTTON('&Close'),AT(120,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(174,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
                     END

BRW1::Sort0:StepClass StepClass                            ! Default Step Manager
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
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
  GlobalErrors.SetProcedureName('BrowseQualification')
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
  Relate:Qualification.Open                                ! File Qualification used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Qualification,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1.AddSortOrder(,)                                     ! Add the sort order for  for sort order 1
  BRW1.AddField(Qua:Major,BRW1.Q.Qua:Major)                ! Field Qua:Major is a hot field or requires assignment from browse
  BRW1.AddField(Qua:Year,BRW1.Q.Qua:Year)                  ! Field Qua:Year is a hot field or requires assignment from browse
  BRW1.AddField(Qua:Guid,BRW1.Q.Qua:Guid)                  ! Field Qua:Guid is a hot field or requires assignment from browse
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  INIMgr.Fetch('BrowseQualification',QuickWindow)          ! Restore window settings from non-volatile store
  Resizer.Resize                                           ! Reset required after window size altered by INI manager
  BRW1.AskProcedure = 1                                    ! Will call: UpdateQualification
  SELF.SetAlerts()
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Qualification.Close
  END
  IF SELF.Opened
    INIMgr.Update('BrowseQualification',QuickWindow)       ! Save window data to non-volatile store
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
    UpdateQualification
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


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

