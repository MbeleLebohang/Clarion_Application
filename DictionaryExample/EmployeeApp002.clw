

   MEMBER('EmployeeApp.clw')                               ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABREPORT.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('EMPLOYEEAPP002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('EMPLOYEEAPP004.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Browse the Salary file
!!! </summary>
BrowseSalary PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Salary)
                       PROJECT(Sal:Guid)
                       PROJECT(Sal:EmployeeGuid)
                       PROJECT(Sal:Salary_Type)
                       PROJECT(Sal:Salary)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Sal:Guid               LIKE(Sal:Guid)                 !List box control field - type derived from field
Sal:EmployeeGuid       LIKE(Sal:EmployeeGuid)         !List box control field - type derived from field
Sal:Salary_Type        LIKE(Sal:Salary_Type)          !List box control field - type derived from field
Sal:Salary             LIKE(Sal:Salary)               !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Salary file'),AT(,,300,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowseSalary'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,284,124),USE(?Browse:1),HVSCROLL,FORMAT('68L(2)|M~Guid~L(2)@s16@68L(2)|M~G' & |
  'uid~L(2)@s16@80L(2)|M~Salary Type~L(2)@s20@76D(32)|M~Salary~C(0)@n-17.2@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Salary file')
                       BUTTON('&View'),AT(80,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(134,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(188,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(242,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,292,172),USE(?CurrentTab)
                         TAB('&1) EmployeeGuidKey'),USE(?Tab:2)
                         END
                         TAB('&2) GuidKey'),USE(?Tab:3)
                         END
                       END
                       BUTTON('&Close'),AT(192,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(246,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
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
  GlobalErrors.SetProcedureName('BrowseSalary')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Browse:1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Sal:Guid for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Sal:GuidKey)     ! Add the sort order for Sal:GuidKey for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Sal:Guid,1,BRW1)               ! Initialize the browse locator using  using key: Sal:GuidKey , Sal:Guid
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Sal:EmployeeGuid for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Sal:EmployeeGuidKey) ! Add the sort order for Sal:EmployeeGuidKey for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,Sal:EmployeeGuid,1,BRW1)       ! Initialize the browse locator using  using key: Sal:EmployeeGuidKey , Sal:EmployeeGuid
  BRW1.AddField(Sal:Guid,BRW1.Q.Sal:Guid)                  ! Field Sal:Guid is a hot field or requires assignment from browse
  BRW1.AddField(Sal:EmployeeGuid,BRW1.Q.Sal:EmployeeGuid)  ! Field Sal:EmployeeGuid is a hot field or requires assignment from browse
  BRW1.AddField(Sal:Salary_Type,BRW1.Q.Sal:Salary_Type)    ! Field Sal:Salary_Type is a hot field or requires assignment from browse
  BRW1.AddField(Sal:Salary,BRW1.Q.Sal:Salary)              ! Field Sal:Salary is a hot field or requires assignment from browse
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
!!! Print the Salary File by Sal:EmployeeGuidKey
!!! </summary>
ReportSalaryBySal:EmployeeGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Salary)
                       PROJECT(Sal:EmployeeGuid)
                       PROJECT(Sal:Guid)
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
                         LINE,AT(2000,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Salary Type'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Salary'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,250),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Sal:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Sal:EmployeeGuid)
                         STRING(@s20),AT(4050,50,1900,170),USE(Sal:Salary_Type)
                         STRING(@n-17.2),AT(6050,50,1900,170),USE(Sal:Salary),DECIMAL(12)
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
  GlobalErrors.SetProcedureName('ReportSalaryBySal:EmployeeGuidKey')
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
  INIMgr.Fetch('ReportSalaryBySal:EmployeeGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Salary, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Sal:EmployeeGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Sal:EmployeeGuidKey)
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
    INIMgr.Update('ReportSalaryBySal:EmployeeGuidKey',ProgressWindow) ! Save window data to non-volatile store
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
!!! Print the Salary File by Sal:GuidKey
!!! </summary>
ReportSalaryBySal:GuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Salary)
                       PROJECT(Sal:EmployeeGuid)
                       PROJECT(Sal:Guid)
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
                         LINE,AT(2000,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Salary Type'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Salary'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,250),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Sal:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Sal:EmployeeGuid)
                         STRING(@s20),AT(4050,50,1900,170),USE(Sal:Salary_Type)
                         STRING(@n-17.2),AT(6050,50,1900,170),USE(Sal:Salary),DECIMAL(12)
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
  GlobalErrors.SetProcedureName('ReportSalaryBySal:GuidKey')
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
  INIMgr.Fetch('ReportSalaryBySal:GuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Salary, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Sal:Guid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Sal:GuidKey)
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
    INIMgr.Update('ReportSalaryBySal:GuidKey',ProgressWindow) ! Save window data to non-volatile store
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
!!! Browse the Benefits file
!!! </summary>
BrowseBenefits PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Benefits)
                       PROJECT(Ben:Guid)
                       PROJECT(Ben:EmployeeGuid)
                       PROJECT(Ben:Benefit_Type)
                       PROJECT(Ben:Description)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Ben:Guid               LIKE(Ben:Guid)                 !List box control field - type derived from field
