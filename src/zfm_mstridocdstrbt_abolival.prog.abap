*&---------------------------------------------------------------------*
*& Report ZFM_MSTRIDOCDSTRBT_ABOLIVAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFM_MSTRIDOCDSTRBT_ABOLIVAL.

"idoc = ZAJDOC01
"segment = ZAJSEG01
"messagetype = ZAJ_MSGTEST1

DATA: it_scarr_idoc TYPE STANDARD TABLE OF ZAJSEG01,
      wa_scarr_idoc LIKE LINE OF it_scarr_idoc.


data: it_idoc_data type edidd_tt, " edidd_tt is a global internal table and the structure is edidd
*     wa_idoc_data like line of it_idoc_data.
      wa_idoc_data type edidd. "edidd is a global structure made by SAP


SELECT * FROM scarr INTO CORRESPONDING FIELDS OF  wa_scarr_idoc.

wa_idoc_data-segnam = 'ZAJSEG01'.
wa_idoc_data-sdata = wa_scarr_idoc.
append wa_idoc_data to it_idoc_data.

ENDSELECT.

data: lwa_master_idoc_control type edidc,
      lit_communication_idoc_control type standard table of edidc.

lwa_master_idoc_control-mestyp = 'ZAJ_MSGTEST1'. "message type
lwa_master_idoc_control-doctyp = 'ZAJDOC01'. "idoc type

CALL FUNCTION 'MASTER_IDOC_DISTRIBUTE' " ilalabas ang data
  EXPORTING
    master_idoc_control            = lwa_master_idoc_control
*    obj_type                       = ''
*    chnum                          = ''
  TABLES
    communication_idoc_control     = lit_communication_idoc_control
    master_idoc_data               = it_idoc_data
  EXCEPTIONS
    error_in_idoc_control          = 1
    error_writing_idoc_status      = 2
    error_in_idoc_data             = 3
    sending_logical_system_unknown = 4
    others                         = 5
  .
IF SY-SUBRC <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*   WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
ENDIF.
