

  MEMBER('greet.clw')

OMIT('***')
 * Created with Clarion 10.0
 * User: user
 * Date: 12/1/2017
 * Time: 12:52 PM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

  MAP
  END
  
  
  !------------------------------------------------------------------------------
  !  @Brief Greet a person in English
  !  @ params pName
  !------------------------------------------------------------------------------
GreetEnglish Procedure(STRING pName)
    CODE
      return 'Hello ' & pName
      
  !------------------------------------------------------------------------------
  !  @Brief Greet a person in English
  !  @ params pName
  !------------------------------------------------------------------------------
GreetSotho Procedure(STRING pName)
    CODE
      return 'Dumela ' & pName
      
  !------------------------------------------------------------------------------
  !  @Brief Greet a person in English
  !  @ params pName
  !------------------------------------------------------------------------------
GreetXhosa Procedure(STRING pName)
    CODE
      return 'Molo ' & pName

  !------------------------------------------------------------------------------
  !  @Brief Greet a person in English
  !  @ params pName
  !------------------------------------------------------------------------------
GreetVenda Procedure(STRING pName)
    CODE
      return 'Ndaa ' & pName