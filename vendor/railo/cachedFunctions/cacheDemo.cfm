<!--- cacheDemo.cfm --->
<cfset comp = new CacheDemo()>
<cfdump var="#comp.getTime()#" label="Initial call">
<cfset sleep(3000)>
<cfdump var="#comp.getTime()#" label="Cached call">
<!--- now with attributes --->
<cfdump var="#comp.getTime("Elvis", "29")#" label="Initial call">
<cfdump var="#comp.getTime("Sean", "42")#" label="Initial call">
<cfset sleep(3000)>
<cfdump var="#comp.getTime("Elvis", "29")#" label="Cached call">
<cfdump var="#comp.getTime("Sean", "42")#" label="Cached call">