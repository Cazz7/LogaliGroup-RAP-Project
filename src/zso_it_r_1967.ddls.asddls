@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Sales Order Detail Root Entity'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSO_IT_R_1967
  as select from ztso_it_1967
  association to parent ZSO_HD_R_1967 as _Header   on $projection.SalesUUID = _Header.SalesUUID
  //association [1..1] to I_Currency           as _Currency on $projection.Currency = _Currency.Currency
{
  key item_uuid             as ItemUUID,
      item_id               as ItemID,
      sales_uuid            as SalesUUID,
      name                  as Name,
      description           as Description,
      releaseddate          as ReleasedDate,
      discontinueddate      as DiscontinuedDate,
      price                 as Price,
      currency              as Currency,
      height                as Height,
      width                 as Width,
      depth                 as Depth,
      unitofmeasure         as UnitOfMeasure,
      quantity              as Quantity,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Header
      //_Currency // Make association public
}
