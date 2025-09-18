*** Settings ***
Library    RequestsLibrary
Resource   ../resources/booking_keywords.robot

*** Variables ***
${BASE_URL}    https://restful-booker.herokuapp.com

*** Test Cases ***
[GET] Listar todas as reservas
    Criar Sessao Booker
    ${response}=    GET On Session    booker    /booking
    Should Be Equal As Integers    ${response.status_code}    200
    Log    ${response.json()}

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