Ben:EmployeeGuid       LIKE(Ben:EmployeeGuid)         !List box control field - type derived from field
Ben:Benefit_Type       LIKE(Ben:Benefit_Type)         !List box control field - type derived from field
Ben:Description        LIKE(Ben:Description)          !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Benefits file'),AT(,,304,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowseBenefits'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,288,124),USE(?Browse:1),HVSCROLL,FORMAT('68L(2)|M~Guid~L(2)@s16@68L(2)|M~G' & |
  'uid~L(2)@s16@80L(2)|M~Benefit Type~L(2)@s20@80L(2)|M~Description~L(2)@s255@'),FROM(Queue:Browse:1), |
  IMM,MSG('Browsing the Benefits file')
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
                     END

Toolbar              ToolbarClass
BRW1                 CLASS(BrowseClass)                    ! Browse using ?Browse:1
Q                      &Queue:Browse:1                !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetSort              PROCEDURE(BYTE Force),BYTE,PROC,DERIVED
                     END

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort1:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 2
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(Benefits:Record)
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
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
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Ben:Guid for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Ben:GuidKey)     ! Add the sort order for Ben:GuidKey for sort order 1
  BRW1.AddLocator(BRW1::Sort1:Locator)                     ! Browse has a locator for sort order 1
  BRW1::Sort1:Locator.Init(,Ben:Guid,1,BRW1)               ! Initialize the browse locator using  using key: Ben:GuidKey , Ben:Guid
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Ben:EmployeeGuid for sort order 2
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Ben:EmployeeGuidKey) ! Add the sort order for Ben:EmployeeGuidKey for sort order 2
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort0:Locator.Init(,Ben:EmployeeGuid,1,BRW1)       ! Initialize the browse locator using  using key: Ben:EmployeeGuidKey , Ben:EmployeeGuid
  BRW1.AddField(Ben:Guid,BRW1.Q.Ben:Guid)                  ! Field Ben:Guid is a hot field or requires assignment from browse
  BRW1.AddField(Ben:EmployeeGuid,BRW1.Q.Ben:EmployeeGuid)  ! Field Ben:EmployeeGuid is a hot field or requires assignment from browse
  BRW1.AddField(Ben:Benefit_Type,BRW1.Q.Ben:Benefit_Type)  ! Field Ben:Benefit_Type is a hot field or requires assignment from browse
  BRW1.AddField(Ben:Description,BRW1.Q.Ben:Description)    ! Field Ben:Description is a hot field or requires assignment from browse
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
!!! Print the Benefits File by Ben:EmployeeGuidKey
!!! </summary>
ReportBenefitsByBen:EmployeeGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Benefits)
                       PROJECT(Ben:Benefit_Type)
                       PROJECT(Ben:Description)
                       PROJECT(Ben:EmployeeGuid)
                       PROJECT(Ben:Guid)
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
                         LINE,AT(2000,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Benefit Type'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Description'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,250),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Ben:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Ben:EmployeeGuid)
                         STRING(@s20),AT(4050,50,1900,170),USE(Ben:Benefit_Type)
                         STRING(@s255),AT(6050,50,1900,170),USE(Ben:Description)
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
? DEBUGHOOK(Benefits:Record)
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
  GlobalErrors.SetProcedureName('ReportBenefitsByBen:EmployeeGuidKey')
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
  INIMgr.Fetch('ReportBenefitsByBen:EmployeeGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Benefits, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ben:EmployeeGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Ben:EmployeeGuidKey)
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
    INIMgr.Update('ReportBenefitsByBen:EmployeeGuidKey',ProgressWindow) ! Save window data to non-volatile store
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
!!! Print the Benefits File by Ben:GuidKey
!!! </summary>
ReportBenefitsByBen:GuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Benefits)
                       PROJECT(Ben:Benefit_Type)
                       PROJECT(Ben:Description)
                       PROJECT(Ben:EmployeeGuid)
                       PROJECT(Ben:Guid)
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
                         LINE,AT(2000,350,0,250),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,250),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,250),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Benefit Type'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Description'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,250),USE(?Detail)
                         LINE,AT(0,0,0,250),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,250),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,250),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,250),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,250),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Ben:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Ben:EmployeeGuid)
                         STRING(@s20),AT(4050,50,1900,170),USE(Ben:Benefit_Type)
                         STRING(@s255),AT(6050,50,1900,170),USE(Ben:Description)
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
? DEBUGHOOK(Benefits:Record)
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
  GlobalErrors.SetProcedureName('ReportBenefitsByBen:GuidKey')
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
  INIMgr.Fetch('ReportBenefitsByBen:GuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Benefits, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Ben:Guid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Ben:GuidKey)
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
    INIMgr.Update('ReportBenefitsByBen:GuidKey',ProgressWindow) ! Save window data to non-volatile store
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
!!! Browse the Qualification file
!!! </summary>
BrowseQualification PROCEDURE 

CurrentTab           STRING(80)                            ! 
BRW1::View:Browse    VIEW(Qualification)
                       PROJECT(Qua:Guid)
                       PROJECT(Qua:EmployeeGuid)
                       PROJECT(Qua:SchoolGuid)
                       PROJECT(Qua:Major)
                       PROJECT(Qua:Year)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?Browse:1
Qua:Guid               LIKE(Qua:Guid)                 !List box control field - type derived from field
Qua:EmployeeGuid       LIKE(Qua:EmployeeGuid)         !List box control field - type derived from field
Qua:SchoolGuid         LIKE(Qua:SchoolGuid)           !List box control field - type derived from field
Qua:Major              LIKE(Qua:Major)                !List box control field - type derived from field
Qua:Year               LIKE(Qua:Year)                 !List box control field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
QuickWindow          WINDOW('Browse the Qualification file'),AT(,,312,198),FONT('Segoe UI',10,COLOR:Black,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,TILED,CENTER,GRAY,IMM,MDI,HLP('BrowseQualification'),SYSTEM,WALLPAPER('C:\Users\u' & |
  'ser\Downloads\bg.png')
                       LIST,AT(8,30,296,124),USE(?Browse:1),HVSCROLL,FORMAT('68L(2)|M~Guid~@s16@68L(2)|M~Emplo' & |
  'yee Guid~@s16@68L(2)|M~School Guid~@s16@80L(2)|M~Major~@s100@20L(2)|M~Year Obtained~@s4@'), |
  FROM(Queue:Browse:1),IMM,MSG('Browsing the Qualification file')
                       BUTTON('&View'),AT(92,158,50,14),USE(?View:2),LEFT,ICON('WAVIEW.ICO'),FLAT,MSG('View Record'), |
  TIP('View Record')
                       BUTTON('&Insert'),AT(146,158,50,14),USE(?Insert:3),LEFT,ICON('WAINSERT.ICO'),FLAT,MSG('Insert a Record'), |
  TIP('Insert a Record')
                       BUTTON('&Change'),AT(200,158,50,14),USE(?Change:3),LEFT,ICON('WACHANGE.ICO'),DEFAULT,FLAT, |
  MSG('Change the Record'),TIP('Change the Record')
                       BUTTON('&Delete'),AT(254,158,50,14),USE(?Delete:3),LEFT,ICON('WADELETE.ICO'),FLAT,MSG('Delete the Record'), |
  TIP('Delete the Record')
                       SHEET,AT(4,4,304,172),USE(?CurrentTab)
                         TAB('&1) EmployeeGuidKey'),USE(?Tab:2)
                         END
                         TAB('&2) SchoolGuidKey'),USE(?Tab:3)
                           BUTTON('Select Schools'),AT(8,158,120,14),USE(?SelectSchools),LEFT,ICON('WAPARENT.ICO'),FLAT, |
  MSG('Select Parent Field'),TIP('Select Parent Field')
                         END
                         TAB('&3) GuidKey'),USE(?Tab:4)
                         END
                       END
                       BUTTON('&Close'),AT(204,180,50,14),USE(?Close),LEFT,ICON('WACLOSE.ICO'),FLAT,MSG('Close Window'), |
  TIP('Close Window')
                       BUTTON('&Help'),AT(258,180,50,14),USE(?Help),LEFT,ICON('WAHELP.ICO'),FLAT,MSG('See Help Window'), |
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

BRW1::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW1::Sort2:Locator  StepLocatorClass                      ! Conditional Locator - CHOICE(?CurrentTab) = 3
BRW1::Sort0:StepClass StepStringClass                      ! Default Step Manager
BRW1::Sort1:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 2
BRW1::Sort2:StepClass StepStringClass                      ! Conditional Step Manager - CHOICE(?CurrentTab) = 3
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END


  CODE
? DEBUGHOOK(Qualification:Record)
? DEBUGHOOK(Schools:Record)
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
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Close,RequestCancelled)                 ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Close,RequestCompleted)                 ! Add the close control to the window manger
  END
  Relate:Qualification.Open                                ! File Qualification used by this procedure, so make sure it's RelationManager is open
  Relate:Schools.Open                                      ! File Schools used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  BRW1.Init(?Browse:1,Queue:Browse:1.ViewPosition,BRW1::View:Browse,Queue:Browse:1,Relate:Qualification,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  Do DefineListboxStyle
  BRW1.Q &= Queue:Browse:1
  BRW1::Sort1:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Qua:SchoolGuid for sort order 1
  BRW1.AddSortOrder(BRW1::Sort1:StepClass,Qua:SchoolGuidKey) ! Add the sort order for Qua:SchoolGuidKey for sort order 1
  BRW1.AddRange(Qua:SchoolGuid,Relate:Qualification,Relate:Schools) ! Add file relationship range limit for sort order 1
  BRW1::Sort2:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Qua:Guid for sort order 2
  BRW1.AddSortOrder(BRW1::Sort2:StepClass,Qua:GuidKey)     ! Add the sort order for Qua:GuidKey for sort order 2
  BRW1.AddLocator(BRW1::Sort2:Locator)                     ! Browse has a locator for sort order 2
  BRW1::Sort2:Locator.Init(,Qua:Guid,1,BRW1)               ! Initialize the browse locator using  using key: Qua:GuidKey , Qua:Guid
  BRW1::Sort0:StepClass.Init(+ScrollSort:AllowAlpha,ScrollBy:Runtime) ! Moveable thumb based upon Qua:EmployeeGuid for sort order 3
  BRW1.AddSortOrder(BRW1::Sort0:StepClass,Qua:EmployeeGuidKey) ! Add the sort order for Qua:EmployeeGuidKey for sort order 3
  BRW1.AddLocator(BRW1::Sort0:Locator)                     ! Browse has a locator for sort order 3
  BRW1::Sort0:Locator.Init(,Qua:EmployeeGuid,1,BRW1)       ! Initialize the browse locator using  using key: Qua:EmployeeGuidKey , Qua:EmployeeGuid
  BRW1.AddField(Qua:Guid,BRW1.Q.Qua:Guid)                  ! Field Qua:Guid is a hot field or requires assignment from browse
  BRW1.AddField(Qua:EmployeeGuid,BRW1.Q.Qua:EmployeeGuid)  ! Field Qua:EmployeeGuid is a hot field or requires assignment from browse
  BRW1.AddField(Qua:SchoolGuid,BRW1.Q.Qua:SchoolGuid)      ! Field Qua:SchoolGuid is a hot field or requires assignment from browse
  BRW1.AddField(Qua:Major,BRW1.Q.Qua:Major)                ! Field Qua:Major is a hot field or requires assignment from browse
  BRW1.AddField(Qua:Year,BRW1.Q.Qua:Year)                  ! Field Qua:Year is a hot field or requires assignment from browse
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
    Relate:Schools.Close
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
    OF ?SelectSchools
      ThisWindow.Update()
      GlobalRequest = SelectRecord
      SelectSchools()
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
  ELSIF CHOICE(?CurrentTab) = 3
    RETURN SELF.SetSort(2,Force)
  ELSE
    RETURN SELF.SetSort(3,Force)
  END
  ReturnValue = PARENT.ResetSort(Force)
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

!!! <summary>
!!! Generated from procedure template - Report
!!! Print the Qualification File by Qua:EmployeeGuidKey
!!! </summary>
ReportQualificationByQua:EmployeeGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Qualification)
                       PROJECT(Qua:EmployeeGuid)
                       PROJECT(Qua:Guid)
                       PROJECT(Qua:Major)
                       PROJECT(Qua:SchoolGuid)
                       PROJECT(Qua:Year)
                     END
