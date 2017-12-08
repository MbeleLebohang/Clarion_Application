
  PROGRAM

OMIT('***')
 * Created with Clarion 10.0
 * User: Mbele Lebohang
 * Date: 12/1/2017
 * Time: 1:20 PM
 ***

  MAP
    main()
    
    module('utils.clw')
      DijikstraEvaluator(String pExpression), long
      isDigit(string pChar), bool
      isOperator(string pChar), long
      isBracket(string pChar), long
      addEmployee(String pEmployee, string pTitle), string
    end
    
  END

  CODE
  main()
  
  !---------------------------------------------------------------------------------
main Procedure()

SolutionQueue    QUEUE
expression   string(50)
solution     long
  END
  
NewExpression  like(SolutionQueue.expression)

  
Window WINDOW('Dijikstra'),AT(,,270,122),GRAY,FONT('Segoe UI',8)
    BUTTON('Evaluate'),AT(2,83),USE(?EvaluateButton),FONT('Segoe UI',10,,, |
        CHARSET:DEFAULT)
    BUTTON('Close'),AT(231,83),USE(?CloseButton),FONT('Segoe UI',10,,,CHARSET:DEFAULT)
    LIST,AT(3,21,265,35),USE(?LIST1),FROM(SolutionQueue)
    ENTRY(@s20),AT(56,61,211),USE(NewExpression)
    PROMPT('Expression'),AT(2,60,49,14),USE(?PROMPT1),FONT('Segoe UI',10,, |
        FONT:regular,CHARSET:DEFAULT)
    PROMPT('Solution'),AT(2,3,49,14),USE(?PROMPT2),FONT('Segoe UI',10,, |
        FONT:regular,CHARSET:DEFAULT)
  END
  
  CODE
    open(Window)
    
    ACCEPT
      case event()
      of EVENT:CloseWindow
      break
      
      of EVENT:Accepted
        case field()
        of ?EvaluateButton
          ! Get the expression from the entry and evaluate it
          SolutionQueue.expression = NewExpression
          
          SolutionQueue.solution = DijikstraEvaluator(NewExpression)
          
          add(SolutionQueue)
          
        of ?CloseButton
          post(event:closewindow)
        end
      end

    end
    
    close(Window)

