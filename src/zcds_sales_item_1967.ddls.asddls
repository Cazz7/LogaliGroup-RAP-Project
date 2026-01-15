@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'CDS Sales Order Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_SALES_ITEM_1967
  as select from zsales_det_1967 as Detail

{
  key item_id          as Id,
  key item_uuid        as UUID,
      name             as Name,
      description      as Description,
      releaseddate     as Releaseddate,
      discontinueddate as Discontinueddate,
      @Semantics.amount.currencyCode : 'Currency'
      price            as Price,
      currency         as Currency,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      height           as Height,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      width            as Width,
      @Semantics.quantity.unitOfMeasure : 'Unitofmeasure'
      depth            as Depth,
      unitofmeasure    as Unitofmeasure,
      quantity         as Quantity
}
