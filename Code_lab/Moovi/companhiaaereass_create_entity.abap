  METHOD companhiaaereass_create_entity.

    DATA ls_entity LIKE er_entity.

    TRY.
        "Ler os dados
        io_data_provider->read_entry_data(
        IMPORTING
          es_data = ls_entity
        ).

      CATCH /iwbep/cx_mgw_tech_exception. " mgw technical exception

    ENDTRY.

    INSERT scarr FROM ls_entity.
    IF sy-subrc NE 0.

      me->mo_context->get_message_container( )->add_message(
        iv_msg_type               = 'E'                 " Message Type
        iv_msg_id                 = '1'                 " Message Class
        iv_msg_number             = '1'                 " Message Number
        iv_msg_text               = 'Erro ao cadastrar' " Message Text
        ).

      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          message_container = me->mo_context->get_message_container( ).
    ELSE.
      er_entity = ls_entity.

    ENDIF.

  ENDMETHOD.
