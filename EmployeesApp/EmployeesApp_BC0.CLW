  MEMBER('EmployeesApp.clw')

  INCLUDE('ABFILE.INC'),ONCE

  MAP
EmployeesApp_BC0:DctInit    PROCEDURE()
EmployeesApp_BC0:DctKill    PROCEDURE()
EmployeesApp_BC0:FilesInit  PROCEDURE()
  END

Hide:Access:Employees CLASS(FileManager),TYPE              ! FileManager for Employees
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Employees CLASS(RelationManager),TYPE          ! RelationManager for Employees
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Phones   CLASS(FileManager),TYPE               ! FileManager for Phones
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Phones   CLASS(RelationManager),TYPE           ! RelationManager for Phones
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Salary   CLASS(FileManager),TYPE               ! FileManager for Salary
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Salary   CLASS(RelationManager),TYPE           ! RelationManager for Salary
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Benefits CLASS(FileManager),TYPE               ! FileManager for Benefits
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Benefits CLASS(RelationManager),TYPE           ! RelationManager for Benefits
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Qualification CLASS(FileManager),TYPE          ! FileManager for Qualification
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Qualification CLASS(RelationManager),TYPE      ! RelationManager for Qualification
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:Schools  CLASS(FileManager),TYPE               ! FileManager for Schools
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:Schools  CLASS(RelationManager),TYPE           ! RelationManager for Schools
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LinkBenefitsEmployee CLASS(FileManager),TYPE   ! FileManager for LinkBenefitsEmployee
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LinkBenefitsEmployee CLASS(RelationManager),TYPE ! RelationManager for LinkBenefitsEmployee
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END

Hide:Access:LinkEmployeeQualification CLASS(FileManager),TYPE ! FileManager for LinkEmployeeQualification
Init                   PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
PrimeFields            PROCEDURE(),PROC,DERIVED
UseFile                PROCEDURE(BYTE UseType = UseType:Uses),BYTE,PROC,DERIVED
                     END


Hide:Relate:LinkEmployeeQualification CLASS(RelationManager),TYPE ! RelationManager for LinkEmployeeQualification
Init                   PROCEDURE
DeferedAddRelations    PROCEDURE(),DERIVED
Kill                   PROCEDURE(),DERIVED
                     END


_Hide:Access:Employees &Hide:Access:Employees,AUTO,THREAD
_Hide:Relate:Employees &Hide:Relate:Employees,AUTO,THREAD
_Hide:Access:Phones  &Hide:Access:Phones,AUTO,THREAD
_Hide:Relate:Phones  &Hide:Relate:Phones,AUTO,THREAD
_Hide:Access:Salary  &Hide:Access:Salary,AUTO,THREAD
_Hide:Relate:Salary  &Hide:Relate:Salary,AUTO,THREAD
_Hide:Access:Benefits &Hide:Access:Benefits,AUTO,THREAD
_Hide:Relate:Benefits &Hide:Relate:Benefits,AUTO,THREAD
_Hide:Access:Qualification &Hide:Access:Qualification,AUTO,THREAD
_Hide:Relate:Qualification &Hide:Relate:Qualification,AUTO,THREAD
_Hide:Access:Schools &Hide:Access:Schools,AUTO,THREAD
_Hide:Relate:Schools &Hide:Relate:Schools,AUTO,THREAD
_Hide:Access:LinkBenefitsEmployee &Hide:Access:LinkBenefitsEmployee,AUTO,THREAD
_Hide:Relate:LinkBenefitsEmployee &Hide:Relate:LinkBenefitsEmployee,AUTO,THREAD
_Hide:Access:LinkEmployeeQualification &Hide:Access:LinkEmployeeQualification,AUTO,THREAD
_Hide:Relate:LinkEmployeeQualification &Hide:Relate:LinkEmployeeQualification,AUTO,THREAD


