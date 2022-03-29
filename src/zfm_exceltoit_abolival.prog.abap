*&---------------------------------------------------------------------*
*& Report ZFM_EXCELTOIT_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFM_EXCELTOIT_ABOLIVAL.



parameters file TYPE IBIPPARMS-PATH.
data it TYPE STANDARD TABLE OF alsmex_tabline .

TYPES: BEGIN OF ts_excel,
  col TYPE ALSMEX_TABLINE-value,
  coll TYPE ALSMEX_TABLINE-value,
  colll TYPE ALSMEX_TABLINE-value,
END OF ts_excel.

DATA it2 TYPE STANDARD TABLE OF ts_excel.
DATA wa2 TYPE  ts_excel.
DATA it3 TYPE STANDARD TABLE OF ts_excel.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR file.
CALL FUNCTION 'F4_FILENAME'
* EXPORTING
*   PROGRAM_NAME        = SYST-CPROG
*   DYNPRO_NUMBER       = SYST-DYNNR
*   FIELD_NAME          = ' '
 IMPORTING
   FILE_NAME           = file.




CALL FUNCTION 'ALSM_EXCEL_TO_INTERNAL_TABLE'
  EXPORTING
    filename                      = file
    i_begin_col                   = 1
    i_begin_row                   = 2
    i_end_col                     = 3
    i_end_row                     = 3
  TABLES
    intern                        = it
          .

FIELD-SYMBOLS <fs>.
ASSIGN COMPONENT sy-index OF STRUCTURE it2 TO <fs>.
BREAK-POINT.


loop at it into data(wa).
  at new row.
    append wa-value to it2.
  endat.
endloop.

*  LOOP AT it_excel INTO wa_excel.
*    AT NEW ROW.
*      APPEND INITIAL LINE TO it_data ASSIGNING <fs_data>.
*      gv_com = 1.
*    ENDAT.
*
*    ASSIGN COMPONENT gv_com OF STRUCTURE <fs_data> TO <fs>.
*    <fs> = wa_excel-VALUE.
*    gv_com = gv_com + 1.
