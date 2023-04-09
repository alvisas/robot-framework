*** Settings ***
Library    AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    Uiautomator2
${REMOTE_URL}                 http://localhost:4723/wd/hub
${PLATFORM_NAME}              Android
${PLATFORM_VERSION}           11
${DEVICE_NAME}                emulator-5556
${PACKAGE_NAME}               com.facebook.lite
${APP_ACTIVITY}               com.facebook.lite.MainActivity
${APP_LOCATION}               /home/koinworks/Personal/project/automation-robot-framework/src/apk/facebook_lite.apk

#*** Main Page ***
${USERNAME_FIELD}             xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.widget.MultiAutoCompleteTextView[1]
${PASSWORD_FIELD}             xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.widget.MultiAutoCompleteTextView[2]
${LOGIN_BUTTON}               xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup[1]
${SAVE_LOGIN_INFO_PAGE}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[3]            
${BUTTON_NOT_NOW}             xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[3]/android.view.ViewGroup[1]
${POPUP_WRONG_PWD}            xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
${BUTTON_OK_WRONG_PWD}        xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.View

#*** Credentials ***
${USERNAME}                    alvis.bebewash@gmail.com
${PASSWORD}                    bebewash123

*** Keywords ***

Open Test Application
  Open Application  ${REMOTE_URL}    
  ...  deviceName=${DEVICE_NAME}
  ...  platformName=${PLATFORM_NAME}
  ...  appPackage=${PACKAGE_NAME}    
  ...  appActivity=${APP_ACTIVITY}
  ...  automationName=${ANDROID_AUTOMATION_NAME}
  ...  app=${APP_LOCATION}

Auto Grant
    Click Element    com.android.permissioncontroller:id/permission_deny_button

Click Login Button
    Click Element    ${LOGIN_BUTTON}

Save Login Info Page Visible
    Wait Until Element Is Visible    ${SAVE_LOGIN_INFO_PAGE}

Attempt Not Save Login Creds
    Click Element    ${BUTTON_NOT_NOW}