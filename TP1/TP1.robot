*** Settings ***
Documentation    User Management (Selenium|Playwright) Robot Test
Library    SeleniumLibrary
Library    String
Resource    keyword-TP1.robot
Resource    variables-TP1.robot
Suite Setup    Open Browser    https://opensourcedemo.orangehrmlive.com/web/index.php/auth/login    Chrome
Suite Teardown    Close Browser

*** Test Cases ***
My TP Robot Test
    [Tags]  my_tp_selenium
    # Step 1 : login page
    Given I am on the login page
    # Step 2 : Se connecter
    When I log in with the generic account
    # Step 3 : Cliquer sur le menu Admin
    Then I click on the "Admin" page in the menu
    # Step 4 : Ajouter un utilisateur
    And I add a user
    # Step 5 : Je recherche l'utilisateur créé
    And I search for the previously created user
    # Step 6 : Je modifie les informations
    And I modify the information of the searched user
    # Step 6 bis : Je recherche l'utilisateur créé
    And I search for the previously created user
    # Step 7 : Supprimer les informations
    And I delete the modified user
    # Step 8 : Je me déconnecte du site
    And I log out