*** Settings ***
Library         Selenium2Library

*** Variables ***
${headless}     ''
@{chrome_arguments}    --disable-infobars   ${headless}    --disable-gpu

*** Keywords ***
Set Chrome Options
    [Documentation]    Set Chrome options for headless mode
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{chrome_arguments}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}