*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${base_url}     http://restapi.demoqa.com/customer


*** Test Cases ***
Post_request
    Create Session    mysession    ${base_url}
    ${body}     Create Dictionary   firstname=raj123    lastname=jdhndm     username=Bingo     password=shwhjs
    ${header}   Create Dictionary   Content-Type=application/json
    ${response}     Post Request    mysession    /register      data=${body}    headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #Validations
    ${status_code}=     convert to string   ${response.status_code}
    Should Be Equal    ${status_code}    201
    
    ${res_body}=    convert to string   ${response.content}
    Should Contain    ${res_body}    OPERATION_SUCCESS
