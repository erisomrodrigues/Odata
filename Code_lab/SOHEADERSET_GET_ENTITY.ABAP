  METHOD soheaderset_get_entity.
*  RAISE EXCEPTION TYPE /iwbep/cx_mgw_not_impl_exc
*    EXPORTING
*      textid = /iwbep/cx_mgw_not_impl_exc=>method_not_implemented
*      method = 'SOHEADERSET_GET_ENTITY'.

    DATA: ls_key_tab TYPE /iwbep/s_mgw_name_value_pair,
          lv_vbeln   TYPE vbeln.

    READ TABLE it_key_tab INTO ls_key_tab WITH KEY name = 'Vbeln'.
    IF ls_key_tab-value IS NOT INITIAL.
      lv_vbeln = ls_key_tab-value.

      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = lv_vbeln
        IMPORTING
          output = lv_vbeln.

      SELECT SINGLE *
        FROM vbak
        INTO CORRESPONDING FIELDS OF er_entity
       WHERE vbeln = lv_vbeln.

    ENDIF.

    IF er_entity IS INITIAL.
      DATA: lo_message_container TYPE REF TO /iwbep/if_message_container,
            iv_msg_text          TYPE bapi_msg.

      lo_message_container = mo_context->get_message_container( ).

      iv_msg_text = 'Sales order does not exist.'.

      CALL METHOD lo_message_container->add_message_text_only
        EXPORTING
          iv_msg_type = 'E'
          iv_msg_text = iv_msg_text
*         iv_error_category         =
*         iv_is_leading_message     = abap_true
*         iv_entity_type            =
*         it_key_tab  =
*         iv_add_to_response_header = abap_false
*         iv_message_target         =
*         it_message_target         =
*         iv_omit_target            = abap_false
*         iv_is_transition_message  = abap_false
*         iv_content_id             =
        .
    RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
*        textid                 =
*        previous               =
        message_container      = lo_message_container
*        http_status_code       =
*        http_header_parameters =
*        sap_note_id            =
*        msg_code               =
*        exception_category     =
*        entity_type            =
*        message                =
*        message_unlimited      =
*        filter_param           =
*        operation_no           =
    .
    ENDIF.

  ENDMETHOD.
