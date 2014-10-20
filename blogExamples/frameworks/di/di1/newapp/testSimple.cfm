<cfscript>
//testSimple.cfm

echo("testSimple.cfm, before creating someService<br>")
someService = application.beanFactory.getBean("SomeService")	

echo("testSimple.cfm, after creating someService<br>")

dump(var=someService, label="someService")
dump(var=someService.getVariables(), label="someService variables scope")
</cfscript>