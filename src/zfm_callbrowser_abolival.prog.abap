*&---------------------------------------------------------------------*
*& Report ZFM_CALLBROWSER_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFM_CALLBROWSER_ABOLIVAL.


CALL FUNCTION 'CALL_BROWSER'
 EXPORTING
   URL                          = 'https://azrap001.eastus2.cloudapp.azure.com:44303/sap/bc/bsp/sap/zz1_ajprog/index.html'
*   WINDOW_NAME                  = ' '
*   NEW_WINDOW                   = ' '
*   BROWSER_TYPE                 =
*   CONTEXTSTRING                =
* EXCEPTIONS
*   FRONTEND_NOT_SUPPORTED       = 1
*   FRONTEND_ERROR               = 2
*   PROG_NOT_FOUND               = 3
*   NO_BATCH                     = 4
*   UNSPECIFIED_ERROR            = 5
*   OTHERS                       = 6
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
