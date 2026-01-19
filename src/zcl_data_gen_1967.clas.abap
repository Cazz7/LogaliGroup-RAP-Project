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
  DATA: lt_DETAIL TYPE TABLE OF ztso_IT_1967.

  out->write( 'Adding DATA' ).

  TRY.
  DATA(LV_HD_UUID) = cl_system_uuid=>create_uuid_x16_static( ).

      APPEND VALUE ztso_hd_1967(
      sales_uuid = LV_HD_UUID
      sales_id = '1000001'
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

DATA(LV_IT_UUID) = cl_system_uuid=>create_uuid_x16_static( ).
      APPEND VALUE ztso_it_1967(
      item_uuid = LV_IT_UUID
      item_ID = '2000001'
      sales_uuid = LV_HD_UUID
      name = 'Thinkpad Laptop'
      description = 'A very nice laptop'
      releaseddate = '20250315'
      discontinueddate = '20260315'
      price = '1250'
      currency = 'USD'
      height = '20'
      width = '27'
      depth = '0'
      unitofmeasure = 'CM'
      quantity = '107'
       ) TO lt_detail.

LV_IT_UUID = cl_system_uuid=>create_uuid_x16_static( ).
      APPEND VALUE ztso_it_1967(
      item_uuid = LV_IT_UUID
      item_ID = '2000002'
      sales_uuid = LV_HD_UUID
      name = 'iPhone 16'
      description = 'A flashy phone'
      releaseddate = '20240915'
      discontinueddate = '20290315'
      price = '1250'
      currency = 'USD'
      height = '10'
      width = '7'
      depth = '0'
      unitofmeasure = 'CM'
      quantity = '998'
       ) TO lt_detail.


    CATCH cx_uuid_error.
      "handle exception
      return.
  ENDTRY.

  DELETE FROM ztso_hd_1967.
  DELETE FROM ztso_it_1967.
  INSERT ztso_hd_1967 FROM TABLE @lt_header.
  INSERT ztso_it_1967 FROM TABLE @lt_detail.


  if sy-subrc = 0.
      out->write( 'Successfully added DATA' ).
  endif.

  ENDMETHOD.
ENDCLASS.
