*** Settings ***
Documentation    Suite description
Resource   ..${/}Resources${/}Resources.robot


*** Variables ***
@{Username_TxtFild}   xpath=//*[@id="txtUsrName"]   TextBox   Username is not visible on login page
@{Password_TxtFild}   xpath=//*[@id="txtPassword"]   TextBox   Password is not visible on login page
@{Login_btn}   xpath=//*[@id="btnLogin"]   Button   Login button is not visible on login page