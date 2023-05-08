<cfscript>
// testUserServiceDI.cfm

userService = application.beanFactory.getBean("UserService")

user = userService.getUserById(1)

loggedIn = userService.authenticate(user.getLoginId(),"INVALID_PASSWORD")

dump([user.getAsStruct(), loggedIn])

</cfscript>
