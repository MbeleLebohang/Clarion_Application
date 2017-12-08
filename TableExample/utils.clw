

  MEMBER('TableExample.clw')

OMIT('***')
 * Created with Clarion 10.0
 * User: Mbele Lebohang
 * Date: 12/6/2017
 * Time: 11:08 AM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***
  !----------------------------------------------------------------------------------------
  ! Includes
  !----------------------------------------------------------------------------------------
  include('stringtheory.inc')
  include('errors.clw')
  
  !----------------------------------------------------------------------------------------
  ! Global Variables
  !----------------------------------------------------------------------------------------
str StringTheory

EMPLOYEES FILE, DRIVER('TOPSPEED'),PRE(EMPLOYEES), CREATE
GuidKey       Key(EMPLOYEES:Guid)
EmployeeKey   Key(EMPLOYEES:Full_Names,EMPLOYEES:Title)
 
record  RECORD
Guid          String(16)
Title         String(20)
Full_Names    String(100)
Job_Title     String(100)
Date          Long    
    End
  END
  
  MAP
  END

  !----------------------------------------------------------------------------------------
  ! Add and employee int an EMPLOYEE TABLE
  !----------------------------------------------------------------------------------------
addEmployee  PROCEDURE(String pEmployee, string pTitle)
e           string(255)
FileOpened  Long
  CODE
  if(Status(EMPLOYEES) = 0)
    open(EMPLOYEES, 42h)
    FileOpened = TRUE
  End
  
  CASE errorcode()
  of NoError
    
  of NoFileErr
      CREATE(EMPLOYEES)
      
      if errorcode()
        e = error()
        message('Error creating Table: '& name(EMPLOYEES) & ' error= ' & errorcode() &' '& error())
        return e
      End
      
      OPEN(EMPLOYEES, 42h)
      if errorcode()
        e = error()
        message('Error opening Table: '& name(EMPLOYEES) & ' error= ' & errorcode() &' '& error())
        return e
      End
  of IsOpenErr
    ! do nothing
  Else
    message('Error opening Table: '& name(EMPLOYEES) & ' error= ' & errorcode() &' '& error())
    return error()
  End
  
  clear(EMPLOYEES)
    EMPLOYEES:Guid      = str.MakeGuid()
    EMPLOYEES:Full_Names  = pEmployee
    EMPLOYEES:Job_Title = pTitle
    EMPLOYEES:Date      = today() 
    
    add(EMPLOYEES)
    
    if errorcode()
      e = error()
      message('Error opening Table: '& name(EMPLOYEES) & ' error= ' & errorcode() &' '& error())
      return e
    End
    
    if fileOpened
      close(EMPLOYEES)
    End
  return e  

  


