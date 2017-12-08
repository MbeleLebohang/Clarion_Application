
  PROGRAM

OMIT('***')
 * Created with Clarion 10.0
 * User: user
 * Date: 12/1/2017
 * Time: 12:07 PM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

  MAP
  END

 INCLUDE('equates.clw'),ONCE 

MyWindow WINDOW('Caption'),AT(,,192,110),GRAY,FONT('MS Sans Serif',8,,FONT:regular)
        BUTTON('&OK'),AT(102,82,35,14),USE(?OkButton),DEFAULT,LEFT
        BUTTON('&Cancel'),AT(144,82,36,14),USE(?CancelButton),LEFT
    END

  CODE
 OPEN(MyWindow)
 ACCEPT
    CASE FIELD()
    OF 0
       CASE EVENT()
       OF EVENT:OpenWindow
       END
    OF ?OkButton
       CASE EVENT()
       OF EVENT:Accepted
       END
    OF ?CancelButton
       CASE EVENT()
       OF EVENT:Accepted
          POST(EVENT:CloseWindow)
       END
    END
 END
 