*** Settings ***
Library    SeleniumLibrary
*** Keywords ***
Login with standard user
    Open Browser    https://www.saucedemo.com/    Firefox
    Input Text    locator=id=user-name    text=standard_user
    Input Password    id=password       secret_sauce
    Click Button    //*[@id="login-button"]

    Sleep    3s