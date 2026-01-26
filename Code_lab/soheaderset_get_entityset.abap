  METHOD soheaderset_get_entityset.
*  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
*    EXPORTING
*      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
*      method = 'SOHEADERSET_GET_ENTITYSET'.

*    DATA: lr_erdat TYPE RANGE OF vbak-erdat,
*          ls_erdat LIKE LINE OF lr_erdat.
*
*    DATA: ls_filter_select_options TYPE /iwbep/s_mgw_select_option,
*          lt_select_options        TYPE /iwbep/t_cod_select_options,
*          ls_select_options        TYPE /iwbep/s_cod_select_option.
*
*    READ TABLE it_filter_select_options INTO ls_filter_select_options WITH KEY property = 'Erdat'.
*    IF ls_filter_select_options-property IS NOT INITIAL.
*      lt_select_options[] = ls_filter_select_options-select_options[].
*
*      LOOP AT lt_select_options INTO ls_select_options.
*        ls_erdat-sign   = ls_select_options-sign.
*        ls_erdat-option = ls_select_options-option.
*        ls_erdat-low    = ls_select_options-low.
*        ls_erdat-high   = ls_select_options-high.
*        APPEND ls_erdat TO lr_erdat.
*        CLEAR: ls_select_options, ls_erdat.
*      ENDLOOP.
*    ENDIF.

    SELECT *
      UP TO 100 ROWS
      FROM vbak INTO CORRESPONDING FIELDS OF TABLE et_entityset.
*     WHERE erdat IN lr_erdat.

    /iwbep/cl_mgw_data_util=>filtering(
      EXPORTING
        it_select_options = it_filter_select_options
      CHANGING
        ct_data           = et_entityset ).


  ENDMETHOD.
