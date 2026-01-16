@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Sales Order Detail Interface Entity'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZSO_IT_I_1967
  as projection on ZSO_IT_R_1967
{
  key ItemUuid,
      ItemId,
      SalesUUID,
      Name,
      Description,
      Releaseddate,
      Discontinueddate,
      Price,
      Currency,
      Height,
      Width,
      Depth,
      Unitofmeasure,
      Quantity,
      LocalLastChangedAt,
      /* Associations */
      _Currency,
      _Header : redirected to parent ZSO_HD_I_1967
}
