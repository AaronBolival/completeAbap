*&---------------------------------------------------------------------*
*& Report ZFM_ALVGRID_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFM_ALVGRID_ABOLIVAL.


TYPES: BEGIN OF ts_scarr,
        mandt    TYPE scarr-mandt,
        carrid   TYPE scarr-carrid,
        carrname TYPE scarr-carrname,
        currcode TYPE scarr-currcode,
        url      TYPE scarr-url,
      END OF ts_scarr.

DATA(it_fcat) = VALUE slis_t_fieldcat_alv(
                                                  ( fieldname = 'mandt' seltext_m = 'Client' ) " fieldname = table field name , seltext_m = field text or label
                                                  ( fieldname = 'carrid' seltext_m = 'Carrier ID' )
                                                  ( fieldname = 'carrname' seltext_m = 'Carrname' )
                                                  ( fieldname = 'currcode' seltext_m = 'Currcode' )
                                                  ( fieldname = 'url' seltext_m = 'Url' )
                                                ).

SELECT * FROM scarr INTO TABLE @DATA(internal_tbl).


  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
   EXPORTING
*     I_INTERFACE_CHECK                 = ' '
*     I_BYPASSING_BUFFER                = ' '
*     I_BUFFER_ACTIVE                   = ' '
*     I_CALLBACK_PROGRAM                = ' '
*     I_CALLBACK_PF_STATUS_SET          = ' '
*     I_CALLBACK_USER_COMMAND           = ' '
*     I_CALLBACK_TOP_OF_PAGE            = ' '
*     I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*     I_CALLBACK_HTML_END_OF_LIST       = ' '
*     I_STRUCTURE_NAME                  =
*     I_BACKGROUND_ID                   = ' '
*     I_GRID_TITLE                      =
*     I_GRID_SETTINGS                   =
*     IS_LAYOUT                         =
     IT_FIELDCAT                       = it_fcat
*     IT_EXCLUDING                      =
*     IT_SPECIAL_GROUPS                 =
*     IT_SORT                           =
*     IT_FILTER                         =
*     IS_SEL_HIDE                       =
*     I_DEFAULT                         = 'X'
*     I_SAVE                            = ' '
*     IS_VARIANT                        =
*     IT_EVENTS                         =
*     IT_EVENT_EXIT                     =
*     IS_PRINT                          =
*     IS_REPREP_ID                      =
*     I_SCREEN_START_COLUMN             = 0
*     I_SCREEN_START_LINE               = 0
*     I_SCREEN_END_COLUMN               = 0
*     I_SCREEN_END_LINE                 = 0
*     I_HTML_HEIGHT_TOP                 = 0
*     I_HTML_HEIGHT_END                 = 0
*     IT_ALV_GRAPHICS                   =
*     IT_HYPERLINK                      =
*     IT_ADD_FIELDCAT                   =
*     IT_EXCEPT_QINFO                   =
*     IR_SALV_FULLSCREEN_ADAPTER        =
*     O_PREVIOUS_SRAL_HANDLER           =
*   IMPORTING
*     E_EXIT_CAUSED_BY_CALLER           =
*     ES_EXIT_CAUSED_BY_USER            =
    TABLES
      t_outtab                          = internal_tbl
*   EXCEPTIONS
*     PROGRAM_ERROR                     = 1
*     OTHERS                            = 2
            .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
