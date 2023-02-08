@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '부서 정보 인터페이스 CDS 뷰'
define root view entity zi_department
  as select from zdep_master



{
  key id                 as Id,
  key deptno             as Deptno,
      @EndUserText.label: '부서명'
      @Semantics.text: true
      deptname           as Deptname,
      mgrno              as Mgrno,
      admrdept           as Admrdept,
      location           as Location,
      locallastchangedat as Locallastchangedat

}
