  METHOD companhiaaereass_get_entityset.
    DATA: lr_carrid   TYPE RANGE OF scarr-carrid,
          lr_currcode TYPE RANGE OF scarr-currcode.

    LOOP AT it_filter_select_options ASSIGNING FIELD-SYMBOL(<fs_filter>).
      CASE <fs_filter>-property.
        WHEN 'Carrid'.
          lr_carrid = VALUE #( FOR ls_carrid IN <fs_filter>-select_options ( CORRESPONDING #( ls_carrid ) ) ).
        WHEN 'Currcode'.
          lr_currcode = VALUE #( FOR ls_currcode IN <fs_filter>-select_options ( CORRESPONDING #( ls_currcode ) ) ).
      ENDCASE.
    ENDLOOP.

    SELECT *
      FROM scarr
      INTO TABLE @et_entityset
     WHERE carrid IN @lr_carrid
       AND currcode IN @lr_currcode.

    CALL METHOD /iwbep/cl_mgw_data_util=>paging
      EXPORTING
        is_paging = is_paging
      CHANGING
        ct_data   = et_entityset.

    /iwbep/cl_mgw_data_util=>orderby(
      EXPORTING
        it_order = it_order " the sorting order
      CHANGING
        ct_data  = et_entityset
    ).

  ENDMETHOD.
