from behave import *

@given("que el usuario ingreso al modo de juego de {modo}")
def step_impl(context, modo):
    # for row in context.table:
    #    print (row[modo])
    pass

@when("el usuario configura los parametros iniciales con {parametros}")
def step_impl(context, parametros):
    # for row in context.table:
    #     row[parametros]
    pass

@then("el tablero resultante tendra {resultante}")
def step_impl(context, resultante):
    # for row in context.table:
    #     print(row[resultante])
    assert True == True




















# @given("we have flask working")
# def step_impl(context):
#     pass

# @when("we hit the root path")
# def step_impl(context):
#     context.page = context.client.get('/')
#     assert context.page
#     assert context.page.status_code == 200

# @then("we see the Hello World regard")
# def step_impl(context):
#     print(context.page.text)
#     assert context.page.text == "<p>Hello, World!</p>"
    