1. Shopping cart functionality
    Add multiple products
    Remove products from the shopping cart
    Check the contents of the shopping cart
*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Add multiple products
    Open Browser    https://www.saucedemo.com/    Chrome
    Input Text    id=user-name    standard_user
    Input Password    id=password       secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep    3s
    Close Browser
  