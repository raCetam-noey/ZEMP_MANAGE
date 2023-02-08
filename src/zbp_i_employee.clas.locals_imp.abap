CLASS lcl_handler DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_instance_authorization FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST reference FOR employee RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST reference FOR employee RESULT result.

    METHODS setVacation FOR MODIFY
      IMPORTING keys FOR ACTION employee~setVacation RESULT result.
ENDCLASS.

CLASS lcl_handler IMPLEMENTATION.

  METHOD setVacation.
    MODIFY ENTITIES OF zi_employee IN LOCAL MODE
        ENTITY employee
        UPDATE
        FIELDS ( Onduty )
        WITH VALUE #( FOR key IN keys ( %tky = key-%tky Onduty = abap_true ) )

        FAILED failed
        REPORTED reported.

    READ ENTITIES OF zi_employee IN LOCAL MODE
    ENTITY employee
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(employee_data).
    result = VALUE #( FOR employee_rec IN employee_data
    ( %tky = employee_rec-%tky %param = employee_rec )
     ).

  ENDMETHOD.

  METHOD get_instance_authorization.

  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF zi_employee IN LOCAL MODE
           ENTITY employee
           FIELDS ( Onduty ) WITH CORRESPONDING #( keys )
           RESULT DATA(employee_activate)
           FAILED failed.

    result =
        VALUE #(
            FOR emp IN employee_activate
            LET statusval = COND #(  WHEN emp-Onduty = abap_true
                                      THEN if_abap_behv=>fc-o-disabled
                                      ELSE if_abap_behv=>fc-o-enabled )
                                      IN ( %tky = emp-%tky
                                      %action-setVacation = statusval
                                      )
               ).
  ENDMETHOD.

ENDCLASS.
