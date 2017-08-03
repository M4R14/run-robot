*** Settings ***
Test Setup      Open Saha
Test Teardown   Close Browser
Resource        ../lib/chrome.robot

*** Variables ***
${url}      https://th9.in
${username}     marki
${password}     12345678

*** Test Cases ***
Login & Logout
    Input text      username    lukemooh
    Input text      password    1234
    Click Button    เข้าสู่ระบบ
    Alert Should Be Present     Username หรือ Password ผิดพลาด
    Login Saha
    Logout

For got password
    ${email_dummy}  asd@asd.com
    Click Link      ลืมรหัสผ่าน?
    Wait Until Page Contains    อีเมล:
    Input text      email    ${email_dummy}
    Click Button    ยืนยัน
    Wait Until Page Contains    ไม่พบ ${email_dummy} ในฐานข้อมูล

GET VALUE
    Login Saha
    Click Link     คลังสินค้า
    Sleep   3
    ${qty} =     GET Text   xpath=//table/tbody/tr[1]/td[4]
    Should Be Equal     ${qty}  0

*** Keywords ***
Open Saha
    ${chrome_options}=    Set Chrome Options
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go To    ${url}
    Wait Until Page Contains    เข้าสู่ระบบ สหกลการ

Login Saha
    Input text      username    ${username}
    input text      password    ${password}
    Click Button    เข้าสู่ระบบ
    Wait Until Page Contains    วิธีการใช้งานระบบ

Logout
    Click Link       ออกจากระบบ
    Wait Until Page Contains    เข้าสู่ระบบ สหกลการ
