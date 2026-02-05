CLASS lhc_detail DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS setItemID FOR DETERMINE ON SAVE
      IMPORTING keys FOR Detail~setItemID.

ENDCLASS.

CLASS lhc_detail IMPLEMENTATION.

  METHOD setItemID.

    READ ENTITIES OF zso_hd_r_1967 IN LOCAL MODE
    ENTITY Detail
    FIELDS ( ItemID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(details).

    DELETE details WHERE ItemID IS NOT INITIAL.

    " Obtengo el último registro guardado
    SELECT SINGLE FROM zso_it_i_1967
    FIELDS MAX( ItemID )
    INTO @DATA(max_item_id).

    " Desde el frontend pueden mandarme más de un registro
*  max_id + 1
*  max_id + 2
*  max_id + 3
    MODIFY ENTITIES OF zso_hd_r_1967 IN LOCAL MODE
    ENTITY Detail
    UPDATE
    FIELDS ( ItemID )
    WITH VALUE #( FOR detail IN details INDEX INTO i ( %tky = detail-%tky
                                                       ItemID = max_item_id + i ) ).

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
