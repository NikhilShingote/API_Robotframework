*** Settings ***
Library     JSONLibrary
Library     Collections
Library     os
Library    RequestsLibrary


*** Variables ***
${base_url}     https://restcountries.eu

*** Test Cases ***
JSONTestcase
    Create Session      mysession       ${base_url}
    ${response}=    GET On Session    mysession    /rest/v2/alpha/IN
    ${json_obj}=    to JSON ${response.content}

    #single data validation
    ${country_name}=    Get Value From Json     ${json_obj}     $.name
    Should Be Equal    ${country_name[0]}    India