  METHOD companhiaaereass_delete_entity.

    DATA: lv_carrid TYPE scarr-carrid.

    IF line_exists( it_key_tab[ name = 'Carrid' ] ).
      lv_carrid = it_key_tab[ name = 'Carrid' ]-value.
    ELSE.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception.
    ENDIF.

    DELETE FROM scarr WHERE carrid EQ lv_carrid.
    IF sy-subrc NE 0.
      me->mo_context->get_message_container( )->add_message(
        iv_msg_type               = 'E'                 " Message Type
        iv_msg_id                 = '3'                 " Message Class
        iv_msg_number             = '3'                 " Message Number
        iv_msg_text               = 'Erro ao Eliminar'  " Message Text
      ).

      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          message_container = me->mo_context->get_message_container( ).
    ENDIF.

  ENDMETHOD.
