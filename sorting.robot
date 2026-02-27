*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    loginkeywords.robot

*** Test Cases ***
Sort products Z to A
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[4]
    Get All Products Names
    Verify Z to A Sorting    ${product_names}
    

*** Keywords ***
Get All Products Names
    ${products}=    Create List
    ${product_elements}=    Get WebElements    class:inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN     @{products}

    Verify Z to A Sorting
    [Arguments]    @{product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${index}    IN RANGE   0    ${length}-1
        ${current}=    Get From List    ${product_names}    ${index}
        ${next}=    Get From List    ${product_names}    ${index + 1}
        Should Be True    '${current}' >= '${next}'    Sorting is not Z to A at index ${index}

    END