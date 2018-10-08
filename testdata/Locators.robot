*** Variables ***

# Home Page Elements
${AppHome}                      Xpath=//*[contains(text(),'Home')]
${NavigationMyTasks}            Xpath=//*[contains(text(),'My Tasks')]
${SignIn}                       Xpath=//*[contains(text(),'Sign In')]
${Register}                     Xpath=//*[contains(text(),'Register')]
${SignUpBtn}                    xpath=//a[contains(@href, '/users/sign_up')]
${TestDescription}              xpath=//a[contains(@href, 'user-stories')]

# Sign In Page Elements
${RememberMe}                   xpath=//*[contains(text(), 'Remember me')]
${EmailInputField}              xpath=//input[contains(@id, 'user_email')]
${PasswordInputField}           xpath=//input[contains(@id, 'user_password')]
${SignInBtn}                    xpath=//input[contains(@name, 'commit')]
${SignInSuccessMsg}             xpath=//*[contains(text(), 'Signed in successfully.')]

# Create Task Page Elements
${MyTask}                       xpath=//a[contains(@href, '/tasks')]
${CreateTaskInputField}         xpath=//input[contains(@name, 'new_task')]
${EnterKey}                      \\13
${SignInOut}                    xpath=//a[contains(@href, '/users/sign_out')]

# Sub Task Page Element
${openSubTask}                  xpath=/html/body/div[1]/div[2]/div[2]/div/table/tbody/tr[1]/td[4]/button
${SubTaskDescription}           xpath=//input[contains(@id, 'new_sub_task')]
${DueDateField}                 xpath=//input[contains(@id, 'dueDate')]
${addSubTaskBtn}                xpath=//button[contains(@id, 'add-subtask')]
${closeSubTaskWindow}           xpath=//*[contains(text(), 'Close')]
${TaskFieldOfSubTask}           xpath=//*[contains(@id, 'edit_task')]
${emptyTask}                    xpath=//*[contains(text(), 'empty')]


# Sign Up Page Elements
${signUpSuccessMsg}             xpath=//*[contains(text(), 'Welcome! You have signed up successfully.')]
${UserNameField}                xpath=//input[contains(@id, 'user_name')]
${UserEmailField}               xpath=//input[contains(@id, 'user_email')]
${userPwdField}                 xpath=//input[contains(@id, 'user_password')]
${userPwdCfmField}              xpath=//input[contains(@id, 'user_password_confirmation')]
${SignUpOkBtn}                  xpath=//input[contains(@name, 'commit')]

