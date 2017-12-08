
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

solutionQueue QUEUE
  expression    string
  solution      long
  END
  
Window WINDOW('Dijikstra'),AT(,,193,107),GRAY,AUTO,SYSTEM,FONT('Segoe UI',10)
    LIST,AT(8,17,173,27),USE(?LIST1),FROM(solutionQueue)
    ENTRY(@S20),AT(8,61,173),USE(?ExpressionEntry)
    BUTTON('Evaluate'),AT(7,83),USE(?EvalButton)
    BUTTON('Close'),AT(139,83,43,14),USE(?CloseButton)
  END
  
    CODE
    open(Window)
    
    ! Add the heading of the History of the solution
    solutionQueue.expression = 'Expression'
    solutionQueue.solution   = 'Solution'
    
    ACCEPT
    
    end
    
    close(Window)  