ProgressWindow       WINDOW('Report Qualification'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Qualification Report'),AT(250,1020,8000,9480),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,770),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Qualification file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,430),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,430),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,430),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,430),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Guid'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Name'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Year'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,500),USE(?Detail)
                         LINE,AT(0,0,0,500),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,500),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,500),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,500),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,500),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Qua:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Qua:EmployeeGuid)
                         STRING(@s16),AT(4050,50,1900,170),USE(Qua:SchoolGuid)
                         STRING(@s100),AT(6050,50,1900,170),USE(Qua:Major)
                         STRING(@s4),AT(50,230,1900,170),USE(Qua:Year)
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

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Qualification:Record)
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
  GlobalErrors.SetProcedureName('ReportQualificationByQua:EmployeeGuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Qualification.Open                                ! File Qualification used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportQualificationByQua:EmployeeGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Qualification, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Qua:EmployeeGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Qua:EmployeeGuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Qualification.SetQuickScan(1,Propagate:OneMany)
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
    Relate:Qualification.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportQualificationByQua:EmployeeGuidKey',ProgressWindow) ! Save window data to non-volatile store
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
!!! Print the Qualification File by Qua:SchoolGuidKey
!!! </summary>
ReportQualificationByQua:SchoolGuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Qualification)
                       PROJECT(Qua:EmployeeGuid)
                       PROJECT(Qua:Guid)
                       PROJECT(Qua:Major)
                       PROJECT(Qua:SchoolGuid)
                       PROJECT(Qua:Year)
                     END
