######################################################
#
# This Library consist of an automated test scenarios
# for the ToDo Web Application
#
#######################################################

*** Settings ***
Library             Selenium2Library
Resource            ${CURDIR}/../src/ResourceKeywords.robot
Resource            ${CURDIR}/../testdata/Labels.robot
Variables           ${CURDIR}/../src/TestDataGenerator.py


Test Setup    Open Web Application    ${AppUrl}    ${FfWebBrowser}
Test Teardown    Close Web Application

*** test cases ***
Verify User Should Be Able to Create Task
    [Tags]    SC_ID_1    Sanity_Test
    Verify Application Home Page
    User Login    ${UserName}    ${Password}
    ${TaskName}    Update Name with Time Now    ${automatedTask}
    Create New Task    ${TaskName}
    Verify Created Task Append To Task List    ${TaskName}
    Sign Out From The App

Verify User Should Be Able to Create Sub Task
    [Tags]    SC_ID_2    Sanity_Test
    Verify Application Home Page
    User Login    ${UserName}    ${Password}
    ${TaskName}    Update Name with Time Now    ${SetOfTask}
    Create New Task    ${TaskName}
    Verify Created Task Append To Task List    ${TaskName}
    Create Sub Task    ${setOfTask}    ${subTask1}
    Verify Sub Task Added Successfully    ${subTask1}
    Sign Out From The App

User Should Not Be able Create Task with less than 3 character
    [Tags]    SC_ID_3    Sanity_Test
    Verify Application Home Page
    User Login    ${UserName}    ${Password}
    Create New Task    ${twoCharStr}
    ${ret}    Run Keyword And Return Status    Verify Created Task Append To Task List    ${twoCharStr}
    Run Keyword If    '${ret}' == 'True'    Fail    Task Created Successfully with less than 3 character

Verify User Should Not Be Able to Sign Up using Special Character into Name and Email String
    [Tags]    SC_ID_4    Sanity_Test
    Verify Application Home Page
    verify User Sign Up functionality    ${InvaliUser}    ${InvalidEmeil}    ${SignUpPassword}
    Verify User Failed To Sign Up

User Should Not Be Able To Create Two Task with same Name
    [Tags]    SC_ID_5    Sanity_Test
    Verify Application Home Page
    User Login    ${UserName}    ${Password}
    Create New Task    ${SameNameTask}
    Verify Created Task Append To Task List    ${SameNameTask}
    Sign Out From The App
    Verify Application Home Page
    User Login    ${UserName}    ${Password}
    Create New Task    ${SameNameTask}
    Verify Created Task Append To Task List    ${SameNameTask}
    Sign Out From The App

User Should Not Be Able To Add Task Name From Sub Task Window
    [Tags]    SC_ID_6    Sanity_Test
    Verify Application Home Page
    User Login    ${UserName}    ${Password}
    ${TaskName}    Update Name with Time Now    ${SetOfTask}
    Create New Task    ${TaskName}
    Run Keyword And Ignore Error    Verify Created Task Append To Task List    ${TaskName}
    ${ret}    Run Keyword And Return Status    Update Task Name From Sub Task Window    ${TaskFromSubTask}
    Run Keyword If    '${ret}' == 'True'    Fail    User Is Able To Update Task Name From Sub Task Window

User Should Not Be Able to Create Subtask Without Entering Task Description And Due Date
    [Tags]    SC_ID_7    Sanity_Test
    Verify Application Home Page
    User Login    ${UserName}    ${Password}
    Go To Task List
    ${ret}    Run Keyword And Return Status    Create Sub Task Without Desc and Due Date
    Run Keyword If    '${ret}' == 'True'    Fail    Sub Task Created Successfully without Description and Due Date

User Should Not Be Able To Create Sub Task With More Than 250 characters
    [Tags]    SC_ID_8    Sanity_Test
    Verify Application Home Page
    User Login    ${UserName}    ${Password}
    ${TaskName}    Update Name with Time Now    ${SetOfTask}
    Create New Task    ${TaskName}
    Run Keyword And Ignore Error    Verify Created Task Append To Task List    ${TaskName}
    Create Sub Task    ${setOfTask}    ${strWith254Char}
    ${ret}    Run Keyword And Return Status    Verify Sub Task Added Successfully    ${strWith254Char}
    Run Keyword If    '${ret}' == 'True'    Fail    Sub Task Created Successfully with more than 250 characters
