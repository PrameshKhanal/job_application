*** Settings ***
Variables    ../Libraries/variables.py
Library    String
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Click on the desired role
    ${lowercase}    convert to lower case    ${JOB_TITLE}
    ${newtitle}    replace string    ${lowercase}    ${SPACE}    -
    wait until element is visible    //a[contains(@href,'${newtitle}')]    timeout=10
    click element    //a[contains(@href,'lead-test-engineer')]
    element should contain    //*[@id="dsr1"]/div/div[1]/h1    ${JOB_TITLE}
    capture page screenshot    selenium-screenshot-{index}.png