*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com

*** Keywords ***
Criar Sessao Booker
    Create Session    booker    ${BASE_URL}

Criar Reserva Payload
    ${dates}=    Create Dictionary    checkin=2025-09-01    checkout=2025-09-10
    ${payload}=    Create Dictionary
    ...    firstname=Emanuel
    ...    lastname=Felipe
    ...    totalprice=120
    ...    depositpaid=True
    ...    bookingdates=${dates}
    ...    additionalneeds=Café da manhã
    RETURN    ${payload}

Criar Reserva Atualizada
    ${dates}=    Create Dictionary    checkin=2025-10-01    checkout=2025-10-15
    ${payload}=    Create Dictionary
    ...    firstname=Emanuel
    ...    lastname=QA
    ...    totalprice=300
    ...    depositpaid=False
    ...    bookingdates=${dates}
    ...    additionalneeds=Almoço
    RETURN    ${payload}

Gerar Token
    ${auth}=    Create Dictionary    username=admin    password=password123
    ${response}=    POST On Session    booker    /auth    json=${auth}
    Should Be Equal As Integers    ${response.status_code}    200
    ${token}=    Set Variable    ${response.json()['token']}
    RETURN    ${token}

