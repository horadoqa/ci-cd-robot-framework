*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    https://horadoqa.github.io/ci-cd-robot-framework/
${BROWSER}                Chrome
${locator_username}       //*[@id="username"]
${locator_password}       //*[@id="password"]
${locator_button}         //button[contains(text(),"Entrar")]
${error_dados_vazios}     //p[contains(text(),"E-mail e senha são obrigatórios!")]
${error_dados_errados}    //p[contains(text(),"E-mail ou senha inválidos!")]
${validar}                //h1[contains(text(),"Bem-vindo")]

*** Keywords ***
Abrir site
    Open Browser    ${URL}    ${BROWSER}   options=add_argument("--headless")

Campo Vazio
    Sleep    3s
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${error_dados_vazios}    5
    Element Should Be Visible    ${error_dados_vazios}
    Sleep    3s

E-mail Válido e Senha Inválida
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuario@example.com
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=abcd1234
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${error_dados_errados}    5
    Element Should Be Visible    ${error_dados_errados}
    Sleep    3s

E-mail Inválido e Senha Válida
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuarioexamplecom
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=1q2w3e4r
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${error_dados_errados}    5
    Element Should Be Visible    ${error_dados_errados}
    Sleep    3s

Ambos Inválidos
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuarioexample.com
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=abcd1234
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${error_dados_errados}    5
    Element Should Be Visible    ${error_dados_errados}
    Sleep    3s

Ambos Válidos
    Click Element    ${locator_username}
    Input Text    ${locator_username}    text=usuario@example.com
    Click Element    ${locator_password}
    Input Text    ${locator_password}    text=1q2w3e4r
    Click Element    ${locator_button}
    Sleep    3s
    Wait Until Element Is Visible    ${validar}    5
    Element Should Be Visible    ${validar}
    Sleep    20s

Fechar site
    Close Browser
