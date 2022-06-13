*** Settings ***
Documentation    Suite description
Resource   ..${/}Resources${/}Resources.robot

*** Keywords ***


Login As User
    [Arguments]   ${Username}   ${password}
    Input Data    ${Username}     @{Username_TxtFild}
    Input Data    ${Password}   @{Password_TxtFild}
    Input Data    NA    @{Login_btn}
    sleep    5s
    Capture Page Screenshot

Log Out As User
    sleep    2s
    Click Element    //*[@id="navbarNavDropdown"]/ul[2]/li[2]/a/i
    Click Element    //*[@id="navbarNavDropdown"]/ul[2]/li[2]/div/a[3]
    Wait Until Element Is Visible    //div[@class="modal-content messageBox"]
    Click Element    //div[@class="modal-content messageBox"]//div[@class="modal-footer"]//button[contains(text(),'Yes')]
    Wait Until Element Is Visible    //*[@id="navbar-wrapper"]/nav/div[1]/a
    Capture Page Screenshot