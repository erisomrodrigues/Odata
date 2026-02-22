  METHOD companhiaaereass_update_entity.

    DATA: lv_carrid TYPE scarr-carrid,
          ls_entity LIKE er_entity.

    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = ls_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception. " mgw technical exception
    ENDTRY.

    IF line_exists( it_key_tab[ name = 'Carrid' ] ).
      lv_carrid = it_key_tab[ name = 'Carrid' ]-value.
    ENDIF.

    UPDATE scarr SET carrname = ls_entity-carrname
                     currcode = ls_entity-currcode
                     url      = ls_entity-url
               WHERE carrid   = lv_carrid.

    IF sy-subrc NE 0.
      me->mo_context->get_message_container( )->add_message(
        iv_msg_type               = 'E'                 " Message Type
        iv_msg_id                 = '2'                 " Message Class
        iv_msg_number             = '2'                 " Message Number
        iv_msg_text               = 'Erro ao Atualizar' " Message Text
      ).
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          message_container = me->mo_context->get_message_container( ).
    ELSE.
      er_entity = ls_entity.

    ENDIF.
  ENDMETHOD.
