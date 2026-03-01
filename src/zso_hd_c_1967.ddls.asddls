@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Sales Order Detail Consumption Entity'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
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
      DeliveryDate,
      @ObjectModel.text.element: [ 'OrderStatusText' ]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZSO_STATUS_R_1967',
                                                     element: 'so_status'},
                                           useForValidation: true }]
      OrderStatus,
      _OrderStatus._Text.Text as OrderStatusText : localized,
      Imageurl,
      CreatedOn,
      CreatedBy,
      ChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      /* Associations */
      _Detail : redirected to composition child ZSO_IT_C_1967,
      _OrderStatus
}
