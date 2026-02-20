1. Shopping cart functionality
    Add multiple products
    Remove products from the shopping cart
    Check the contents of the shopping cart
*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Add multiple products
    Login to SauceDemo
    Add items to cart
    Element Should Contain    //*[@id="shopping_cart_container"]/a/span    2
    Click Element    //*[@id="shopping_cart_container"]/a

    ${item_count}=    Get Element Count    //*[@class="cart_item"]
    Should Be Equal As Numbers    ${item_count}    2
    Remove items from cart
    
    Sleep    3s
    Close Browser

*** Keywords ***
Login to SauceDemo
    Open Browser    https://www.saucedemo.com/    Firefox
    Input Text    id=user-name    standard_user
    Input Password    id=password       secret_sauce
    Click Button    //*[@id="login-button"]
    
 
    Sleep    3s

*** Keywords ***
Add items to cart
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bike-light"]

*** Keywords ***
Remove items from cart
    Sleep    3s
    Click Button    //*[@id="remove-sauce-labs-backpack"]
    Click Button    //*[@id="remove-sauce-labs-bike-light"]