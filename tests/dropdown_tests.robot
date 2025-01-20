*** Settings ***
Documentation    Testes para dropdown do The Internet
Library          SeleniumLibrary

*** Variables ***
${DROPDOWN_URL}   https://the-internet.herokuapp.com/dropdown
${DROPDOWN}       id:dropdown

*** Test Cases ***
Selecionar Opcoes Do Dropdown
    [Documentation]    Seleciona cada opção e verifica se foi selecionada corretamente
    Open Browser    ${DROPDOWN_URL}    chrome
    # Seleciona pelo texto visível
    Select From List By Label    ${DROPDOWN}    Option 1
    ${selected1}=    Get Selected List Label    ${DROPDOWN}
    Should Be Equal    ${selected1}    Option 1

    # Seleciona pelo valor
    Select From List By Value    ${DROPDOWN}    2
    ${selected2}=    Get Selected List Label    ${DROPDOWN}
    Should Be Equal    ${selected2}    Option 2

    Close Browser