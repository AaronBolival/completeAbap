*&---------------------------------------------------------------------*
*& Report ZCL_CLSALVTABLE_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_CLSALVTABLE_ABOLIVAL.




data: ob_cl_salv_tbl type ref to cl_salv_table,
      ob_cl_salv_tblset type ref to cl_salv_display_settings,
      ob_cl_salv_layout type ref to cl_salv_layout,
      ob_cl_salv_func type ref to CL_SALV_FUNCTIONS_LIST,
      ob_cl_salv_col_tbl type ref to cl_salv_columns_table.

start-of-selection.

select * from scarr into table @data(it_scarr).

SORT it_scarr BY carrid.

TRY.
    call method cl_salv_table=>factory
      EXPORTING
        list_display   = if_salv_c_bool_sap=>true
*        r_container    =
*        container_name =
      IMPORTING
        r_salv_table   = ob_cl_salv_tbl
      CHANGING
        t_table        = it_scarr
      .


    CATCH cx_salv_msg.

ENDTRY.

    ob_cl_salv_func = ob_cl_salv_tbl->get_functions( ). "access the get_functions
    ob_cl_salv_func->set_all( abap_true ).


    ob_cl_salv_tblset = ob_cl_salv_tbl->get_display_settings(  ).
    ob_cl_salv_tblset->set_striped_pattern( abap_true ).


    ob_cl_salv_tbl->display( ).
