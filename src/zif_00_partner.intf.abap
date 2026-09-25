INTERFACE zif_00_partner
  PUBLIC.

  METHODS
    get_info
      RETURNING VALUE(info) TYPE string.

ENDINTERFACE.

" public interface Partner {
"    String getInfo();
" }
