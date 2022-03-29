*&---------------------------------------------------------------------*
*& Report ZABAP_UI5_AJ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZABAP_UI5_AJ.


DATA(mandt) = sy-mandt.
DATA(byuname) = sy-uname.
DATA id TYPE zabap_ui5_aj-id.


PARAMETERS:
        header      TYPE zabap_ui5_aj-header OBLIGATORY,
        descr       TYPE zabap_ui5_aj-description,
        giturl      TYPE zabap_ui5_aj-giturl,
        docsurl     TYPE zabap_ui5_aj-docsurl.


DATA: it TYPE STANDARD TABLE OF ZABAP_UI5_AJ,
      wa LIKE LINE OF it.



SELECT * FROM ZABAP_UI5_AJ INTO TABLE @it.
SORT it DESCENDING BY id.



 READ TABLE it INTO wa INDEX 1.
 id = wa-id + 1.


 INSERT ZABAP_UI5_AJ FROM @( VALUE #( mandt = mandt id = id header = header description = descr giturl = giturl docsurl = docsurl byuname = byuname ) ).
  WRITE: / 'Client: ', mandt,
         / 'User: ', byuname,
         / 'ID: ', id,
         / 'header: ', header,
         / 'description: ', descr,
         / 'giturl: ' ,giturl,
         / 'docsurl: ', docsurl.
  MESSAGE 'Insert Success' TYPE 'S'.

*SELECT * FROM ZABAP_UI5_AJ INTO  wa.
*IF wa-id = id.
** MESSAGE 'errrrr' TYPE 'e'.
*  write: sy-tabix.
*ELSE.
*  INSERT ZABAP_UI5_AJ FROM @( VALUE #( mandt = mandt id = id header = header description = descr giturl = giturl docsurl = docsurl byuname = byuname ) ).
*  WRITE: / 'Client: ', mandt,
*         / 'User: ', byuname,
*         / 'ID: ', id,
*         / 'header: ', header,
*         / 'description: ', descr,
*         / 'giturl: ' ,giturl,
*         / 'docsurl: ', docsurl.
*  MESSAGE 'Insert Success' TYPE 'S'.
*ENDIF.
*
*ENDSELECT.
*  cl_demo_output=>display( wa ).
