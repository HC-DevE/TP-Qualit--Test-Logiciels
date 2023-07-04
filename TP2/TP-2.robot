*** Settings ***
Documentation       Employee Management Test Case

Library    SeleniumLibrary
Library    String

Resource    keyword-TP1.robot
Resource    variables-TP1.robot


*** Test Cases ***
Employee Management Test
    [Tags]    employeemanagement
    Given the visitor is connected by opening the browser with URL
    When the visitor logs in with username
    And the visitor goes to PIM Page
    And the visitor creates a new user
    And the visitor search the new user
    And the visitor modifies the new user
    And the visitor goes to PIM Page
    And the visitor search the new modified user
    And the visitor deletes the modified user
    Then the visitor logout
