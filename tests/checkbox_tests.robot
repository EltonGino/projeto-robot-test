*** Settings ***
Documentation    Testes para checkboxes do The Internet
Library          SeleniumLibrary

*** Test Cases ***
Verificar Estado Inicial
    [Documentation]    Verifica se o primeiro checkbox inicia desmarcado e o segundo marcado
    Open Browser    https://the-internet.herokuapp.com/checkboxes    chrome

    Checkbox Should Not Be Selected   xpath://form[@id='checkboxes']/input[1]
    Checkbox Should Be Selected       xpath://form[@id='checkboxes']/input[2]

    Close Browser

Marcar e Desmarcar Checkboxes
    [Documentation]    Marca o primeiro, desmarca o segundo e valida o estado
    Open Browser    https://the-internet.herokuapp.com/checkboxes    chrome

    # Marcar o primeiro
    Select Checkbox    xpath://form[@id='checkboxes']/input[1]
    Checkbox Should Be Selected   xpath://form[@id='checkboxes']/input[1]

    # Desmarcar o segundo
    Unselect Checkbox    xpath://form[@id='checkboxes']/input[2]    # ATENÇÃO ao espaço
    Checkbox Should Not Be Selected   xpath://form[@id='checkboxes']/input[2]

    Close Browser