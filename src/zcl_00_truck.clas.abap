CLASS zcl_00_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_vehicle
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_00_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = |Im a { make } { model } with { cargo_in_tons }t cargo capacity|.
  ENDMETHOD.
ENDCLASS.
