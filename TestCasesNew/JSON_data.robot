*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections


*** Test Cases ***
TestJSONData
    ${json_obj}=    Load Json From File    I:/JSON file/sample2.json
    
    ${name_value}=  Get Value From Json    ${json_obj}    $.firstName
    Should Be Equal    ${name_value[0]}    Joe
    
    ${Street_value}=    Get Value From Json    ${json_obj}    $.address.streetAddress
    Should Be Equal    ${Street_value[0]}    101