<cfscript>
// testUserServiceDI.cfm

userService = application.wirebox.getInstance("UserService")

user = userService.getUserById(1)

loggedIn = userService.authenticate(user.getLoginId(),"INVALID_PASSWORD")

dump([user.getAsStruct(), loggedIn])

</cfscript>