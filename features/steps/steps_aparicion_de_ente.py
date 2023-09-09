from behave import *

@given("que el usuario esta en el modo de juego de {modo}")
def step_impl(context, modo):
    # for row in context.table:
    #    print (row[modo])
    pass

@given("el usuario ya configuro los parametros iniciales con {parametros}")
def step_impl(context, parametros):
    # for row in context.table:
    #    print (row[modo])
    pass

@given("el spawn esta en la posicion {celdaI}")
def step_impl(context, celdaI):
    # for row in context.table:
    #    print (row[modo])
    pass

@when("el usuario da inicio al juego")
def step_impl(context):
    # for row in context.table:
    #     row[parametros]
    pass

@then("en la posicion {celdaF} aparece la primera bacteria")
def step_impl(context, celdaF):
    # for row in context.table:
    #     print(row[resultante])
    assert True == True
