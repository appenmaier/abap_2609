CLASS zcl_00_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    METHODS constructor
      IMPORTING id                   TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_int_tons
      RETURNING VALUE(total_weight_in_tons) TYPE i.

ENDCLASS.


CLASS zcl_00_airplane IMPLEMENTATION.
  METHOD constructor.
    IF id IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'id' ).
    ELSEIF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'plane_type' ).
    ELSEIF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'empty_weight_in_tons' ).
    ENDIF.

    me->id                   = id.
    me->plane_type           = plane_type.
    me->empty_weight_in_tons = empty_weight_in_tons.
  ENDMETHOD.

  METHOD get_total_weight_int_tons.
    total_weight_in_tons = empty_weight_in_tons * '1.1'.
  ENDMETHOD.
ENDCLASS.
