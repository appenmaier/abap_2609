CLASS zcl_00_calculator DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES decimal TYPE p LENGTH 16 DECIMALS 2.

    CLASS-METHODS divide
      IMPORTING number_1      TYPE decimal
                number_2      TYPE decimal
      RETURNING VALUE(result) TYPE decimal
      RAISING   cx_abap_invalid_value.

    " public static double divide(double number1, double number2) throws InvalidValueException {
    "    if (number2 == 0) {
    "       throw new InvalidValueException();
    "    }
    "
    "    return number1 / number2;
    " }

    CLASS-METHODS calculate_percentage
      IMPORTING !percentage             TYPE zabap_decimal
                !base                   TYPE zabap_decimal
      RETURNING VALUE(percentage_value) TYPE zabap_decimal.

ENDCLASS.


CLASS zcl_00_calculator IMPLEMENTATION.
  METHOD divide.
    IF number_2 IS INITIAL.
      RAISE EXCEPTION NEW cx_abap_invalid_value( ).
    ENDIF.

*    result = number_1 / number_2.
    RETURN number_1 / number_2.
  ENDMETHOD.

  METHOD calculate_percentage.
    percentage_value = percentage * base / 100.
  ENDMETHOD.
ENDCLASS.
