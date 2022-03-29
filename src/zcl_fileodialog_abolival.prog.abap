*&---------------------------------------------------------------------*
*& Report ZCL_GUIUPLOAD_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZCL_FILEODIALOG_ABOLIVAL.

TYPE-POOLS: abap.


parameters p_file type string.
data table type filetable.
data retcode type i.
DATA r type string.

data encd type abap_encoding.

at selection-screen on value-request for p_file.

CALL METHOD cl_gui_frontend_services=>file_open_dialog
  EXPORTING
    window_title            = 'OpenFileeeeeeee'
*    default_extension       = '*.XLSX'
*    default_filename        = 'ekselfayl*' " example only sa file dialog box pag click mo ng folder ififilter nito yung mga file na exact sa ekselfayl or nag start sa ekselfayl but need lagayan ng *
    file_filter             = '(*.CSV, *.XLSX)|*.CSV; *.XLSX'
    with_encoding           = abap_true
*    initial_directory       = ' '
*    multiselection          = 'abap_true' "for multiple file selection
  CHANGING
    file_table              = table
    rc                      = retcode " number of file selected/return
*    user_action             =
    file_encoding           = encd
  EXCEPTIONS
    file_open_dialog_failed = 1
    cntl_error              = 2
    error_no_gui            = 3
    not_supported_by_gui    = 4
    others                  = 5
        .

READ TABLE table INTO p_file INDEX 1.

data res type string.
CALL METHOD cl_gui_frontend_services=>file_exist
  EXPORTING
    file                 = p_file
  receiving
    result               = res
*  EXCEPTIONS
*    cntl_error           = 1
*    error_no_gui         = 2
*    wrong_parameter      = 3
*    not_supported_by_gui = 4
*    others               = 5
        .


if res = 'X'.
  r = 'exist'.
else.
  r = 'not exist'.
endif.
