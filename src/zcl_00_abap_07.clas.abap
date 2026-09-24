CLASS zcl_00_abap_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA travels TYPE TABLE OF /dmo/travel.

    TRY.
        travels = zcl_00_helper=>get_travels( '000001' ).
      CATCH zcx_abap_no_data.
        " handle exception
    ENDTRY.

    " Add
    travels = VALUE #( BASE travels
                       ( description = 'Kalifornien 2025' )
                       ( customer_id = '999999' begin_date = sy-datlo )
                       ( ) ).
    APPEND VALUE #( description = 'Kalifornien 2025' ) TO travels.

    " Read
    DATA(travel) = travels[ 2 ].
    IF line_exists( travels[ description = 'Kalifornien 2026' ] ).
      travel = travels[ description = 'Kalifornien 2026' ].
      out->write( travel ).
    ENDIF.

    out->write( lines( travels ) ).

    LOOP AT travels INTO travel WHERE customer_id = '000001'. " LOOP AT travels INTO DATA(travel).
      out->write( |{ sy-tabix }: { travel-description }| ).
    ENDLOOP.

    " Change
    travels[ description = 'Kalifornien 2025' ]-customer_id = '000044'.

    LOOP AT travels REFERENCE INTO DATA(travel2).
      travel2->client = '999'.
    ENDLOOP.

    LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).
      <travel>-client = '666'.
    ENDLOOP.

    " Sortieren
    SORT travels BY customer_id DESCENDING
                    description ASCENDING
                    end_date DESCENDING.

    " Löschen
    DELETE travels INDEX 3.

    DELETE travels WHERE customer_id IS INITIAL.
  ENDMETHOD.
ENDCLASS.
