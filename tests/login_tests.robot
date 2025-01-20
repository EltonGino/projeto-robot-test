*** Settings ***
Documentation    Testes de login com Robot Framework + Selenium
Library          SeleniumLibrary
Resource         ../resources/variables.resource
Resource         ../resources/locators.resource

*** Test Cases ***
Login com Credenciais Válidas
    [Documentation]    Verifica se o usuário consegue fazer login com sucesso
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Input Text      ${USERNAME_FIELD}    ${VALID_USER}
    Input Text      ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${SUCCESS_MESSAGE}    5s
    Page Should Contain                 You logged into a secure area!
    Close Browser

Login com Credenciais Inválidas
    [Documentation]    Verifica se mensagem de erro aparece para dados inválidos
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Input Text      ${USERNAME_FIELD}    usuarioInvalido
    Input Text      ${PASSWORD_FIELD}    senhaInvalida
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${ERROR_MESSAGE}    5s
    Page Should Contain                 Your username is invalid!
    Close Browser

Login sem Preencher Campos
    [Documentation]    Verifica se aparece mensagem de erro ao submeter vazio
    Open Browser    ${LOGIN_PAGE}    ${BROWSER}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${ERROR_MESSAGE}    5s
    Page Should Contain                 Your username is invalid!
    Close Browser