EmployeesApp_BC0:DctInit PROCEDURE()
  CODE
  _Hide:Access:Employees &= NEW(Hide:Access:Employees)
  _Hide:Relate:Employees &= NEW(Hide:Relate:Employees)
  _Hide:Access:Phones &= NEW(Hide:Access:Phones)
  _Hide:Relate:Phones &= NEW(Hide:Relate:Phones)
  _Hide:Access:Salary &= NEW(Hide:Access:Salary)
  _Hide:Relate:Salary &= NEW(Hide:Relate:Salary)
  _Hide:Access:Benefits &= NEW(Hide:Access:Benefits)
  _Hide:Relate:Benefits &= NEW(Hide:Relate:Benefits)
  _Hide:Access:Qualification &= NEW(Hide:Access:Qualification)
  _Hide:Relate:Qualification &= NEW(Hide:Relate:Qualification)
  _Hide:Access:Schools &= NEW(Hide:Access:Schools)
  _Hide:Relate:Schools &= NEW(Hide:Relate:Schools)
  _Hide:Access:LinkBenefitsEmployee &= NEW(Hide:Access:LinkBenefitsEmployee)
  _Hide:Relate:LinkBenefitsEmployee &= NEW(Hide:Relate:LinkBenefitsEmployee)
  _Hide:Access:LinkEmployeeQualification &= NEW(Hide:Access:LinkEmployeeQualification)
  _Hide:Relate:LinkEmployeeQualification &= NEW(Hide:Relate:LinkEmployeeQualification)
  Relate:Employees &= _Hide:Relate:Employees
  Relate:Phones &= _Hide:Relate:Phones
  Relate:Salary &= _Hide:Relate:Salary
  Relate:Benefits &= _Hide:Relate:Benefits
  Relate:Qualification &= _Hide:Relate:Qualification
  Relate:Schools &= _Hide:Relate:Schools
  Relate:LinkBenefitsEmployee &= _Hide:Relate:LinkBenefitsEmployee
  Relate:LinkEmployeeQualification &= _Hide:Relate:LinkEmployeeQualification


EmployeesApp_BC0:FilesInit PROCEDURE()
  CODE
  _Hide:Relate:Employees.Init
  _Hide:Relate:Phones.Init
  _Hide:Relate:Salary.Init
  _Hide:Relate:Benefits.Init
  _Hide:Relate:Qualification.Init
  _Hide:Relate:Schools.Init
  _Hide:Relate:LinkBenefitsEmployee.Init
  _Hide:Relate:LinkEmployeeQualification.Init


EmployeesApp_BC0:DctKill PROCEDURE()
  CODE
  _Hide:Relate:Employees.Kill
  DISPOSE(_Hide:Relate:Employees)
  _Hide:Relate:Phones.Kill
  DISPOSE(_Hide:Relate:Phones)
  _Hide:Relate:Salary.Kill
  DISPOSE(_Hide:Relate:Salary)
  _Hide:Relate:Benefits.Kill
  DISPOSE(_Hide:Relate:Benefits)
  _Hide:Relate:Qualification.Kill
  DISPOSE(_Hide:Relate:Qualification)
  _Hide:Relate:Schools.Kill
  DISPOSE(_Hide:Relate:Schools)
  _Hide:Relate:LinkBenefitsEmployee.Kill
  DISPOSE(_Hide:Relate:LinkBenefitsEmployee)
  _Hide:Relate:LinkEmployeeQualification.Kill
  DISPOSE(_Hide:Relate:LinkEmployeeQualification)


Hide:Relate:Employees.Init PROCEDURE()
  CODE
  _Hide:Access:Employees.Init
  SELF.Init(Access:Employees,1)


Hide:Access:Employees.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Emp:Record
  SELF.FileNameValue = 'Employees'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Employees
  PARENT.Init
  Access:Employees &= SELF


