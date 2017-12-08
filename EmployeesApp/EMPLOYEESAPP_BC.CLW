  MEMBER('EmployeesApp.clw')

  PRAGMA('define(init_priority=>3)')

  MAP
    MODULE('EmployeesApp_BC0.CLW')
EmployeesApp_BC0:DctInit             PROCEDURE()
EmployeesApp_BC0:DctKill             PROCEDURE()
EmployeesApp_BC0:FilesInit           PROCEDURE()
    END
  END

DctInit PROCEDURE()
  CODE
  EmployeesApp_BC0:DctInit
  EmployeesApp_BC0:FilesInit


DctKill PROCEDURE()
  CODE
  EmployeesApp_BC0:DctKill

