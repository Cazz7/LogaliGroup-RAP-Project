@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Sales Order Header Root Entity'
@Metadata.ignorePropagatedAnnotations: false
define root view entity ZSO_HD_R_1967
  as select from ztso_hd_1967 as Header
  composition [0..*] of ZSO_IT_R_1967 as _Detail 
{

  key sales_uuid            as SalesUUID,
      sales_id              as SalesID,
      email                 as Email,
      firstname             as Firstname,
      lastname              as Lastname,
      country               as Country,
      deliverydate          as Deliverydate,
      orderstatus           as Orderstatus,
      imageurl              as Imageurl,
      createdon             as CreatedOn,
      @Semantics.user.createdBy: true
      createdby             as CreatedBy,
      @Semantics.user.lastChangedBy: true
      changedby             as ChangedBy,

      //Local ETag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      //Total ETag
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      
      _Detail

}
