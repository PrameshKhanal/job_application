*** Settings ***
Documentation    New applicant should be able to select the correct role, complete the application form
...              and Submit the form, without any issues.
...              Test cases can be run using different command line options. For example:
...              "robot -d results --include "job description" --variable BROWSER:chrome .\tests\new_application.robot
Library          SeleniumLibrary
Library          String
Resource         ../Resources/SignIn.robot
Resource         ../Resources/role.robot
Resource         ../Resources/form.robot
Test Setup       SignIn.Homepage should be visible    ${BROWSER}
Test Teardown    SignIn.Close the browser

*** Variables ***


*** Test Cases ***
New applicant should be able to see the page in English
    [Documentation]    The page should be visible in English if 'en' is selected on the homepage
    [Tags]    english
    SignIn.Click on English language option

Careers header should be visible in Elisa Corporation page
    [Documentation]    The 'Career' menu should be visible on the top of the page
    [Tags]    careers
    SignIn.Click on English language option
    SignIn.Click on the 'Elisa Corporation' header

New applicant should be able to see the VACANCIES page
    [Documentation]    The user should be navigated to the vacancies page
    [Tags]    vacancies
    SignIn.Click on English language option
    SignIn.Click on the 'Elisa Corporation' header
    SignIn.Click on the Career menu

Correct job description should be displayed for the job title
    [Documentation]    Correct job description should be visible when the role is selected
    [Tags]    job description
    SignIn.Click on English language option
    SignIn.Click on the 'Elisa Corporation' header
    SignIn.Click on the Career menu
    role.Click on the desired role

New applicant should be able to fill the application form
    [Documentation]    Applicants should be able to complete the form and preview the application
    [Tags]    application
    SignIn.Click on English language option
    SignIn.Click on the 'Elisa Corporation' header
    SignIn.Click on the Career menu
    role.Click on the desired role
    form.Click on the 'Apply for Position' button
    form.Complete the form

New applicant should be able to submit the form successfully
    [Documentation]    Applicants should be able to submit the application
    [Tags]    submit
    SignIn.Click on English language option
    SignIn.Click on the 'Elisa Corporation' header
    SignIn.Click on the Career menu
    role.Click on the desired role
    form.Click on the 'Apply for Position' button
    form.Complete the form
    form.Submit the form