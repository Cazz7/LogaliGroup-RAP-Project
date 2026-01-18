CLASS zcl_data_gen_1967 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_data_gen_1967 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA: lt_header TYPE TABLE OF ztso_hd_1967.

  out->write( 'Adding DATA' ).

  TRY.
      APPEND VALUE ztso_hd_1967(
      sales_uuid = cl_system_uuid=>create_uuid_x16_static( )
      sales_id = '0000001'
      email = 'contact@techworld.com'
      firstname = 'John'
      lastname = 'Doe'
      country = 'Canada'
      deliverydate = '20260315'
      orderstatus = 2
      imageurl = ''
      createdon = cl_abap_context_info=>get_system_date( )
      createdby = 'USRCAZ'
       ) TO lt_header.
    CATCH cx_uuid_error.
      "handle exception
      return.
  ENDTRY.

  DELETE FROM ztso_hd_1967.
  INSERT ztso_hd_1967 FROM TABLE @lt_header.


  if sy-subrc = 0.
      out->write( 'Successfully added DATA' ).
  endif.

  ENDMETHOD.
ENDCLASS.
