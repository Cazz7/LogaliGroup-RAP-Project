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
  ENDMETHOD.

  METHOD validateDeliveryDate.
  ENDMETHOD.

  METHOD validateEmail.
  ENDMETHOD.

ENDCLASS.
