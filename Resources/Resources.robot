*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
#Library     Selenium2Library


Resource  ..${/}Config${/}GlobalVariables.robot
Resource  ..${/}Keywords${/}CommonKeywords.robot
Resource  ..${/}Test_Scripts${/}CommonTestScript.robot
Resource  ..${/}Identifiers${/}LoginPageIdentifiers.robot

