CLASS zcl_00_vehicle DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    METHODS constructor
      IMPORTING make  TYPE string
                model TYPE string.

    METHODS accelerate
      IMPORTING value_in_kmh TYPE i.

    METHODS brake
      IMPORTING value_in_kmh TYPE i.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.

ENDCLASS.


CLASS zcl_00_vehicle IMPLEMENTATION.
  METHOD constructor.
    me->make  = make.
    me->model = model.
  ENDMETHOD.

  METHOD accelerate.
    speed_in_kmh += value_in_kmh.
  ENDMETHOD.

  METHOD brake.
    speed_in_kmh -= value_in_kmh.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } ({ speed_in_kmh }km/h)|.
  ENDMETHOD.
ENDCLASS.
