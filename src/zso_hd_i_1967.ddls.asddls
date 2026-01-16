@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Order Header Interface Entity'
@Metadata.ignorePropagatedAnnotations: false
define root view entity ZSO_HD_I_1967 
provider contract transactional_interface
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
    _Detail : redirected to composition child ZSO_IT_I_1967
}
