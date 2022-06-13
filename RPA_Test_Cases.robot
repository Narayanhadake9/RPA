*** Settings ***
Library           Selenium2Library
Library           ScreenCapLibrary

*** Variables ***
${URL}            http://192.168.1.115:10054/#
${Username}       25480
${Password}       N@1234

*** Test Cases ***
TC01_Open URL in browsr
    Open Browser    ${URL}    gc
    Maximize Browser Window
    sleep    10s
    Capture Page Screenshot
    sleep    2s

TC02_Login User
    Comment    Input Text    //*[@id="txtUsrName"]    ${Username}
    Comment    Input Password    //*[@id="txtPassword"]    ${Password}
    Comment    Click Button    //*[@id="btnLogin"]
    Comment    sleep    5s
    Comment    Click Element    //*[@id="navbar-wrapper"]/nav/div[1]/a
    Comment    Capture Page Screenshot
    Login with Admin

TC03_Manage Employees
    Employee Management

TC04_Add Employee
    sleep    2s
    Click Element    //*[@id="btnAddNew"]/span[2]
    sleep    3s
    Capture Page Screenshot

TC05_fill add employee form
    Input Text    //*[@id="txtUserNumber"]    101010
    Input Text    //*[@id="txtName"]    NarayanTest
    Input Text    //*[@id="txtEmailId"]    narayan@gmail.com
    Input Text    //*[@id="txtMobileNum"]    9561358920
    Select From List By Value    //*[@id="ddlDesignation"]    1edc428a-0942-ec11-8576-d89ef3044f7e
    Input Text    //*[@id="txtDateOfJoining"]    13/12/2021

TC06_Search Employee
    Search employee

TC07_select id and create user
    sleep    2s
    Select Frame    //*[@id="myGridView"]/div[1]/table/tbody
    Click Element    //*[@id="btnMoveUsers"]
    Capture Page Screenshot

Configuration setting
    Click Element    //*[@id="profileDropDown"]/img
    Click Element    //*[@id="topHeader"]/ul[2]/li/div/a[1]/span
    sleep    1s
    Capture Page Screenshot
    Input Text    //*[@id="collapsOne"]/div[1]/div/div[1]/div/input    5
    Comment    Input Text    //*[@id="txtPasswordExpiryDays"]    5
    Comment    Input Text    //*[@id="collapsOne"]/div[1]/div/div[3]/div/div    3
    Capture Page Screenshot
    Click Button    //*[@id="collapsOne"]/div[2]/input[1]
    Capture Page Screenshot

Click on clear button
    Click Element    //*[@id="profileDropDown"]/img
    Click Element    //*[@id="topHeader"]/ul[2]/li/div/a[1]/span
    sleep    1s
    Input Text    //*[@id="collapsOne"]/div[1]/div/div[1]/div/input    ${ }
    Input Text    //*[@id="txtPasswordExpiryDays"]    ${ }
    Click Button    //*[@id="collapsOne"]/div[2]/input[1]

Logout and close browser
    Log out and close browser

TC13 EMS-AD-OQ-13
    Open Browser    ${URL}    gc
    Maximize Browser Window
    sleep    10s
    Capture Page Screenshot
    sleep    2s
    Login with Admin

TC19_EMS-AD-OQ-19 and 20
    Comment    Employee Management
    Comment    Search employee
    Comment    Click Element    //*[@id="myGridView"]/div[1]/table/tbody/tr
    Comment    Click Element    //*[@id="btnAuditTrail"]/span[2]

*** Keywords ***
Login with Admin
    Input Text    //*[@id="txtUsrName"]    ${Username}
    Input Password    //*[@id="txtPassword"]    ${Password}
    Click Button    //*[@id="btnLogin"]
    sleep    5s
    Click Element    //*[@id="navbar-wrapper"]/nav/div[1]/a
    Capture Page Screenshot

Log out and close browser
    sleep    2s
    Click Element    //*[@id="navbarNavDropdown"]/ul[2]/li[2]/a/i
    Click Element    //*[@id="navbarNavDropdown"]/ul[2]/li[2]/div/a[3]
    Wait Until Element Is Visible    //div[@class="modal-content messageBox"]
    Click Element    //div[@class="modal-content messageBox"]//div[@class="modal-footer"]//button[contains(text(),'Yes')]
    Comment    Wait Until Element Is Visible    div.modal-content.messageBox>div:nth-child(3)>button:nth-child(1)
    Comment    Execute Javascript    $('div.modal-content.messageBox>div:nth-child(3)>button:nth-child(1)').click();
    Wait Until Element Is Visible    //*[@id="navbar-wrapper"]/nav/div[1]/a

Employee Management
    Click Element    //*[@id="navbarAdmin"]/li[1]/a/span
    Click Element    //*[@id="navbarAdmin"]/li[1]/ul/li[1]/a/span
    sleep    2s
    Capture Page Screenshot

Search employee
    Input Text    //*[@id="txtsltdUser"]    25480
    Click Element    //*[@id="btnSearchUsers"]
    sleep    3s
    Capture Page Screenshot