ProgressWindow       WINDOW('Report Qualification'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Qualification Report'),AT(250,1020,8000,9480),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,770),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Qualification file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,430),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,430),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,430),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,430),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Guid'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Name'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Year'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,500),USE(?Detail)
                         LINE,AT(0,0,0,500),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,500),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,500),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,500),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,500),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Qua:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Qua:EmployeeGuid)
                         STRING(@s16),AT(4050,50,1900,170),USE(Qua:SchoolGuid)
                         STRING(@s100),AT(6050,50,1900,170),USE(Qua:Major)
                         STRING(@s4),AT(50,230,1900,170),USE(Qua:Year)
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

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Qualification:Record)
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
  GlobalErrors.SetProcedureName('ReportQualificationByQua:SchoolGuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Qualification.Open                                ! File Qualification used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportQualificationByQua:SchoolGuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Qualification, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Qua:SchoolGuid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Qua:SchoolGuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Qualification.SetQuickScan(1,Propagate:OneMany)
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
    Relate:Qualification.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportQualificationByQua:SchoolGuidKey',ProgressWindow) ! Save window data to non-volatile store
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
!!! Print the Qualification File by Qua:GuidKey
!!! </summary>
ReportQualificationByQua:GuidKey PROCEDURE 

Progress:Thermometer BYTE                                  ! 
Process:View         VIEW(Qualification)
                       PROJECT(Qua:EmployeeGuid)
                       PROJECT(Qua:Guid)
                       PROJECT(Qua:Major)
                       PROJECT(Qua:SchoolGuid)
                       PROJECT(Qua:Year)
                     END
ProgressWindow       WINDOW('Report Qualification'),AT(,,142,59),FONT('Segoe UI',10,COLOR:Black,FONT:regular,CHARSET:DEFAULT), |
  DOUBLE,TILED,CENTER,GRAY,TIMER(1),WALLPAPER('C:\Users\user\Downloads\bg.png')
                       PROGRESS,AT(15,15,111,12),USE(Progress:Thermometer),RANGE(0,100)
                       STRING(''),AT(0,3,141,10),USE(?Progress:UserString),CENTER
                       STRING(''),AT(0,30,141,10),USE(?Progress:PctText),CENTER
                       BUTTON('Cancel'),AT(46,42,49,15),USE(?Progress:Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel Report'), |
  TIP('Cancel Report')
                     END

Report               REPORT('Qualification Report'),AT(250,1020,8000,9480),PRE(RPT),PAPER(PAPER:LETTER),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),THOUS
                       HEADER,AT(250,250,8000,770),USE(?Header),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT)
                         STRING('Report Qualification file'),AT(0,20,8000,220),USE(?ReportTitle),FONT('Microsoft ' & |
  'Sans Serif',8,,FONT:regular,CHARSET:DEFAULT),CENTER
                         BOX,AT(0,350,8000,430),USE(?HeaderBox),COLOR(COLOR:Black)
                         LINE,AT(2000,350,0,430),USE(?HeaderLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,350,0,430),USE(?HeaderLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,350,0,430),USE(?HeaderLine:3),COLOR(COLOR:Black)
                         STRING('Guid'),AT(50,390,1900,170),USE(?HeaderTitle:1),TRN
                         STRING('Guid'),AT(2050,390,1900,170),USE(?HeaderTitle:2),TRN
                         STRING('Guid'),AT(4050,390,1900,170),USE(?HeaderTitle:3),TRN
                         STRING('Name'),AT(6050,390,1900,170),USE(?HeaderTitle:4),TRN
                         STRING('Year'),AT(50,570,1900,170),USE(?HeaderTitle:5),TRN
                       END
