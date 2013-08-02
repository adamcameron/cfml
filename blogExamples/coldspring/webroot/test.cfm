<cfscript>
// test.cfm
writeOutput("test.cfm initialised @ #timeFormat(now(), "HH:MM:SS.LLL")#<br>");
o1 = application.beanFactory.getBean("C");
writeOutput("o1.timestamp = #timeFormat(o1.timestamp, "HH:MM:SS.LLL")#<br>");
sleep(5000);

writeOutput("current time #timeFormat(now(), "HH:MM:SS.LLL")#<br>");
o2 = application.beanFactory.getBean("C");
writeOutput("o2.timestamp = #timeFormat(o2.timestamp, "HH:MM:SS.LLL")#<br>");
</cfscript>