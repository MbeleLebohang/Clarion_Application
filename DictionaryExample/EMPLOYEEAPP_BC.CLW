  MEMBER('EmployeeApp.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('EmployeeApp_BC0.CLW')
EmployeeApp_BC0:DctInit             PROCEDURE()
EmployeeApp_BC0:DctKill             PROCEDURE()
EmployeeApp_BC0:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  EmployeeApp_BC0:DctInit
  EmployeeApp_BC0:FilesInit


DctKill PROCEDURE()
  CODE
  EmployeeApp_BC0:DctKill

