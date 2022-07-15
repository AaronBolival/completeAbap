*&---------------------------------------------------------------------*
*& Include zcl_splitter_abolival_cls
*&---------------------------------------------------------------------*


CLASS lcl_class DEFINITION.
    PUBLIC SECTION.
        METHODS:
            get_data,
            display.


    PRIVATE SECTION.

        TYPES: BEGIN OF ts_vbak,
               vbeln TYPE vbak-vbeln,
               ernam TYPE vbak-ernam,
               END OF ts_vbak,

               BEGIN OF ts_vbap,
               vbeln TYPE vbap-vbeln,
               arktx TYPE vbap-arktx,
               END OF ts_vbap.

        DATA: lt_vbak TYPE STANDARD TABLE OF ts_vbak,
              lt_vbap TYPE STANDARD TABLE OF ts_vbap.

        DATA: lo_splitter_main TYPE REF TO cl_gui_splitter_container,
              lo_topguicon TYPE REF TO cl_gui_container,
              lo_botguicon TYPE REF TO cl_gui_container,
              lo_salv1 TYPE REF TO cl_salv_table,
              lo_salv2 TYPE REF TO cl_salv_table.


ENDCLASS.
CLASS lcl_class IMPLEMENTATION.

    METHOD get_data.
        SELECT vbeln,
               ernam
        FROM vbak
        INTO CORRESPONDING FIELDS OF TABLE @lt_vbak UP TO 10 ROWS.

        SELECT vbeln,
               arktx
        FROM vbap
        INTO CORRESPONDING FIELDS OF TABLE @lt_vbap UP TO 5 ROWS.

    ENDMETHOD.

    METHOD display.

        lo_splitter_main = NEW #( parent = cl_gui_container=>default_screen
                                 no_autodef_progid_dynnr = abap_true
                                 rows = 2
                                 columns = 1 ).

        lo_topguicon = lo_splitter_main->get_container(
                         row    = 1
                         column = 1
                       ).
        lo_botguicon = lo_splitter_main->get_container(
                         row    = 2
                         column = 1
                       ).

        cl_salv_table=>factory(
          EXPORTING
            r_container    = lo_topguicon
          IMPORTING
            r_salv_table   = lo_salv1
          CHANGING
            t_table        = lt_vbak
        ).
        lo_salv1->display(  ).

        cl_salv_table=>factory(
          EXPORTING
            r_container    = lo_botguicon
          IMPORTING
            r_salv_table   = lo_salv2
          CHANGING
            t_table        = lt_vbap
        ).
        lo_salv2->display(  ).


        write: space.
    ENDMETHOD.

ENDCLASS.
