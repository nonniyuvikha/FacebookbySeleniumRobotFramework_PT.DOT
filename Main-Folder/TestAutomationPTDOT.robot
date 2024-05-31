** Settings ***
Library         OperatingSystem
Library         SeleniumLibrary                 implicit_wait=2
Resource        ../Functions/Functions.robot
Test Teardown    Close All Browsers


*** Variables ***

*** Test Cases ***
LoginCase
    OpenWebBrowser
    Set Window Size                               2560    1920
    Element Should Be Visible                     //img[@alt="Facebook"]
    Element Should Be Visible                     //input[@placeholder="Email address or phone number"] 
    Element Should Be Visible                     //input[@placeholder="Password"] 
    Element Should Be Visible                     //button[@name="login"]
    Sleep                                         2s
    #negative case 1(empty username and pwd)
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Element Should Be Visible                     //div[@id="email_container"]
    Sleep                                         3s
    Element Should Be Visible                     (//div[contains(.,"Invalid username or password")])[8]
    #negative case 2(empty username)
    Wait Until Element Is Visible                 //input[@placeholder="Password"]                                timeout=30s
    Click Element                                 //input[@placeholder="Password"]
    Input Text                                    //input[@placeholder="Password"]                                ${Pwd1}                 
    Sleep                                         2s
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Element Should Be Visible                     (//div[contains(.,"Invalid username or password")])[8]
    Sleep                                         2s  
    #negative case 3 (invalid username and empty pwd)
    Wait Until Element Is Visible                 //input[@placeholder="Email address or phone number"]         timeout=30s
    Click Element                                 //input[@placeholder="Email address or phone number"] 
    Input Text                                    //input[@placeholder="Email address or phone number"]          ${UName1}                 
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Element Should Be Visible                     (//div[contains(.,"Invalid username or password")])[8]
    Sleep                                         2s
    #negative case 4 (invalid username and invalid pwd)
    Wait Until Element Is Visible                 //input[@placeholder="Email address or phone number"]         timeout=30s
    Click Element                                 //input[@placeholder="Email address or phone number"] 
    Input Text                                    //input[@placeholder="Email address or phone number"]          ${UName1}                 
    Wait Until Element Is Visible                 //input[@placeholder="Password"]                               timeout=30s
    Click Element                                 //input[@placeholder="Password"]
    Input Text                                    //input[@placeholder="Password"]                                ${Pwd1}                 
    Sleep                                         2s
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Element Should Be Visible                     (//div[contains(.,"Invalid username or password")])[8]
    Sleep                                         2s
    #negative case 6(valid username and wrong pwd)
    Wait Until Element Is Visible                 //input[@placeholder="Email address or phone number"]         timeout=30s
    Click Element                                 //input[@placeholder="Email address or phone number"] 
    Input Text                                    //input[@placeholder="Email address or phone number"]          ${UName}                 
    Wait Until Element Is Visible                 //input[@placeholder="Password"]                               timeout=30s
    Click Element                                 //input[@placeholder="Password"]
    Input Text                                    //input[@placeholder="Password"]                                ${Pwd1}                 
    Sleep                                         2s
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Element Should Be Visible                     (//div[contains(.,"The password that you've entered is incorrect.")])[9]
    Sleep                                         2s
    #PositifCase
    Wait Until Element Is Visible                 //input[@placeholder="Email address or phone number"]         timeout=30s
    Click Element                                 //input[@placeholder="Email address or phone number"] 
    Input Text                                    //input[@placeholder="Email address or phone number"]          ${UName}                 
    Wait Until Element Is Visible                 //input[@placeholder="Password"]                               timeout=30s
    Click Element                                 //input[@placeholder="Password"]
    Input Text                                    //input[@placeholder="Password"]                                ${Pwd}                 
    Sleep                                         2s
    Click Element                                 //button[@name="login"]
    Sleep                                         5s
    Element Should Not Be Visible                 (//div[contains(.,"Invalid username or password")])[8]
    Element Should Be Visible                     //div[@aria-label="Facebook"]
    Sleep                                         2s
    
