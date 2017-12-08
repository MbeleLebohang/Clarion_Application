
  PROGRAM

OMIT('***')
 * Created with Clarion 10.0
 * User: Mbele Lebohang
 * Date: 12/1/2017
 * Time: 12:22 PM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***
  include('stringtheory.inc')
  MAP
    main()
    
    MODULE('languages.clw')
    END

  END
    
  CODE
    main()
  
  !----------------------------------------------------------------------
  !                 Define all the Procedures here 
  !----------------------------------------------------------------------  
main  PROCEDURE()
str StringTheory
Grp Group
a     String(20)
b     Long
c     String(20)
    End
  CODE
  grp.a = 'hello'
  grp.b = 100
  grp.c = 'worlds'
  MESSAGE(str.serializeGroup(grp))



        
        
        
        