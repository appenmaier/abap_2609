CLASS zcl_00_travel_agency DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name     TYPE string READ-ONLY.
    DATA partners TYPE TABLE OF REF TO zif_00_partner.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_partner
      IMPORTING partner TYPE REF TO zif_00_partner.

    METHODS get_info
      RETURNING VALUE(info) TYPE string.
ENDCLASS.


CLASS zcl_00_travel_agency IMPLEMENTATION.
  METHOD add_partner.
    APPEND partner TO partners.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_info.
    LOOP AT partners INTO DATA(partner).
      info &&= |{ partner->get_info( ) } \n|.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
