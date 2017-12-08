
  PROGRAM

OMIT('***')
 * Created with Clarion 10.0
 * User: Mbele Lebohang
 * Date: 12/6/2017
 * Time: 11:04 AM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

  MAP
    main()
    
    module('utils.clw')
      addEmployee(String pEmployee, string pTitle), string
    End
  END

  CODE
  main()
  
!-----------------------------------------------------  
main  Procedure()
ErrorMessage  string(255)
  CODE
  ErrorMessage = addEmployee('Anita', 'Cleaner')
  
  message('Employee added Successfully.')