Detail                 DETAIL,AT(0,0,8000,500),USE(?Detail)
                         LINE,AT(0,0,0,500),USE(?DetailLine:0),COLOR(COLOR:Black)
                         LINE,AT(2000,0,0,500),USE(?DetailLine:1),COLOR(COLOR:Black)
                         LINE,AT(4000,0,0,500),USE(?DetailLine:2),COLOR(COLOR:Black)
                         LINE,AT(6000,0,0,500),USE(?DetailLine:3),COLOR(COLOR:Black)
                         LINE,AT(8000,0,0,500),USE(?DetailLine:4),COLOR(COLOR:Black)
                         STRING(@s16),AT(50,50,1900,170),USE(Qua:Guid)
                         STRING(@s16),AT(2050,50,1900,170),USE(Qua:EmployeeGuid)
                         STRING(@s16),AT(4050,50,1900,170),USE(Qua:SchoolGuid)
                         STRING(@s100),AT(6050,50,1900,170),USE(Qua:Major)
                         STRING(@s4),AT(50,230,1900,170),USE(Qua:Year)
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

ProgressMgr          StepStringClass                       ! Progress Manager
Previewer            PrintPreviewClass                     ! Print Previewer

  CODE
? DEBUGHOOK(Qualification:Record)
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
  GlobalErrors.SetProcedureName('ReportQualificationByQua:GuidKey')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Progress:Thermometer
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Qualification.Open                                ! File Qualification used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(ProgressWindow)                                ! Open window
  Do DefineListboxStyle
  INIMgr.Fetch('ReportQualificationByQua:GuidKey',ProgressWindow) ! Restore window settings from non-volatile store
  ProgressMgr.Init(ScrollSort:AllowAlpha+ScrollSort:AllowNumeric,ScrollBy:RunTime)
  ThisReport.Init(Process:View, Relate:Qualification, ?Progress:PctText, Progress:Thermometer, ProgressMgr, Qua:Guid)
  ThisReport.CaseSensitiveValue = FALSE
  ThisReport.AddSortOrder(Qua:GuidKey)
  SELF.AddItem(?Progress:Cancel,RequestCancelled)
  SELF.Init(ThisReport,Report,Previewer)
  ?Progress:UserString{PROP:Text} = ''
  Relate:Qualification.SetQuickScan(1,Propagate:OneMany)
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
    Relate:Qualification.Close
  END
  IF SELF.Opened
    INIMgr.Update('ReportQualificationByQua:GuidKey',ProgressWindow) ! Save window data to non-volatile store
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
!!! Generated from procedure template - Source
!!! </summary>
ExportFile           PROCEDURE  (FILE pTableFile)          ! Declare Procedure
xml XMLGenerator

  CODE
  xml.Generate(pTableFile, 'TestFile.xml')
