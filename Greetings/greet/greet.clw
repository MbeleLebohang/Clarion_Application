  PROGRAM

OMIT('***')
 * Created with Clarion 10.0
 * User: Mbele Lebohang
 * Date: 12/1/2017
 * Time: 11:52 AM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

  !----------------------------------------------------------------------
  !            Declare all the prototypes of Procedures here 
  !----------------------------------------------------------------------
  MAP
        main()
        
        module('languages.clw')
          GreetEnglish(string pName), string
          GreetSotho(string pName), string
          GreetXhosa(string pName), string
          GreetVenda(string pName), string
        END
  END
    
  CODE
  main()    
  
  !----------------------------------------------------------------------
  !                 Define all the Procedures here 
  !----------------------------------------------------------------------  

main                Procedure()
    CODE
    message(GreetVenda('Lebohang'))