Hide:Access:Employees.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Employees &= NULL                                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Employees.PrimeFields PROCEDURE

  CODE
  Emp:Guid = glo:str.MakeGuid()                            ! Assign initial field value
  Emp:QualificationGuid = glo:str.MakeGuid()               ! Assign initial field value
  Emp:SalaryGuid = glo:str.MakeGuid()                      ! Assign initial field value
  Emp:BenefitsGuid = glo:str.MakeGuid()                    ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Employees.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Employees,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Emp:PhoneGuidKey,'Emp:PhoneGuidKey',0)
    SELF.AddKey(Emp:BenefitsGuidKey,'Emp:BenefitsGuidKey',0)
    SELF.AddKey(Emp:SalaryGuidKey,'Emp:SalaryGuidKey',0)
    SELF.AddKey(Emp:QualificationGuidKey,'Emp:QualificationGuidKey',0)
    SELF.AddKey(Emp:GuidKey,'Emp:GuidKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Employees.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Salary)

  SELF.AddRelation(Relate:LinkBenefitsEmployee,RI:None,RI:None,Lin:EmployeeGuidKey)
  SELF.AddRelationLink(Emp:BenefitsGuid,Lin:EmployeeGuid)

  SELF.AddRelation(Relate:LinkEmployeeQualification,RI:None,RI:None,Lin2:EmployeeGuidKey)
  SELF.AddRelationLink(Emp:QualificationGuid,Lin2:EmployeeGuid)

  SELF.AddRelation(Relate:Phones,RI:None,RI:None,Pho:EmployeeGuidKey)
  SELF.AddRelationLink(Emp:PhoneGuid,Pho:EmployeeGuid)


Hide:Relate:Employees.Kill PROCEDURE

  CODE
  _Hide:Access:Employees.Kill                              ! Kill the file manager
  PARENT.Kill
  Relate:Employees &= NULL                                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Employees)                          ! destroy the file manager


Hide:Relate:Phones.Init PROCEDURE()
  CODE
  _Hide:Access:Phones.Init
  SELF.Init(Access:Phones,1)


Hide:Access:Phones.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Pho:Record
  SELF.FileNameValue = 'Phones'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Phones
  PARENT.Init
  Access:Phones &= SELF


Hide:Access:Phones.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Phones &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Phones.PrimeFields PROCEDURE

  CODE
  Pho:Guid = glo:str.MakeGuid()                            ! Assign initial field value
  Pho:EmployeeGuid = glo:str.MakeGuid()                    ! Assign initial field value
  Pho:Phone_Type = 'Work'                                  ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Phones.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Phones,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Pho:EmployeeGuidKey,'Pho:EmployeeGuidKey',0)
    SELF.AddKey(Pho:GuidKey,'Pho:GuidKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Phones.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Employees)


Hide:Relate:Phones.Kill PROCEDURE

  CODE
  _Hide:Access:Phones.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Phones &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Phones)                             ! destroy the file manager


Hide:Relate:Salary.Init PROCEDURE()
  CODE
  _Hide:Access:Salary.Init
  SELF.Init(Access:Salary,1)


Hide:Access:Salary.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Sal:Record
  SELF.FileNameValue = 'Salary'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Salary
  PARENT.Init
  Access:Salary &= SELF


Hide:Access:Salary.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Salary &= NULL                                    ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Salary.PrimeFields PROCEDURE

  CODE
  Sal:Guid = glo:str.MakeGuid()                            ! Assign initial field value
  Sal:EmployeeGuid = glo:str.MakeGuid()                    ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Salary.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Salary,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Sal:EmployeeGuidKey,'Sal:EmployeeGuidKey',0)
    SELF.AddKey(Sal:GuidKey,'Sal:GuidKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Salary.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Employees,RI:None,RI:None,Emp:SalaryGuidKey)
  SELF.AddRelationLink(Sal:EmployeeGuid,Emp:SalaryGuid)


Hide:Relate:Salary.Kill PROCEDURE

  CODE
  _Hide:Access:Salary.Kill                                 ! Kill the file manager
  PARENT.Kill
  Relate:Salary &= NULL                                    ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Salary)                             ! destroy the file manager


Hide:Relate:Benefits.Init PROCEDURE()
  CODE
  _Hide:Access:Benefits.Init
  SELF.Init(Access:Benefits,1)


Hide:Access:Benefits.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Ben:Record
  SELF.FileNameValue = 'Benefits'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Benefits
  PARENT.Init
  Access:Benefits &= SELF


