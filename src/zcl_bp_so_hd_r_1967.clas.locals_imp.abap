CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF order_status,
        new        type i VALUE 0,
        open       TYPE i VALUE 1, " New
        delivered TYPE i VALUE 2, " Delivered
        cancelled TYPE i VALUE 3, " Cancelled
      END OF order_status.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Header RESULT result.

    METHODS acceptSale FOR MODIFY
      IMPORTING keys FOR ACTION Header~acceptSale RESULT result.

    METHODS rejectSale FOR MODIFY
      IMPORTING keys FOR ACTION Header~rejectSale RESULT result.

    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION Header~Resume.

    METHODS setStatusNew FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Header~setStatusNew.

    METHODS setSalesID FOR DETERMINE ON SAVE
      IMPORTING keys FOR Header~setSalesID.

    METHODS validateDeliveryDate FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateDeliveryDate.

    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateEmail.
    METHODS setCreatedOnDate FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Header~setCreatedOnDate.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD acceptSale.
  ENDMETHOD.

  METHOD rejectSale.
  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD setStatusNew.

    " EML
    READ ENTITIES OF zso_hd_r_1967 IN LOCAL MODE
    ENTITY Header
    FIELDS ( OrderStatus )
    WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    DELETE headers WHERE OrderStatus IS NOT INITIAL.

    CHECK headers IS NOT INITIAL.

    MODIFY ENTITIES OF zso_hd_r_1967 IN LOCAL MODE
    ENTITY Header
    UPDATE
    FIELDS ( OrderStatus )
    WITH VALUE #( FOR header IN headers ( %tky = header-%tky
                  OrderStatus = order_status-new ) ).

  ENDMETHOD.

  METHOD setSalesID.

    READ ENTITIES OF zso_hd_r_1967 IN LOCAL MODE
    ENTITY Header
    FIELDS ( SalesID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    DELETE headers WHERE SalesID IS NOT INITIAL.

    " Obtengo el último registro guardado
    SELECT SINGLE FROM zso_hd_r_1967
    FIELDS MAX( SalesID )
    INTO @DATA(max_sales_id).

    " Desde el frontend pueden mandarme más de un registro
*  max_id + 1
*  max_id + 2
*  max_id + 3
    MODIFY ENTITIES OF zso_hd_r_1967 IN LOCAL MODE
    ENTITY Header
    UPDATE
    FIELDS ( SalesID )
    WITH VALUE #( FOR header IN headers INDEX INTO i ( %tky = header-%tky
                                                       SalesID = max_sales_id + i ) ).

  ENDMETHOD.

  METHOD validateDeliveryDate.
  ENDMETHOD.

  METHOD validateEmail.
  ENDMETHOD.

  METHOD setCreatedOnDate.

    " EML
    READ ENTITIES OF zso_hd_r_1967 IN LOCAL MODE
    ENTITY Header
    FIELDS ( OrderStatus )
    WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    DELETE headers WHERE OrderStatus IS NOT INITIAL.

    CHECK headers IS NOT INITIAL.

    MODIFY ENTITIES OF zso_hd_r_1967 IN LOCAL MODE
    ENTITY Header
    UPDATE
    FIELDS ( OrderStatus )
    WITH VALUE #( FOR header IN headers ( %tky = header-%tky
                  CreatedOn = cl_abap_context_info=>get_system_date( ) ) ).

  ENDMETHOD.

ENDCLASS.
