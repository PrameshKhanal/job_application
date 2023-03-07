*** Settings ***
Documentation    Actions related to the Application form
Library          SeleniumLibrary
Variables        ../Libraries/variables.py
Resource         SignIn.robot

*** Variables ***
${APPLYBUTTON}    //div[@class='ds-grid__col--xs-4 ds-grid__col--m-4 ds-grid__col--l-6 ds-padding-top--2']//a[@class='ds-button ds-button--color-primary ds-button--size-m ds-margin-top-2 ds-margin-bottom--2'] [normalize-space()='apply for position']

*** Keywords ***
Click on the 'Apply for Position' button
    wait until element is visible    ${APPLYBUTTON}    timeout=10
    click element    ${APPLYBUTTON}
    capture page screenshot    selenium-screenshot-{index}.png

Complete the form
    capture page screenshot    selenium-screenshot-{index}.png
    scroll element into view    name:q[1][0]
    input text         name:q[1][0]      ${FIRSTNAME}         clear=True
    input text         name:q[2][0]      ${LASTNAME}          clear=True
    select checkbox    name:q[138][0][1]
    input text         name:q[6][0]      ${EMAIL}             clear=True
    input text         name:q[4][0]      ${PHONE}             clear=True
    input text         name:q[47][0]     ${COUNTRY}           clear=True
    input text         name:q[46][0]     ${LINKEDIN}          clear=True
    input text         name:q[51][0]     ${COVER}             clear=True
    click element      name:q[186][0]
    choose file        name:q[37][0]     ${PHOTOPATH}
    capture page screenshot    selenium-screenshot-{index}.png
    sleep    2s
    click element    //*[@id="cookie-wrapper"]/div[2]/div[2]/input
    sleep    2s
    select frame    id:iframe_38_0
    wait until element is visible    name:q[38][0]
    scroll element into view         name:q[38][0]
    choose file        name:q[38][0]     ${CVPATH}
    unselect frame
    input text         name:q[56][0]     ${WEBSITE}           clear=True
    scroll element into view    id:preview-button
    input text         name:q[175][0]    ${ADDQUESTION}       clear=True
    select checkbox    name:q[50][0][1]
    click element      //*[contains(text(), '30-39')]
    click element      //select[@name='q[159][0]']/option[text()='Nepal']
    capture page screenshot    selenium-screenshot-{index}.png
    click button       id:preview-button

Submit the form
    wait until element is visible    //input[@value='Send application']    timeout=10
    click element    //input[@value='Send application']
    page should contain image    //img[@src='https://elisa.rekrytointi.com/images/super-LAURA.png']