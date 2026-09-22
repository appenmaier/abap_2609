CLASS zcl_00_abap_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TYPES decimal TYPE p LENGTH 16 DECIMALS 2.

    DATA operand1 TYPE decimal.
    DATA operand2 TYPE decimal.
    DATA operator TYPE c LENGTH 1.
    DATA result   TYPE decimal.

    operand1 = 4.
    operand2 = 5.
    operator = '2'.

    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
      WHEN '-'.
        result = operand1 - operand2.
      WHEN '*'.
        result = operand1 * operand2.
      WHEN '/'.
        TRY.
            result = zcl_00_calculator=>divide( number_1 = operand1
                                                number_2 = operand2 ).
          CATCH cx_abap_invalid_value INTO DATA(x).
            out->write( x->get_text( ) ).
            RETURN.
            " try {
            "    result = Calculator.divide(operand1, operand2);
            " catch(InvalidValueException e) {
            "    System.out.println(e.getMessage());
            " }
        ENDTRY.
      WHEN '%'.
        result = zcl_00_calculator=>calculate_percentage( percentage = operand1
                                                          base       = operand2 ).
      WHEN '^'.
        TRY.
            result = zcl_abap_calculator=>calculate_power( base     = operand1
                                                           exponent = operand2 ).
          CATCH zcx_abap_value_too_high INTO DATA(x2).
            out->write( x2->get_text( ) ).
            RETURN.
        ENDTRY.
      WHEN '2'.
        TRY.
            result = zcl_abap_calculator=>calculate_power( base = operand1 ).
          CATCH zcx_abap_value_too_high.
        ENDTRY.
      WHEN OTHERS.
        out->write( 'invalid' ).
        RETURN.
    ENDCASE.
    out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).

*    out->write(
*        |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { SWITCH decimal( operator
*                                                                                                WHEN '+' THEN
*                                                                                                  operand1 + operand2
*                                                                                                WHEN '-' THEN
*                                                                                                  operand1 - operand2
*                                                                                                WHEN '*' THEN
*                                                                                                  operand1 * operand2
*                                                                                                WHEN '/' THEN
*                                                                                                  operand1 / operand2 ) NUMBER = USER } | ).
  ENDMETHOD.
ENDCLASS.
