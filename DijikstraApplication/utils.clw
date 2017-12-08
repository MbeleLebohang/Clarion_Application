

  MEMBER('DijikstraApplication.clw')
  
  include('errors.clw'), once
  include('stringtheory.inc'), once
  !----------------------------------------------------------------------------------------
  ! Global Variables
  !----------------------------------------------------------------------------------------
str  StringTheory

EMPLOYEES FILE,DRIVER('TOPSPEED'),PRE(EMPLOYEES),CREATE
GuidKey       Key(EMPLOYEES:Guid)
EmployeeKey   Key(EMPLOYEES:Employee, EMPLOYEES:Title)

record    RECORD
Guid        string(16)
Title       string(20)
Employee    string(100)
Job_Title   string(100)
Date        Long
          End
        END
        
  MAP
  END
  !----------------------------------------------------------------------------------------
  ! Evaluate a given expression
  !----------------------------------------------------------------------------------------
DijikstraEvaluator  Procedure(string pExpression)
  CODE
    
  return 10
  
  
  !----------------------------------------------------------------------------------------
  ! Check if a given char is a digit
  !----------------------------------------------------------------------------------------
isDigit Procedure(string pChar)
  CODE
    if val(pChar) >= 48 OR val(pChar) <= 57
      return true
    else
      return false
    end

  !----------------------------------------------------------------------------------------
  ! Check if a given char is an operator. +, -, *, / -> 1, 2, 3, 4 respectively
  !----------------------------------------------------------------------------------------
isOperator Procedure(string pChar)
  CODE
    case pChar
    of '+'
      return 1
    of '-'
      return 2
    of '*'
      return 3
    of '/'
      return 4
    else 
      return 0
    end

  !----------------------------------------------------------------------------------------
  ! Check if a given char is a bracket - ( -> 1, ) -> 2
  !----------------------------------------------------------------------------------------
isBracket Procedure(string pChar)
  CODE
    case pChar
    of '('
      return 1
    of ')'
      return 2
    else 
      return 0
    end
    
  !----------------------------------------------------------------------------------------
  ! Add and employee int an EMPLOYEE TABLE
  !----------------------------------------------------------------------------------------
addEmployee  PROCEDURE(String pEmployee, string pTitle)
e           string(255)
fileOpened  Long

    CODE
    if Status(EMPLOYEES) = 0
      OPEN(EMPLOYEES, 42h)
      fileOpened = TRUE
    End
    
    CASE ERRORCODE()
    of NoFileErr  ! File not Found
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
    else 
      message('Error opening Table: '& name(EMPLOYEES) & ' error= ' & errorcode() &' '& error())
      return error()
    End
    
    clear(EMPLOYEES)
    EMPLOYEES:Guid      = str.MakeGuid()
    EMPLOYEES:Employee  = pEmployee
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
  