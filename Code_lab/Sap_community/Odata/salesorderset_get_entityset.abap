  METHOD salesorderset_get_entityset.

    DATA: lv_osql_where_clause TYPE string,
          lv_top               TYPE i,
          lv_skip              TYPE i,
          lv_max_index         TYPE i,
          n                    TYPE i.

    lv_osql_where_clause = io_tech_request_context->get_osql_where_clause( ).
    lv_top               = io_tech_request_context->get_top( ).
    lv_skip              = io_tech_request_context->get_skip( ).

    lv_max_index = COND #( WHEN lv_top IS NOT INITIAL THEN lv_skip + lv_top ELSE space ).

    SELECT *
      FROM sepm_i_salesorder_e
      INTO CORRESPONDING FIELDS OF TABLE @et_entityset
        UP TO @lv_max_index ROWS
     WHERE (lv_osql_where_clause)
       AND lastchangeddatetime >= 1
       AND creationdatetime >= 1.

    IF lv_skip IS NOT INITIAL.
      DELETE et_entityset TO lv_skip.
    ENDIF.

    IF io_tech_request_context->has_inlinecount( ) = abap_true.
      SELECT COUNT(*)
        FROM sepm_i_salesorder_e
       WHERE (lv_osql_where_clause).
      es_response_context-inlinecount = sy-dbcnt.
    ELSE.
      CLEAR es_response_context-inlinecount.
    ENDIF.


  ENDMETHOD.
