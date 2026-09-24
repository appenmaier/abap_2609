CLASS zcl_00_helper DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z00_travels
      RAISING   zcx_abap_no_data.
ENDCLASS.


CLASS zcl_00_helper IMPLEMENTATION.
  METHOD get_travel_with_customer.
    " SELECT <Spalte1>, <Spalte2>,...
    "   FROM <Tabelle/View>
    "   WHERE <Bedingung>
    "   ORDER BY <Spalte> ASC|DESC;

    " Option A (without Joins)
    SELECT SINGLE FROM /dmo/travel
      FIELDS *
      WHERE travel_id = @travel_id
      INTO @DATA(travel).
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'TRAVEL_ID'
                                            value = CONV #( travel_id ) ).
    ENDIF.

    SELECT SINGLE FROM /dmo/customer
      FIELDS *
      WHERE customer_id = @travel-customer_id
      INTO @DATA(customer).
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/CUSTOMER'
                                            field = 'CUSTOMER_ID'
                                            value = CONV #( travel-customer_id ) ).
    ENDIF.

    travel_with_customer = CORRESPONDING #( travel ).
    travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) customer ).

    " Option B (with Joins and CORRESPONDING)
    CLEAR travel_with_customer.

    SELECT SINGLE
      FROM /dmo/travel
             INNER JOIN
               /dmo/customer ON /dmo/travel~customer_id = /dmo/customer~customer_id
      FIELDS *
      WHERE travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'TRAVEL_ID'
                                            value = CONV #( travel_id ) ).
    ENDIF.

    " Option C (with Joins but without CORRESPONDING)
    CLEAR travel_with_customer.

    SELECT SINGLE
      FROM /dmo/travel
             INNER JOIN
               /dmo/customer ON /dmo/travel~customer_id = /dmo/customer~customer_id
      FIELDS /dmo/travel~travel_id,
             /dmo/travel~begin_date,
             /dmo/travel~end_date,
             /dmo/travel~description,
             /dmo/customer~customer_id,
             /dmo/customer~first_name,
             /dmo/customer~last_name,
             /dmo/customer~city,
             /dmo/customer~country_code
      WHERE travel_id = @travel_id
      INTO @travel_with_customer.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'TRAVEL_ID'
                                            value = CONV #( travel_id ) ).
    ENDIF.
  ENDMETHOD.

  METHOD get_travels.
    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'CUSTOMER_ID'
                                            value = CONV #( customer_id ) ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
