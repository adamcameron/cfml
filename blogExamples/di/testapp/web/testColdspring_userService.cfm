<cfscript>
// testColdspring_userService.cfm
before = getTickCount();
userService = application.coldspringBeanFactory.getBean("UserService");
after = getTickCount();
firstDuration = after - before;	

before = getTickCount();
userService = application.coldspringBeanFactory.getBean("UserService");
after = getTickCount();
secondDuration = after - before;


dan = userService.getUserById(2);
writeDump(var=[userService, dan,firstDuration,secondDuration]);
</cfscript>