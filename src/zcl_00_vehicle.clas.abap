CLASS zcl_00_vehicle DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING make  TYPE string
                model TYPE string.

    METHODS accelerate FINAL
      IMPORTING value_in_kmh TYPE i.

    METHODS brake FINAL
      IMPORTING value_in_kmh TYPE i
      RAISING   zcx_00_invalid_value.

    METHODS to_string ABSTRACT
      RETURNING VALUE(string) TYPE string.

ENDCLASS.


CLASS zcl_00_vehicle IMPLEMENTATION.
  METHOD constructor.
    me->make  = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.

  METHOD accelerate.
    speed_in_kmh += value_in_kmh.
  ENDMETHOD.

  METHOD brake.
    IF speed_in_kmh - value_in_kmh < 0.
      RAISE EXCEPTION NEW zcx_00_invalid_value( value = value_in_kmh ).
    ENDIF.

    speed_in_kmh -= value_in_kmh.
  ENDMETHOD.
ENDCLASS.
