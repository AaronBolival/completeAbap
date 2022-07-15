*&---------------------------------------------------------------------*
*& Report zcl_splitter_abolival
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcl_splitter_abolival.

include zcl_splitter_abolival_cls.

INITIALIZATION.
   data(lo_lclclass) = new lcl_class(  ).

START-OF-SELECTION.
lo_lclclass->get_data( ).
lo_lclclass->display( ).
