@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '직원 정보 인터페이스 CDS 뷰'

define root view entity ZI_EMPLOYEE
  as select from ztemp_master as EMPLOYEE
  association [1..*] to ZI_GENDER     as _gender on $projection.Sex = _gender.Value
  association [1..*] to zi_department as _depart on $projection.Workdept = _depart.Deptno
{
  key id                  as Id,
  key empno               as Empno,
      name                as Name,
      workdept            as Workdept,
      phoneno             as Phoneno,
      hiredate            as Hiredate,
      job                 as Job,
      edlevel             as Edlevel,
      sex                 as Sex,
      birthdate           as Birthdate,
      onduty              as Onduty,
      locallastchangedat  as Locallastchangedat,

      //associ ZI_GENDER
      _gender,
      _gender.Description as Genderdesc,

      //associ ZI_DEPARTMENT
      _depart,
      _depart.Deptname    as Deptname

}
