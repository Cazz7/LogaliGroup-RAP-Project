@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS Sales Orders'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_SALES_ORD_1967
  as select from ztso_hd_1967 as Header
{

  key sales_uuid   as UUID,
  key sales_id     as Id,
      email        as Email,
      firstname    as Firstname,
      lastname     as Lastname,
      country      as Country,
      createdon    as Createdon,
      deliverydate as Deliverydate,
      orderstatus  as Orderstatus,
      imageurl     as Imageurl
}