Hide:Access:Benefits.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Benefits &= NULL                                  ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Benefits.PrimeFields PROCEDURE

  CODE
  Ben:Guid = glo:str.MakeGuid()                            ! Assign initial field value
  Ben:EmployeeGuid = glo:str.MakeGuid()                    ! Assign initial field value
  Ben:Benefit_Type = 'None'                                ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Benefits.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Benefits,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Ben:EmployeeGuidKey,'Ben:EmployeeGuidKey',0)
    SELF.AddKey(Ben:GuidKey,'Ben:GuidKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Benefits.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LinkBenefitsEmployee,RI:None,RI:None,Lin:BenefitsGuidKey)
  SELF.AddRelationLink(Ben:EmployeeGuid,Lin:BenefitsGuid)


Hide:Relate:Benefits.Kill PROCEDURE

  CODE
  _Hide:Access:Benefits.Kill                               ! Kill the file manager
  PARENT.Kill
  Relate:Benefits &= NULL                                  ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Benefits)                           ! destroy the file manager


Hide:Relate:Qualification.Init PROCEDURE()
  CODE
  _Hide:Access:Qualification.Init
  SELF.Init(Access:Qualification,1)


Hide:Access:Qualification.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Qua:Record
  SELF.FileNameValue = 'Qualification'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Qualification
  PARENT.Init
  Access:Qualification &= SELF


Hide:Access:Qualification.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Qualification &= NULL                             ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Qualification.PrimeFields PROCEDURE

  CODE
  Qua:Guid = glo:str.MakeGuid()                            ! Assign initial field value
  Qua:EmployeeGuid = glo:str.MakeGuid()                    ! Assign initial field value
  Qua:SchoolGuid = glo:str.MakeGuid()                      ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Qualification.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Qualification,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Qua:EmployeeGuidKey,'Qua:EmployeeGuidKey',0)
    SELF.AddKey(Qua:SchoolGuidKey,'Qua:SchoolGuidKey',0)
    SELF.AddKey(Qua:GuidKey,'Qua:GuidKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Qualification.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:LinkEmployeeQualification,RI:None,RI:None,Lin2:EmployeeGuidKey)
  SELF.AddRelationLink(Qua:EmployeeGuid,Lin2:EmployeeGuid)

  SELF.AddRelation(Relate:Schools)


Hide:Relate:Qualification.Kill PROCEDURE

  CODE
  _Hide:Access:Qualification.Kill                          ! Kill the file manager
  PARENT.Kill
  Relate:Qualification &= NULL                             ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Qualification)                      ! destroy the file manager


Hide:Relate:Schools.Init PROCEDURE()
  CODE
  _Hide:Access:Schools.Init
  SELF.Init(Access:Schools,1)


Hide:Access:Schools.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Sch:Record
  SELF.FileNameValue = 'Schools'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= Schools
  PARENT.Init
  Access:Schools &= SELF


Hide:Access:Schools.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:Schools &= NULL                                   ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:Schools.PrimeFields PROCEDURE

  CODE
  Sch:Guid = glo:str.MakeGuid()                            ! Assign initial field value
  Sch:QualificationGuid = glo:str.MakeGuid()               ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:Schools.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(Schools,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Sch:QualificationGuidKey,'Sch:QualificationGuidKey',0)
    SELF.AddKey(Sch:GuidKey,'Sch:GuidKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:Schools.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Qualification,RI:None,RI:None,Qua:SchoolGuidKey)
  SELF.AddRelationLink(Sch:QualificationGuid,Qua:SchoolGuid)


Hide:Relate:Schools.Kill PROCEDURE

  CODE
  _Hide:Access:Schools.Kill                                ! Kill the file manager
  PARENT.Kill
  Relate:Schools &= NULL                                   ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:Schools)                            ! destroy the file manager


Hide:Relate:LinkBenefitsEmployee.Init PROCEDURE()
  CODE
  _Hide:Access:LinkBenefitsEmployee.Init
  SELF.Init(Access:LinkBenefitsEmployee,1)


Hide:Access:LinkBenefitsEmployee.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Lin:Record
  SELF.FileNameValue = 'LinkBenefitsEmployee'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LinkBenefitsEmployee
  PARENT.Init
  Access:LinkBenefitsEmployee &= SELF


