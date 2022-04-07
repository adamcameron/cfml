<!--- test.cfm --->
<cfdump var="#getApplicationMetadata().DATASOURCE#">
<cflog file="#application.applicationname#" text="Thread: #URL.thread# Iteration: #URL.iteration# ran OK">