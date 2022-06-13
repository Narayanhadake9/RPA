*** Settings ***
Documentation    Suite description
Resource   ..${/}Resources${/}Resources.robot
Suite Setup    Open Chrome Browser   ${App_URl}
Suite Teardown    Close All Browsers

*** Test Cases ***
TC001_UserLogin
    Login As User   ${Username}   ${Password}
    Log Out As User
