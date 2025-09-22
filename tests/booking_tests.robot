*** Settings ***
Library    RequestsLibrary
Resource   ../resources/booking_keywords.robot

*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com

*** Test Cases ***
[GET] Listar todas as reservas
    [Documentation]    Verifica se a API retorna lista de reservas válida
    [Tags]    get    smoke
    Criar Sessao Booker
    ${response}=    GET On Session    booker    /booking    expected_status=200
    Should Contain    ${response.headers['Content-Type']}    application/json
    ${bookings}=    Set Variable    ${response.json()}
    Should Be True    isinstance(${bookings}, list)
    Should Be True    len(${bookings}) > 0
    Log    Encontradas ${bookings.__len__()} reservas


[POST] Criar nova reserva
    Criar Sessao Booker
    ${payload}=    Criar Reserva Payload
    ${response}=    POST On Session    booker    /booking    json=${payload}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}
    Set Suite Variable    ${bookingid}    ${response.json()['bookingid']}

[PUT] Atualizar reserva existente
    Criar Sessao Booker
    ${token}=    Gerar Token
    ${payload}=    Criar Reserva Atualizada
    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${response}=    PUT On Session    booker    /booking/${bookingid}    json=${payload}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}

[DELETE] Excluir reserva
    Criar Sessao Booker
    ${token}=    Gerar Token
    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${response}=    DELETE On Session    booker    /booking/${bookingid}    headers=${headers}
    Should Be Equal As Integers    ${response.status_code}    201

[DELETE] Excluir reserva inexistente
    [Documentation]    Verifica se a API retorna 405 ao tentar excluir reserva que não existe
    [Tags]    delete    negative
    Criar Sessao Booker
    ${token}=    Gerar Token
    ${headers}=    Create Dictionary    Cookie=token=${token}
    ${response}=    DELETE On Session    booker    /booking/99999    headers=${headers}    expected_status=405
    Should Be Equal As Integers    ${response.status_code}    405
    Log    Tentativa de exclusão de reserva inexistente retornou 405 conforme esperado