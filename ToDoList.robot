*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
${btn_add}        //i[contains(text(),'dd')]


*** Keywords ***
Open Website To Do List
    Open Browser    https://todolist.james.am/#/    browser=chrome
	Maximize Browser Window

Input Data
    [Arguments]        ${wording}
	Wait Until Element Is Visible    //input[@ng-model='newTodo']    timeout=10s  
    Press Keys    //input[@ng-model='newTodo']      ${wording}

Type Text In Search Box
    # Log    Typing text
    [Arguments]        ${wording}
	Wait Until Element Is Visible    //input[@ng-model='newTodo']    timeout=10s  
     Press Keys    //input[@ng-model='newTodo']      ${wording}
    # Log    Text entered

*** Test cases ***
TL01-TC-1 Add Data 
	Open Website To Do List
    # 1. Test
    Type Text In Search Box    Test
    Sleep    1s   
    Press Keys    None    ENTER
    # 2. ทดสอบ
    Type Text In Search Box    ทดสอบ
    Sleep    1s   
    Press Keys    None    ENTER
    # 3. 1234
    Type Text In Search Box    1234
    Sleep    1s   
    Press Keys    None    ENTER
    # 4. *@#$
    Type Text In Search Box    *@#$
    Sleep    1s   
    Press Keys    None    ENTER
    # 5. Test@ดด-85
    Type Text In Search Box    Test@ดด-85
    Sleep    1s   
    Press Keys    None    ENTER
    Sleep    2s


TL01-TC-3 Select & Select All
    Open Website To Do List
    # 1. Test
    Type Text In Search Box    Test  
    Press Keys    None    ENTER
    # 2. ทดสอบ
    Type Text In Search Box    ทดสอบ  
    Press Keys    None    ENTER
    # 3. 1234
    Type Text In Search Box    1234  
    Press Keys    None    ENTER
    # 4. *@#$
    Type Text In Search Box    *@#$
    Press Keys    None    ENTER
    # 5. Test@ดด-85
    Type Text In Search Box    Test@ดด-85
    Press Keys    None    ENTER

    # 1. Select Checkbox Test
    Select Checkbox    //input[@class='toggle ng-pristine ng-untouched ng-valid']
    Sleep    1s
    # 1.1 UnSelect Checkbox Test
    Unselect Checkbox    //input[@ng-change='toggleCompleted(todo)']
    Sleep    1s
    # 2. Select All
    Click Element    //label[@for='toggle-all']
    Sleep    1s
    # 2. UnSelect All
    Click Element    //label[@for='toggle-all']
    Sleep    1s
    Click Element    //label[@for='toggle-all']
    Sleep    2s


TL01-TC-4 Edit All, Active, Completed Tab
    Open Website To Do List
    # 1. Test
    Type Text In Search Box    Test  
    Press Keys    None    ENTER
    # 2. ทดสอบ
    Type Text In Search Box    ทดสอบ  
    Press Keys    None    ENTER
    # 3. 1234
    Type Text In Search Box    1234  
    Press Keys    None    ENTER
    # 4. *@#$
    Type Text In Search Box    *@#$
    Press Keys    None    ENTER
    # 5. Test@ดด-85
    Type Text In Search Box    Test@ดด-85
    Press Keys    None    ENTER

    # 1. Edit Test
    Double Click Element    //label[contains(text(),'Test')]
    Press Keys    None    1234
    Press Keys    None    ENTER
    Sleep    1s


TL01-TC-5 Delete & Delete All
    Open Website To Do List
    # 1. Test
    Type Text In Search Box    Test  
    Press Keys    None    ENTER
    # 2. ทดสอบ
    Type Text In Search Box    ทดสอบ  
    Press Keys    None    ENTER
    # 3. 1234
    Type Text In Search Box    1234  
    Press Keys    None    ENTER
    # 4. *@#$
    Type Text In Search Box    *@#$
    Press Keys    None    ENTER
    # 5. Test@ดด-85
    Type Text In Search Box    Test@ดด-85
    Press Keys    None    ENTER

    # 1. Delete Test
    Select Checkbox    //input[@class='toggle ng-pristine ng-untouched ng-valid']
    Sleep    1s
    Click Element    //button[@ng-click='removeTodo(todo)']
    # 2. Select All
    Click Element    //label[@for='toggle-all']
    Sleep    1s
    Click Element    //button[@ng-show="completedCount"]
    Sleep    2s


TL02-TC-1 Show data active tab
    Open Website To Do List
    # 1. Test
    Type Text In Search Box    Test  
    Press Keys    None    ENTER
    # 2. ทดสอบ
    Type Text In Search Box    ทดสอบ  
    Press Keys    None    ENTER
    # 3. 1234
    Type Text In Search Box    1234  
    Press Keys    None    ENTER
    # 4. *@#$
    Type Text In Search Box    *@#$
    Press Keys    None    ENTER
    # 5. Test@ดด-85
    Type Text In Search Box    Test@ดด-85
    Press Keys    None    ENTER

    # 1. Select one Show Active Tab
    Select Checkbox    //input[@class='toggle ng-pristine ng-untouched ng-valid']
    Sleep    1s
    Click Element    //a[contains(text(),'active')]
    Sleep    1s
    Click Element    //a[contains(text(),'All')]
    Sleep    1s
    # 1. Select All Show Active Tab & Completed
    Click Element    //label[@for='toggle-all']
    Sleep    1s
    Click Element    //a[contains(text(),'active')]
    Sleep    1s
    Click Element    //a[contains(text(),'Completed')]
    Sleep    2s
    
