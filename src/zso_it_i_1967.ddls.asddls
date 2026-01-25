@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Sales Order Detail Interface Entity'
@Metadata.ignorePropagatedAnnotations: false
define view entity ZSO_IT_I_1967
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
      //test
      //_Currency,
      _Header : redirected to parent ZSO_HD_I_1967
}
