*** Settings ***
Library      SeleniumLibrary    

Suite Setup    Log       I am inside Suite Setup
Suite Teardown    Log    I am inside Suite Teardown
Test Setup    Log       I am inside Test Setup
Test Teardown    Log       I am inside Test Teardown

Default Tags    Sanity

*** Test Cases ***

MyFirstTest
    
    Log    Hello World..  
    
MySecondTest
    
    Log    Inside MySecondTest 
    
HRM
    [Tags]    Smoke
    Open Browser   ${URL}       headlesschrome
    Maximize Browser Window
    Set Browser Implicit Wait    5s
    Login
    Click Element    id=user-dropdown 
    Click Element    link=Logout    
    Sleep    5   
    Close Browser  
    LOG     This test is ran by %{username} on %{os} machine          #Environmental variable
    
    
*** Variables ***
${URL}    https://orangehrm-demo-6x.orangehrmlive.com/auth/login       #Scalar Variable
@{creds}     admin    admin123                                         #List Variable
&{logindta}     user=admin    pass=admin123                            #Dictionary Variable

*** Keywords ***

Login
    Input Text        id=txtUsername                  @{creds}[0]
    Input Password    id=txtPassword                   &{logindta}[pass]
    Click Button      id=btnLogin