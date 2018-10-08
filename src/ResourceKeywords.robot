##############################################
#
# This File consist of a qa-test App specific
# Resource keywords
#
##############################################

*** Settings ***
Resource        ${CURDIR}/../testdata/Locators.robot

*** Keywords ***
Open Web Application
    [arguments]    ${webUrl}    ${browserName}=firefox
    Open Browser    url=${webUrl}    browser=${browserName}
    Sleep    3s

Close Web Application
    Close Browser

Verify Application Home Page
    Page Should Contain Element    ${AppHome}    message=Application does not contain Home into Navigation Bar
    Page Should Contain Element    ${NavigationMyTasks}    message=Application does not contain My Tasks into Navigation Bar
    Page Should Contain Element    ${SignIn}    message=Application does not contain Sign In
    Page Should Contain Element    ${SignUpBtn}    message=Application does not contain Sign Up Button
    Page Should Contain Element    ${Register}    message=Application does not contain Register
    Page Should Contain Element    ${TestDescription}    message=Application does not contain Test Description

User Login
    [Arguments]    ${Name}    ${Password}
    Click Element    ${SignIn}
    Sleep    2s
    Page Should Contain Element    ${RememberMe}    message=LogIn Page Does Not Contain Remember Me
    Input Text    ${EmailInputField}    ${UserName}
    Input Text    ${PasswordInputField}    ${Password}
    Click Element    ${SignInBtn}
    Sleep    5s
    Page Should Contain Element    ${SignInSuccessMsg}    message=User Login Fail
    Sleep    3s

Create New Task
    [Arguments]    ${TaskName}
    Click Element    ${MyTask}
    Page Should Contain Element    ${CreateTaskInputField}    message=Create Task Field is not found
    Input Text    ${CreateTaskInputField}    ${TaskName}
    Sleep    2s
    Press Key    ${CreateTaskInputField}    ${EnterKey}
    Sleep    3s

Verify Created Task Append To Task List
    [Arguments]     ${automatedTask}
    ${cnt}    Get Element Count    xpath=//*[contains(text(), '${automatedTask}')]
    Should Be Equal    '${cnt}'    '1'    msg=Create Task Not Found Into Task List or More Than Two Task With Same Name Are Created successfully

Sign Out From The App
    Click Element    ${SignInOut}
    Sleep    3s
    Page Should Contain Element    ${TestDescription}    message=Application does not contain Test Description

Create Sub Task
    [Arguments]    ${MainTask}    ${SubTask}
    Click Element    ${openSubTask}
    Sleep    2s
    Page Should Contain Element    ${SubTaskDescription}
    Input Text    ${SubTaskDescription}    ${subTask}
    Sleep    2s
    Input Text    ${DueDateField}    ${TaskDueDate}
    Click Element    ${addSubTaskBtn}
    Sleep    5s

Verify Sub Task Added Successfully
    [Arguments]    ${TaskName}
    ${cnt}    Get Element Count    xpath=//*[contains(text(), '${TaskName}')]
    Should Be Equal    '${cnt}'    '1'    msg=Create Sub Task Not Found into Sub Task List
    Sleep    3s
    Click Element    ${closeSubTaskWindow}

Update Name with Time Now
    [Arguments]    ${RawData}
    ${TaskName}    Catenate    ${RawData}    ${timeNow}
    [Return]     ${TaskName}

verify User Sign Up functionality
    [Arguments]    ${name}    ${email}    ${pwd}
    Click Element    ${SignUpBtn}
    Page Should Contain Element    ${SignUpOkBtn}
    Input Text    ${UserNameField}    ${name}
    Input Text    ${UserEmailField}    ${email}
    Input Text    ${userPwdField}    ${pwd}
    Input Text    ${userPwdCfmField}    ${pwd}
    Sleep    3s
    Click Element    ${SignUpOkBtn}

Verify User Failed To Sign Up
    Sleep    5s
    Page Should Not Contain Element    ${signUpSuccessMsg}    message=User Sign Up Successfully with Special Character in Name and Email

Update Task Name From Sub Task Window
    [Arguments]    ${Name}
    Click Element    ${openSubTask}
    Sleep    2s
    Page Should Contain Element    ${SubTaskDescription}
    Clear Element Text    ${TaskFieldOfSubTask}
    Input Text    ${TaskFieldOfSubTask}    ${Name}

Go To Task List
    Click Element    ${MyTask}
    Sleep    2s

Create Sub Task Without Desc and Due Date
    Click Element    ${openSubTask}
    Page Should Contain Element    ${SubTaskDescription}
    Sleep    2s
    Click Element    ${addSubTaskBtn}
    Page Should Contain Element    ${emptyTask}

