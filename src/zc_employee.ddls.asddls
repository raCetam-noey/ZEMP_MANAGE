@Metadata.allowExtensions: true

@AccessControl.authorizationCheck: #NOT_REQUIRED


@EndUserText.label: 'C View Ref I_EMPLOYEE'

define root view entity ZC_EMPLOYEE
  provider contract transactional_query
  as projection on ZI_EMPLOYEE as Employee
{

  key Id,
      @EndUserText.label: '사원번호'
  key Empno,
      @EndUserText.label: '이름'
      Name,
      @EndUserText.label: '부서 코드'
      Workdept,
      @EndUserText.label: '부서'
      Deptname,

      @EndUserText.label: '연락처'
      Phoneno,
      @EndUserText.label: '입사일자'
      Hiredate,
      @EndUserText.label: '담당업무'
      Job,
      @EndUserText.label: '연수기간'
      Edlevel,
      @EndUserText.label: '성별'
      Sex,
      Genderdesc,

      @EndUserText.label: '생일'
      Birthdate,
      @EndUserText.label: '계정 활성화'
      Onduty,
      @EndUserText.label: '드래프트 저장 시간'
      @Semantics.user.localInstanceLastChangedBy: true
      Locallastchangedat
}
