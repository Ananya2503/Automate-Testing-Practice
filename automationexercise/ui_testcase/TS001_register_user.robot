*** Settings ***
Resource     ../resource/all_resource_ui.robot
Suite Setup  Open Browser and Go to Automation Exercise Page

*** Test Cases ***
TC001 :: Register User
    Click Signup / Login Menu
    Fill Signup Information
    Click Signup Button
    Validate Enter Account Information is Visible
    Fill Account Information Data
    Click Checkbox    Sign up for our newsletter!
    Click Checkbox    Receive special offers from our partners!
    Fill Address Information Data
    Click Create Account Button
    Validate Create Account Success
    Click Continue Button
    Validate Logged in as Robot_ทดสอบ
    Click Delete Account
    Validate Account Delete Success

*** Keywords ***
Fill Signup Information
    Type Text    //input[@data-qa="signup-name"]    ${NAME}    delay=${DELAY}
    Type Text    //input[@data-qa="signup-email"]   ${EMAIL}   delay=${DELAY}

Click Signup Button
    Click    //button[@data-qa="signup-button"]

Validate Enter Account Information is Visible
    Validate Element Visible    //div[@class="login-form"]//b[text()="Enter Account Information"]

Fill Account Information Data
    Click Radio Button    Mrs.
    Validate Text    //input[@id="name"]    ${NAME}
    Validate Text    //input[@id="email"]   ${EMAIL}
    Validate Element Disable    //input[@id="email"]
    Type Text    //input[@id="password"]    ${PASSWORD}    delay=${DELAY}
    Select Dropdown    //select[@id="days"]    25
    Select Dropdown    //select[@id="months"]    March
    Select Dropdown    //select[@id="years"]    2000

Fill Address Information Data
    Type Text    //input[@id="first_name"]    ${NAME}_Firstname    delay=${DELAY}
    Type Text    //input[@id="last_name"]    ${NAME}_Lastname    delay=${DELAY}
    Type Text    //input[@id="company"]    ${NAME}_Company    delay=${DELAY}
    Type Text    //input[@id="address1"]    ${NAME}_address1    delay=${DELAY}
    Type Text    //input[@id="address2"]    ${NAME}_address2    delay=${DELAY}
    Select Dropdown    //select[@id="country"]    Canada
    Type Text    //input[@id="state"]    ${NAME}_State    delay=${DELAY}
    Type Text    //input[@id="city"]    ${NAME}_City    delay=${DELAY}
    Type Text    //input[@id="zipcode"]    10510    delay=${DELAY}
    Type Text    //input[@id="mobile_number"]    0987654321    delay=${DELAY}

Click Create Account Button
    Click    //button[@data-qa="create-account"]

Validate Create Account Success
    Validate Element Visible    //h2[@data-qa="account-created"]//b[text()="Account Created!"]
    Validate Element Visible    //p[text()="Congratulations! Your new account has been successfully created!"]
    Validate Element Visible    //p[text()="You can now take advantage of member privileges to enhance your online shopping experience with us."]

Click Continue Button
    Click    //a[@data-qa="continue-button"]

Validate Logged in as Robot_ทดสอบ
    Validate Element Visible    //a[contains(.,"Logged in as ${NAME}")]

Validate Account Delete Success
    Validate Element Visible    //h2[@data-qa="account-deleted"]//b[text()="Account Deleted!"]
    Validate Element Visible    //p[text()="Your account has been permanently deleted!"]
    Validate Element Visible    //p[text()="You can create new account to take advantage of member privileges to enhance your online shopping experience with us."]
