*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String

*** Variable ***
${URL}      https://reqres.in/api/

*** Test Case ***
TC01_Get_All_Users
   Create Session   GET_User             ${URL}            verify=true    
   ${response}      GET On Session       GET_User          /users
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

TC02_GET_User_Info
   Create Session    GET_User_Info             ${URL}                 verify=true
   ${response}       GET On Session            GET_User_Info          /users/1
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

TC03_POST_Create_User
   Create Session     POST_User           ${URL}          verify=true
   ${body}            Create Dictionary  
   ...    name= Nithi Chongphasatsuk 
   ...    job= Software Tester 
   ${headers}         Create Dictionary    Content-Type=application/json; charset=UTF-8
   ${response}        POST On Session      POST_User       /users   headers=${headers}   json=${body}  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     201

TC04_PATCH_Update_User
   Create Session     PATCH_User            ${URL}          verify=true
   ${body}            Create Dictionary
   ...     name= Xeng
   ...     job= QA Automate
   ${headers}         Create Dictionary     Content-Type=application/json; charset=UTF-8
   ${response}        PATCH On Session      PATCH_User   /users/id   headers=${headers}   json=${body}  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

TC05_DELETE_Delete_User
   Create Session     DELETE_User            ${URL}          verify=true
   ${response}        DELETE On Session      DELETE_User     /users/id  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     204

