Hide:Access:LinkBenefitsEmployee.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LinkBenefitsEmployee &= NULL                      ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LinkBenefitsEmployee.PrimeFields PROCEDURE

  CODE
  Lin:Guid = glo:str.MakeGuid()                            ! Assign initial field value
  Lin:EmployeeGuid = glo:str.MakeGuid()                    ! Assign initial field value
  Lin:BenefitsGuid = glo:str.MakeGuid()                    ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:LinkBenefitsEmployee.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LinkBenefitsEmployee,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Lin:GuidKey,'Lin:GuidKey',0)
    SELF.AddKey(Lin:BenefitsGuidKey,'Lin:BenefitsGuidKey',0)
    SELF.AddKey(Lin:EmployeeGuidKey,'Lin:EmployeeGuidKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LinkBenefitsEmployee.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Benefits)

  SELF.AddRelation(Relate:Employees)


Hide:Relate:LinkBenefitsEmployee.Kill PROCEDURE

  CODE
  _Hide:Access:LinkBenefitsEmployee.Kill                   ! Kill the file manager
  PARENT.Kill
  Relate:LinkBenefitsEmployee &= NULL                      ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LinkBenefitsEmployee)               ! destroy the file manager


Hide:Relate:LinkEmployeeQualification.Init PROCEDURE()
  CODE
  _Hide:Access:LinkEmployeeQualification.Init
  SELF.Init(Access:LinkEmployeeQualification,1)


Hide:Access:LinkEmployeeQualification.Init PROCEDURE

  CODE
  SELF.Initialized = False
  SELF.Buffer &= Lin2:Record
  SELF.FileNameValue = 'LinkEmployeeQualification'
  SELF.SetErrors(GlobalErrors)
  SELF.File &= LinkEmployeeQualification
  PARENT.Init
  Access:LinkEmployeeQualification &= SELF


Hide:Access:LinkEmployeeQualification.Kill PROCEDURE

  CODE
  PARENT.Kill
  Access:LinkEmployeeQualification &= NULL                 ! File manager has been destroyed to assign null, it is an error to reference this after this point


Hide:Access:LinkEmployeeQualification.PrimeFields PROCEDURE

  CODE
  Lin2:Guid = glo:str.MakeGuid()                           ! Assign initial field value
  Lin2:EmployeeGuid = glo:str.MakeGuid()                   ! Assign initial field value
  Lin2:QualificationGuid = glo:str.MakeGuid()              ! Assign initial field value
  PARENT.PrimeFields


Hide:Access:LinkEmployeeQualification.UseFile PROCEDURE(BYTE UseType = UseType:Uses)

ReturnValue          BYTE,AUTO

  CODE
  IF UseType ~= UseType:Initialize
    SELF.UseFile(UseType:Initialize)                       !Recursive call to ensure initialization takes place
  END
  IF UseType = UseType:Initialize AND ~SELF.Initialized
    SELF.InUseFile = True
    SELF.Init(LinkEmployeeQualification,GlobalErrors)
    SELF.Create = 1
    SELF.LockRecover = 10
    SELF.AddKey(Lin2:GuidKey,'Lin2:GuidKey',0)
    SELF.AddKey(Lin2:EmployeeGuidKey,'Lin2:EmployeeGuidKey',0)
    SELF.AddKey(Lin2:QualificationGuidKey,'Lin2:QualificationGuidKey',0)
  END
                                                           !SELF.InUseFile will be set to False in PARENT
  ReturnValue = PARENT.UseFile(UseType)
  RETURN ReturnValue


Hide:Relate:LinkEmployeeQualification.DeferedAddRelations PROCEDURE

  CODE
  DO AddRelations_1
  
  PARENT.DeferedAddRelations

AddRelations_1 ROUTINE
  SELF.AddRelation(Relate:Employees)

  SELF.AddRelation(Relate:Qualification)


Hide:Relate:LinkEmployeeQualification.Kill PROCEDURE

  CODE
  _Hide:Access:LinkEmployeeQualification.Kill              ! Kill the file manager
  PARENT.Kill
  Relate:LinkEmployeeQualification &= NULL                 ! Assign NULL to the RelationManager's FileManager reference, it is an error to reference this after this point
  DISPOSE(_Hide:Access:LinkEmployeeQualification)          ! destroy the file manager

