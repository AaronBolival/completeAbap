*&---------------------------------------------------------------------*
*& Report zcl_bcs_abolival
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcl_bcs_abolival.

data: ob_bcs type ref to cl_bcs.
data: ob_bcs_doc type ref to cl_document_bcs.








start-of-selection.

create object ob_bcs_doc.

ob_bcs = cl_bcs=>create_persistent( ).

data it_text type soli_tab.
APPEND 'Internal Table Text' to it_text.

ob_bcs_doc = ob_bcs_doc->create_document(  "Create an Office Document
  EXPORTING
    i_type         = 'RAW'
    i_subject      =  'This is a subject'
*    i_length       =
*    i_language     = space
*    i_importance   =
*    i_sensitivity  =
    i_text         = it_text
*    i_hex          =
*    i_header       =
*    i_sender       =
*    iv_vsi_profile =
*  RECEIVING
*    result         =
  ).
*
  call method ob_bcs->set_document
    EXPORTING
      i_document = ob_bcs_doc
    .


 "create sender
 data: sender type ref to if_sender_bcs. " if user not appear as sender
 sender = cl_sapuser_bcs=>create( i_user = sy-uname ).
" if sender not appear
call method ob_bcs->set_sender
  EXPORTING
    i_sender = sender
  .

"create reciever
 data: recipient type ref to if_recipient_bcs.
 recipient = cl_cam_address_bcs=>create_internet_address(
               i_address_string = 'aaronbolival@gmail.com'
*               i_address_name   =
*               i_incl_sapuser   =
             ).
 "Recipient Attributes to send request
 call method ob_bcs->add_recipient
   EXPORTING
     i_recipient  = recipient
     i_express    = 'X'
*     i_copy       =
*     i_blind_copy =
*     i_no_forward =
   .

"Send the object

data sent_to_all type os_boolean.
call method ob_bcs->send
  EXPORTING
    i_with_error_screen = 'X'
  RECEIVING
    result              = sent_to_all
  .

  COMMIT WORK.

call method ob_bcs->edit
  EXPORTING
    i_starting_at_x   = 12
    i_starting_at_y   = 5
    i_ending_at_x     = 97
    i_ending_at_y     = 22
    i_hide_note       = 'X'
*    i_edit_subject    =
*    i_process_by_badi =
*    i_badi_fltval     =
  .
  COMMIT WORK.
