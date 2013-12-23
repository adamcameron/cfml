<!--- noHoist.cfm --->
<cffunction name="test" output="true">
	<cfset var item_str = "">
	<cfset test_arr = ["aaa", "bbb"]>

	#serializeJson(test_arr)#<br>

	<cfloop array="#test_arr#" index="item_str">
		#item_str#<br>
	</cfloop>

</cffunction>
  
<cfset test()>