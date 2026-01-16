@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Sales Order Detail Consumption Entity'
@Metadata.ignorePropagatedAnnotations: false
define root view entity ZSO_HD_C_1967
  provider contract transactional_query
  as projection on ZSO_HD_R_1967
{
    key SalesUUID,
    SalesID,
    Email,
    Firstname,
    Lastname,
    Country,
    Deliverydate,
    Orderstatus,
    Imageurl,
    CreatedOn,
    CreatedBy,
    ChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _Detail : redirected to composition child ZSO_IT_C_1967
}
