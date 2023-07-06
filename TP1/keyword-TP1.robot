*** Settings ***
Library    SeleniumLibrary
Library    String

Resource    variables-TP1.robot

*** Keywords ***
I am on the login page
    Go To   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Wait Until Page Contains Element    //input[@name="username"]

I log in with the generic account
    Input Text    //input[@name="username"]    Admin
    Input Text    //input[@name="password"]    admin123
    Click Button    //button
    Wait Until Page Contains Element    //ul[@class="oxd-main-menu"]

I click on the "${page}" page in the menu
    Click Element    //ul[@class="oxd-main-menu"]//li[1]
    Wait Until Page Contains Element    //button[text()=" Add "]

I add a user
    ${USERNAME}    Generate Random String    10    [LETTERS]
    Set Test Variable    ${USERNAME}
    Click Button    //button[text()=" Add "]
    Wait Until Page Contains Element    //label[text()="User Role"]/following::div[1]
    Press Keys    //label[text()="User Role"]/following::div[1]    ARROW_DOWN    ARROW_DOWN    ENTER
    Press Keys    //label[text()="Status"]/following::div[1]    ARROW_DOWN    ENTER
    Press Keys    //label[text()="Employee Name"]/following::div[1]    ${EMPLOYEE_NAME}
    Sleep    2s
    Press Keys    //label[text()="Employee Name"]/following::div[1]    ARROW_DOWN    ENTER
    Input Text    //div[@class=""]//input[contains(@class, "oxd-input")]    ${USERNAME}
    Input Text    //label[text()="Password"]/following::input[1]    ${PASSWORD}
    Input Text    //label[text()="Confirm Password"]/following::input[1]    ${PASSWORD}
    Click Button    //button[@type="submit"]

I search for the previously created user
    Wait Until Page Contains Element    //button[text()=" Add "]
    Input Text    //label[text()="Username"]/following::input[1]    ${USERNAME}
    Press Keys    //label[text()="User Role"]/following::div[1]    ARROW_DOWN    ARROW_DOWN    ENTER
    Press Keys    //label[text()="Employee Name"]/following::div[1]    ${EMPLOYEE_NAME}
    Sleep    2s
    Press Keys    //label[text()="Employee Name"]/following::div[1]    ARROW_DOWN    ENTER
    Press Keys    //label[text()="Status"]/following::div[1]    ARROW_DOWN    ENTER
    Click Button    //button[@type="submit"]

I modify the information of the searched user
    Wait Until Page Contains Element    //button[contains(@class, "oxd-icon-button") and .//i[contains(@class, "bi-pencil-fill")]]
    Click Element    //button[contains(@class, "oxd-icon-button") and .//i[contains(@class, "bi-pencil-fill")]]
    Wait Until Page Contains Element    //button[@type="submit"]
    # Ici pour modifier les informations de l'utilisateur
    Click Button    //button[@type="submit"]

I delete the modified user
    Wait Until Page Contains Element    //button[contains(@class, "oxd-icon-button") and .//i[contains(@class, "bi-trash")]]
    Click Element    //button[contains(@class, "oxd-icon-button") and .//i[contains(@class, "bi-trash")]]
    Wait Until Page Contains Element    //button[text()=" Yes, Delete "]
    Click Button    //button[text()=" Yes, Delete "]

I log out
    Click Element    //li[contains(@class, "oxd-userdropdown")]
    Click Element    //li[contains(@class, "oxd-userdropdown")]//a[contains(@class, "oxd-userdropdown-link") and contains(text(), "Logout")]
    Wait Until Page Contains Element    //input[@name="username"]