*** Settings ***
Documentation    URLs, Logins, Logouts, SignIns and SignOuts
Library    SeleniumLibrary

*** Variables ***
${FORM_URL}       https://elisa.fi/

*** Keywords ***
Homepage should be visible
    [Arguments]    ${BROWSER}
    open browser    ${FORM_URL}    ${BROWSER}
    maximize browser window
    Accept all cookies
    element should be visible    id:Tuotteet_ja_palvelut
    capture page screenshot    selenium-screenshot-{index}.png

Click on English language option
    wait until element is visible    id:langaugeSelector_en    timeout=10
    click element                    id:langaugeSelector_en
    page should contain    Instructions in English    loglevel=WARN
    capture page screenshot    selenium-screenshot-{index}.png

Click on the 'Elisa Corporation' header
    wait until element is visible    //div[@class='react-navi-ea-mainheader-uppermenu']//a[contains(text(),'Elisa Corporation')]    timeout=10
    click element    //div[@class='react-navi-ea-mainheader-uppermenu']//a[contains(text(),'Elisa Corporation')]
    Accept all cookies
    element should be visible    id:Careers
    capture page screenshot    selenium-screenshot-{index}.png

Click on the Career menu
    click element    id:Careers
    wait until element is visible    //a[contains(@href,'openjobs')]    timeout=10
    click element    //a[contains(@href,'openjobs')]

Accept all cookies
    sleep    2s
    click button    id:onetrust-accept-btn-handler
    sleep    2s

Close the browser
    close browser