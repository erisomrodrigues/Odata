<h1 align="center"> 🌐 Serviços Odata com SAP Gatway</h1>

> Desenvolvimentos Odata

| Projeto | Descrição | Repositório | Fonte |
| --- | --- | --- | --- |
| ZSEGW_SalesOrder | Navegar entre pedido de vendas e itens de pedidos de vendas | [GITHUB](/Code_lab/Sap_community) | [SAP Community](https://community.sap.com/t5/technology-blog-posts-by-sap/odata-service-development-with-sap-gateway-code-based-service-development/ba-p/13232029) |

## Tópicos

1. Method [GET_ENTITYSET](/Code_lab/soheaderset_get_entityset.abap) implementando as instruções [_FILTER,INLINECOUNT_](/Code_lab/filter.abap)
2. Method [_GET_ENTITY_](/Code_lab/SOHEADERSET_GET_ENTITY.ABAP) com [RAISE EXCEPTION](/Code_lab/SOHEADERSET_GET_ENTITY.ABAP) para passar mensagem de erro quando não encontrar dados no _`SELECT`_
3. Implementação do [_FILTER_](/Code_lab/Moovi/companhiaaereass_get_entityset.abap) com _CARRID_ e _CURRCODE_ no Method [_GET_ENTITYSET_](/Code_lab/Moovi/companhiaaereass_get_entityset.abap) pelo postman.
4. Implementação do [_SKIP_, _TOP_ e _ORDERBY_](/Code_lab/Moovi/companhiaaereass_get_entityset.abap) no method _GET_ENTITYSET_ com a classe estatica _/IWBEP/CL_MGW_DATA_UTIL_.
5. Inserindo dados na _SCARR_ com o [_CREATE_ENTITY_](Code_lab/Moovi/companhiaaereass_create_entity.abap) usando as classes _IO_DATA_PROVIDER_ para ler os dados e a classe _/IWBEP/CL_MGW_ABS_DATA_ para mensagem de erro.
6. Atualizando registros na _SCARR_ com method [_UPDATE_ENTITY_](Code_lab/Moovi/companhiaaereass_update_entity.abap) usando as classes io_data_provider para ler os dados do postman e _me->mo_context->get_message_container( )->add_message()_ para retornar mensagem de erro.
7. Eliminando registros da _SCARR_ com method [_DELETE_ENTITY_](Code_lab/Moovi/companhiaaereass_delete_entity.abap) usando as classes io_data_provider para ler os dados do postman e _me->mo_context->get_message_container( )->add_message()_ para retornar mensagem de erro.
8. Uso do _`GET_OSQL_WHERE_CAUSE`_ no _`SELECT`_ de forma dinâmica quando a instrução _`$FILTER`_ no Method [_GET_ENTITYSET_](Code_lab/Sap_community/salesorderset_get_entityset.abap).
9. _`GET_NAVIGATION_PATH`_ e _`GET_CONVERTED_SOURCE_KEYS`_ no method [_GET_ENTITYSET_](Code_lab/Sap_community/salesorderset_get_entityset.abap) para trazer dados das CDS _SEPM_I_SALESORDERITEM_E_ e _SEPM_I_SALESORDER_E_.
