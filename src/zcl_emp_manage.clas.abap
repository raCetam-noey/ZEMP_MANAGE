CLASS zcl_emp_manage DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EMP_MANAGE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_dep TYPE STANDARD TABLE OF zi_department.


    lt_DEP = VALUE #( ( Deptno = '001' Deptname = 'IES 본부' )
                                 ( Deptno = '002' Deptname = 'IKD 사업부' )
                                 ( Deptno = '003' Deptname = 'SCM 사업부' )
                                 ( Deptno = '004' Deptname = 'FCM 사업부' )
                                 ( Deptno = '005' Deptname = 'ITS 사업부' )
                                 ( Deptno = '006' Deptname = 'BDS 사업부' )
                           ).


    INSERT zdep_master FROM TABLE @lt_dep.
    SELECT * FROM zdep_master INTO TABLE @lt_dep.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!' ).

  ENDMETHOD.
ENDCLASS.
