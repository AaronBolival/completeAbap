*&---------------------------------------------------------------------*
*& Report ZFM_TXTCONVXLS_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFM_TXTCONVXLS_ABOLIVAL.


TYPES:BEGIN OF structure,
  col TYPE string ,
  coll TYPE string,
  colll TYPE string,
END OF structure.

DATA it TYPE STANDARD TABLE OF structure.
DATA it_text TYPE TRUXS_T_TEXT_DATA.


PARAMETERS file TYPE IBIPPARMS-PATH.




AT SELECTION-SCREEN ON VALUE-REQUEST FOR file.
CALL FUNCTION 'F4_FILENAME'
* EXPORTING
*   PROGRAM_NAME        = SYST-CPROG
*   DYNPRO_NUMBER       = SYST-DYNNR
*   FIELD_NAME          = ' '
 IMPORTING
   FILE_NAME           = file
          .



CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
  EXPORTING
*   I_FIELD_SEPERATOR          =
*   I_LINE_HEADER              =
    i_tab_raw_data             = it_text
    i_filename                 = file
*   I_STEP                     = 1
  TABLES
    i_tab_converted_data       = it
 EXCEPTIONS
   CONVERSION_FAILED          = 1
   OTHERS                     = 2
          .
DELETE it INDEX 1.



" optional
DATA disp TYPE REF TO cl_salv_table.
DATA col TYPE REF TO CL_SALV_COLUMNS_TABLE.
TRY.
CALL METHOD cl_salv_table=>factory
  EXPORTING
    list_display   = IF_SALV_C_BOOL_SAP=>FALSE
*    r_container    =
*    container_name = ''
  IMPORTING
    r_salv_table   = disp
  CHANGING
    t_table        =  it
    .
  CATCH cx_salv_msg.
ENDTRY.





disp->display( ).
