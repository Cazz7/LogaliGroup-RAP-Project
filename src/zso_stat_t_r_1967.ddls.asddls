@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Status Value Help text Entity'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
 serviceQuality: #A,
 sizeCategory: #S,
 dataClass: #MASTER
 }
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZSO_STAT_T_R_1967
  as select from ztso_stat_t_1967

  association [1..1] to ZSO_STATUS_R_1967 as _OrderStatus on $projection.so_status = _OrderStatus.so_status

{
      @ObjectModel.text.element: ['Text']
      key so_status,

      @Semantics.language: true
      key language       as Language,

      @Semantics.text: true
      text           as Text,

      _OrderStatus
}
