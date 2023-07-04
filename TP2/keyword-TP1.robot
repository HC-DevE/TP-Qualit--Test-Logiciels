*** Settings ***
Library    SeleniumLibrary
Library    String

Resource    variables-TP1.robot

*** Keywords ***

the visitor is connected by opening the browser with URL
    Open Browser    ${BASE_URL}    ${BROWSER}
the visitor logs in with username
    ${EMPLOYEE_PASSWORD}    Generate Random String    10    [LETTERS][NUMBERS]
    Set Test Variable    ${EMPLOYEE_PASSWORD}
    # Sleep    3s
    Wait Until Page Contains Element    xpath://*[@id="app"]/div[1]
    Input Text    xpath://input[@name='username']    ${USERNAME}
    Input Password    xpath://input[@name='password']    ${PASSWORD}
    # Click Button    id=btnLogin
    Submit Form

the visitor goes to PIM Page
    Sleep    3s
    Click Link    //a[span[text()='PIM']]

the visitor creates a new user
    ${EMPLOYEE_USERNAME}    Generate Random String    10    [LETTERS]
    Set Test Variable    ${EMPLOYEE_USERNAME}
    Sleep    2s
    Click Button    //button[text()=' Add ']
    Sleep    2s
    Input Text
    ...    //input[contains(@name, 'firstName') and contains(@placeholder, 'First Name')]
    ...    ${FIRSTNAME}
    Input Text
    ...    //input[contains(@name, 'lastName') and contains(@placeholder, 'Last Name')]
    ...    ${LASTNAME}
    Click Element    //span[contains(@class, 'oxd-switch-input oxd-switch-input--active --label-right')]
    Sleep    2s
    Input Text
    ...    //input[contains(@class, 'oxd-input oxd-input--active') and @autocomplete='off']
    ...    ${EMPLOYEE_USERNAME}
    Input Password
    ...    //label[text()='Password']//following::input[1]
    ...    ${EMPLOYEE_PASSWORD}
    Input Password
    # ...    //input[contains(@class, 'oxd-input oxd-input--active') and @autocomplete='off' and @type='password']
    ...    //label[text()='Confirm Password']//following::input
    ...    ${EMPLOYEE_PASSWORD}
    # Click Button    //button[contains(@class, 'oxd-button') and contains(@class, 'oxd-button--secondary') and contains(text(), ' Save ')]
    Click Button    //button[text()=' Save ']
    Sleep    5s

the visitor search the new user
    the visitor goes to PIM Page
    Wait Until Page Contains Element    xpath://*[@id="app"]/div[1]
    Input Text
    # ...    //input[@placeholder='Type for hints...'][1]
    ...    //label[text()='Employee Name']//following::input[1]
    ...    ${EMPLOYEE_NAME}
    Click Button    //button[text()=' Search ']
    Sleep    3s
the visitor search the new modified user
    the visitor goes to PIM Page
    Wait Until Page Contains Element    xpath://*[@id="app"]/div[1]
    Input Text
    ...    //label[text()='Employee Name']//following::input[1]
    ...    ${EMPLOYEE_NAME}${LASTNAME}
    Click Button    //button[text()=' Search ']
    Sleep    3s

the visitor modifies the new user
    Sleep    2s
    Click Element    //i[contains(@class, 'oxd-icon bi-pencil-fill')][1]
    Sleep    2s
    Input Text
    ...    //input[@name='lastName']
    ...    ${LASTNAME}
    Click Button    //button[text()=' Save '][1]
    Sleep    3s

the visitor deletes the modified user
    Click Element    //i[contains(@class, 'oxd-icon bi-trash')][1]
    Page Should Contain Element    //p[text()='Are you Sure?']
    Click Element    //button[text()=' Yes, Delete ']
    Sleep    2s

the visitor logout
    Sleep    2s
    Click Element    //img[@alt="profile picture"]
    Sleep    1s
    Click Element    //li[a[text()='Logout']]
    Sleep    2s
    Page Should Contain Element    //h5[text()='Login']
