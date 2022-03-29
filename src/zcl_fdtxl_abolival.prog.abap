*&---------------------------------------------------------------------*
*& Report ZCL_FDTXL_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_FDTXL_ABOLIVAL.


PARAMETERS file TYPE FILATABLE.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR file.

CALL METHOD cl_gui_frontend_services=>file_open_dialog
*  EXPORTING
*    window_title            =
*    default_extension       =
*    default_filename        =
*    file_filter             =
*    with_encoding           =
*    initial_directory       =
*    multiselection          =
  CHANGING
    file_table              = file
    rc                      = 0
*    user_action             =
*    file_encoding           =
*  EXCEPTIONS
*    file_open_dialog_failed = 1
*    cntl_error              = 2
*    error_no_gui            = 3
*    not_supported_by_gui    = 4
*    others                  = 5
        .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.



*TRY.
CALL METHOD cl_fdt_xl_spreadsheet=>create_document
  EXPORTING
*    name               = IF_FDT_DOC_SPREADSHEET=>DEFAULT_FILENAME
    itab               =
*    columns            =
*    is_alv_document    = ABAP_FALSE
*    columns_aux        =
*    itab_aux_col_desc  =
    iv_call_type       =
*    it_dt_map_col      =
*    it_dt_map_col_desc =
*    iv_sheet_name      =
  RECEIVING
    xdocument          =
    .
*  CATCH cx_fdt_excel_core.
*ENDTRY.
