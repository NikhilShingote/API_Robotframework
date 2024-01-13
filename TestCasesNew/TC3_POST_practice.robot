*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_url}   http://restapi.demoqa.com/customer


*** Test Cases ***
My_Pracrice_Test_case
    Create Session    Mysession    ${base_url}
    ${body}     Create Dictionary   firstname=Nikhil    lastname=Shingote     username=Neo     password=123jbha
    ${header}   Create Dictionary   Content-Type=application/json
    ${response}     Post Request    Mysession    /register      data=${body}    headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    #Validations
    ${status_code}=     Convert To String    ${response.status_code}
    Should Be Equal     ${status_code}    201

    ${res_body}=    Convert To String     ${response.content}
    Should Contain    ${res_body}    OPERATION_SUCCESS