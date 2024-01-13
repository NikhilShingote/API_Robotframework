*** Settings ***

Library     RequestsLibrary
Library    requests

*** Variables ***
${base_url}     http://restapi.adequateshop.com
${city}     Traveler

*** Test Cases ***
GET_Weatherinfo
    Create Session    mysession    ${base_url}
    ${response}=   Get Request    mysession    /api/${city}

    log to console  ${response.status_code}

    log to console  ${response.content}

    log to console  ${response.headers}