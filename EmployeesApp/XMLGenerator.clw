  MEMBER
  !----------------------------------------------------------------------------------------
  ! Includes
  !----------------------------------------------------------------------------------------
  include('XMLGenerator.inc'), once
  include('stringtheory.inc'), once
  include('errors.clw'), once

  
  !----------------------------------------------------------------------------------------
  ! Global Variables
  !----------------------------------------------------------------------------------------
str           StringTheory
TableRecord   &GROUP
RecordValue   ANY

  MAP
  END
  !----------------------------------------------------------------------------------------
  ! Constructor
  !----------------------------------------------------------------------------------------
XMLGenerator.Construct  Procedure()
  CODE
  
  !----------------------------------------------------------------------------------------
  ! Destructor
  !----------------------------------------------------------------------------------------
XMLGenerator.Destruct  Procedure()
  CODE
  
  !----------------------------------------------------------------------------------------
  ! Generate and XML file with a given FileName of a give Table
  !----------------------------------------------------------------------------------------
XMLGenerator.Generate  Procedure(FILE pTableFile, string pFileName)
RecordLength    Long
Index           Long
FileOpened      Long
RecordTag       ANY
RecordContent   ANY
ErrorMessage    string(255)

  CODE
    
    if STATUS(pTableFile) = 0
      OPEN(pTableFile,42h)
      FileOpened = TRUE
    End
    CASE  Errorcode()
    of NoFileErr    !File not found
      if errorcode()
        ErrorMessage = error()
        message('No File found for Table: '& name(pTableFile) & ' error= ' & errorcode() &' '& error())
        return ErrorMessage
      End
    of IsOpenErr

    else

    End
    TableRecord &= pTableFile{PROP:Record}
    RecordLength = pTableFile{PROP:Fields}
  
  SET(pTableFile, 1)
  !-------------------------------------------------
  str.Start()                                           ! Reset str object: To avoid appending the string if the button is pressed twice
  str.Append('<' & 'xml' &'><13,10>')

  
  LOOP
    NEXT(pTableFile)                 
    IF ERRORCODE() THEN BREAK.
    
    str.Append('<9><' & 'record' &'><13,10>')
    LOOP Index = 1 TO RecordLength BY 1
      !------- Opening Tag -------!
      RecordTag = WHO(TableRecord,Index)
      str.Append('<9><9><' & CLIP(RecordTag) &'>')
      
      !------- Contents -------!
      RecordContent &= WHAT(TableRecord,Index)
      str.Append(CLIP(RecordContent))

      !------- Closing Tag -------!
      RecordTag = WHO(TableRecord,Index)
      str.Append('</' & CLIP(RecordTag) &'><13,10>')
    END
    str.Append('<9></' & 'record' &'><13,10>')
    str.Append('<13,10>')
  END



  str.Append('</' & 'xml' &'>')
  !------------------------------------------------------
  
  if str.SaveFile(pFileName)
    MESSAGE('File saved successfully.')
  Else
    MESSAGE('File Not Saved unsuccessfully.')
  end   
  
  if FileOpened
    close(pTableFile)
  End
  return 1
  
  !----------------------------------------------------------------------------------------
  ! Generate and XML file with a given FileName of a give Table
  !----------------------------------------------------------------------------------------
XMLGenerator.Generate  Procedure(VIEW pTableVeiw, string pFileName)
  CODE
  
  return 1