
  PROGRAM

OMIT('***')
 * Created with Clarion 10.0
 * User: user
 * Date: 12/1/2017
 * Time: 12:11 PM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

  MAP
    main()
  END

  CODE
  main()
  
  !----------------------------------------------------------------------------------------
  
main    Procedure()
Window WINDOW('Dijikstra'),AT(,,249,213),GRAY,AUTO,SYSTEM,FONT('Segoe UI',10)
    BUTTON('Find'),AT(80,161),USE(?FindButton)
    ENTRY(@s20),AT(44,110),USE(?ENTRY1)
    ENTRY(@s20),AT(44,133),USE(?ENTRY2),FONT(,,,FONT:regular+FONT:underline)
  END
  
    CODE
    open(Window)
    
    ACCEPT
    
    end
    close(Window)  