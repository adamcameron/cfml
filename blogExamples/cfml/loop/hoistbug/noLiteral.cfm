<!--- noLiteral.cfm --->
<cffunction name="test" output="true">
	<cfset test_arr = arrayNew(1)>
	<cfset test_arr[1] = "aaa">
	<cfset test_arr[2] = "bbb">

	#serializeJson(test_arr)#<br>

	<cfloop array="#test_arr#" index="item_str">
		#item_str#<br>
	</cfloop>

	<cfset var item_str = "">
</cffunction>
  
<cfset test()>