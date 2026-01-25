@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Sales Order Detail Consumption Entity'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity ZSO_IT_C_1967
  as projection on ZSO_IT_R_1967
{
    key ItemUUID,
    ItemID,
    SalesUUID,
    Name,
    Description,
    ReleasedDate,
    DiscontinuedDate,
    Price,
    Currency,
    Height,
    Width,
    Depth,
    UnitOfMeasure,
    Quantity,
    LocalLastChangedAt,
    /* Associations */
    //_Currency,  
    _Header : redirected to parent ZSO_HD_C_1967 
}
