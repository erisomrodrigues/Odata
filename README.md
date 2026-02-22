# Odata
Desenvolvimentos Odata

1. Method [GET_ENTITYSET](/Code_lab/soheaderset_get_entityset.abap) implementando as system query options [_FILTER,INLINECOUNT_](/Code_lab/filter.abap)
2. Method GET_ENTITY com [RAISE EXCEPTION](/Code_lab/SOHEADERSET_GET_ENTITY.ABAP) para passar mensagem de erro quando não encontrar dados no _SELECT_
3. Implementação do [_FILTER_](/Code_lab/Moovi/companhiaaereass_get_entityset.abap) com _CARRID_ e _CURRCODE_ no Method _GET_ENTITYSET_ pelo postman.
4. Implementação do [_SKIP_, _TOP_ e _ORDERBY_](/Code_lab/Moovi/companhiaaereass_get_entityset.abap) no method _GET_ENTITYSET_ com a classe estatica _/IWBEP/CL_MGW_DATA_UTIL_.
5. Inserindo dados na _SCARR_ com o [_CREATE_ENTITY_](Code_lab/Moovi/companhiaaereass_create_entity.abap) usando as classes _IO_DATA_PROVIDER_ para ler os dados e a classe _/IWBEP/CL_MGW_ABS_DATA_ para mensagem de erro.
6. Atualizando registros na _SCARR_ com method _UPDATE_ENTITY_ usando as classes io_data_provider para ler os dados do postman e me->mo_context->get_message_container( )->add_message() para retornar mensagem de erro.
