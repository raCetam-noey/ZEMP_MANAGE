@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '성별 도메인 Associaton 용 뷰'
define view entity ZI_GENDER
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZDM_GENDER' )
{

  key domain_name,
  key value_position,
      @Semantics.language: true
  key language,
      value_low as Value,
      @Semantics.text: true
      text as Description
}
