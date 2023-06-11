*** Settings ***
Resource    all_resource_ui.robot

*** Keywords ***
Open Browser and Go to Automation Exercise Page
    New Browser    browser=chromium    headless=${HEADLESS}
    New Context
    New Page    url=${URL}
    Validate Element Visible    //img[@alt="Website for automation practice"]

##### Click Menu #####
Click Signup / Login Menu
    Click    //a[@href="/login"]
    Validate Element Visible    //div[@class="login-form"]//h2[text()="Login to your account"]
    Validate Element Visible    //div[@class="signup-form"]//h2[text()="New User Signup!"]

Click Delete Account
    Click    //a[@href="/delete_account"]

##### Fill Inforrmation #####
Click Radio Button
    [Arguments]    ${LABEL}
    Click    //div[@class="radio-inline"]//label[contains(.,"${LABEL}")]

Click Checkbox
    [Arguments]    ${LABEL}
    Click    //div[@class="checkbox"]//label[text()="${LABEL}"]

Select Dropdown
    [Arguments]    ${LOCATOR}    ${LABEL}
    Select Options By    ${LOCATOR}    label    ${LABEL}

###### Validate Section #####
Validate Text
    [Arguments]    ${LOCATOR}    ${TEXT}
    Run Keyword And Continue On Failure    Get Text    ${LOCATOR}    ==    ${TEXT}

Validate Element Visible
    [Arguments]    ${LOCATOR}
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  2x  1s  Get Element States  ${LOCATOR}  contains  visible

Validate Element Disable
    [Arguments]    ${LOCATOR}
    Run Keyword And Continue On Failure  Wait Until Keyword Succeeds  2x  1s  Get Element States  ${LOCATOR}  contains  disabled
