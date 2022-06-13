*** Settings ***
Documentation    Suite description
Resource   ..${/}Resources${/}Resources.robot
Library  SeleniumLibrary



*** Keywords ***
Open Chrome Browser
    [Arguments]    ${url}
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Run Keyword If  '${ExecutionMode}'=='docker'   Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --window-size\=1920,1200
    #my_create_webdriver   Chrome  ${options}
    #options.addArguments("--headless", "--window-size=1920,1200");
    create webdriver  Chrome  chrome_options=${options}
    go to   ${url}
    Maximize Browser Window


Input Data
    [Arguments]		${fieldValue}	@{fieldDetails}
    Set Library Search Order  SeleniumLibrary  AppiumLibrary
    Log Many  ${fieldValue}	 @{fieldDetails}
    ${fieldType}=	Set variable	${fieldDetails}[1]
    ${fieldID}    Set Variable	${fieldDetails}[0]
    ${isElementPresent}  Run Keyword And Return Status  SeleniumLibrary.Wait Until Element Is Visible    ${fieldID}    40
    Run Keyword If  '${isElementPresent}'=='${false}'    Fail  ${fieldDetails}[2]  #append=${true}
    ${labeltext}=	  Run Keyword If    '${fieldType}'=='TextArea'  SeleniumLibrary.Input Text		${fieldID}	    ${fieldValue}
    ...     ELSE IF     '${fieldType}'=='TextBox' and '${fieldValue}'!='NA'    SeleniumLibrary.Input Text		${fieldID}	    ${fieldValue}
    ...		ELSE IF		  '${fieldType}'=='TextBox' and '${fieldValue}'=='NA'	    SeleniumLibrary.Click Element		${fieldID}
    ...		ELSE IF	       '${fieldType}'=='Button'	SeleniumLibrary.Click Element		${fieldID}
    ...		ELSE IF		  '${fieldType}'=='Link'		SeleniumLibrary.Click Link		${fieldID}
    ...		ELSE IF		  '${fieldType}'=='RadioButton'	SeleniumLibrary.Select Radio Button	    ${fieldID}	    ${fieldValue}
    ...	 	ELSE IF		  '${fieldType}'=='DropDown'	SeleniumLibrary.Select From List By Value	${fieldID}	${fieldValue}
    ...		ELSE IF		  '${fieldType}'=='Jquery'	SeleniumLibrary.Execute Javascript	$('select#${fieldID}').val('${fieldValue}').change();
    ...	    ELSE IF		  '${fieldType}'=='CheckBox'	SeleniumLibrary.Select Checkbox		${fieldID}
    ...		ELSE IF		'${fieldType}'=='Label' and '${fieldValue}'!='NA'	SeleniumLibrary.Select Window		${fieldID}
    ...		ELSE IF		'${fieldType}'=='Label' and '${fieldValue}'=='NA'	SeleniumLibrary.Get Text		${fieldID}
    ...		ELSE IF		'${fieldType}'=='JqueryFilter'	SeleniumLibrary.Execute Javascript	$('#${fieldID}').filter(function(){ return $.text([this]) === '${fieldValue}';}).trigger('click');
    ...		ELSE IF		  '${fieldType}'=='Element'	SeleniumLibrary.Click Element		${fieldID}
    ...     ELSE IF		'${fieldType}'=='JavaScript'	SeleniumLibrary.Execute Javascript		return ${fieldID}
    ...     ELSE IF		  '${fieldType}'=='Attribute' 	SeleniumLibrary.Get Element Attribute	${fieldID}  ${fieldValue}

    [Return]	${labeltext}
