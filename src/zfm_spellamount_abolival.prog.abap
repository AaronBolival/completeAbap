*&---------------------------------------------------------------------*
*& Report ZFM_SPELLAMOUNT_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFM_SPELLAMOUNT_ABOLIVAL.

DATA results LIKE SPELL.
DATA(amount) = '502,156.00'.

CALL FUNCTION 'SPELL_AMOUNT'
 EXPORTING
   AMOUNT          = amount
   CURRENCY        = 'PHP'
*   FILLER          = ' '
   LANGUAGE        = SY-LANGU
 IMPORTING
   IN_WORDS        = results
* EXCEPTIONS
*   NOT_FOUND       = 1
*   TOO_LARGE       = 2
*   OTHERS          = 3
          .
write: results-word.
*cl_demo_output=>display( results ).
