  METHOD salesorderitemse_get_entityset.

    DATA: lt_nav_path   TYPE /iwbep/t_mgw_tech_navi,
          ls_nav_path   TYPE /iwbep/S_mgw_tech_navi,
          lt_keys       TYPE /iwbep/t_mgw_tech_pairs,
          ls_keys       TYPE /iwbep/s_mgw_tech_pair,
          ls_so_key     TYPE zcl_zsegw_salesorder_mpc=>ts_salesorderitem-salesorder,
          ls_headerdata TYPE zcl_zsegw_salesorder_mpc=>ts_salesorderitem.

    DATA: lv_osql_where_clause TYPE string.

    lt_nav_path = io_tech_request_context->get_navigation_path( ).

    READ TABLE lt_nav_path INTO ls_nav_path WITH KEY nav_prop = 'TOITEMS'.
    IF sy-subrc = 0.
      CALL METHOD io_tech_request_context->get_converted_source_keys
        IMPORTING
          es_key_values = ls_headerdata. " Source Entity Key Values - converted

      ls_so_key = ls_headerdata-salesorder.

      SELECT *
        FROM sepm_i_salesorderitem_e
        INTO CORRESPONDING FIELDS OF TABLE @et_entityset
       WHERE salesorder = @ls_so_key.
    ELSE.
      lv_osql_where_clause = io_tech_request_context->get_osql_where_clause_convert( ).

      SELECT *
        FROM sepm_i_salesorderitem_e
        INTO CORRESPONDING FIELDS OF TABLE @et_entityset
       WHERE (lv_osql_where_clause).
    ENDIF.

  ENDMETHOD.
