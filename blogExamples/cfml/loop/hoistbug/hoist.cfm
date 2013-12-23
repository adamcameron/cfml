<!--- hoist.cfm --->
<cffunction name="test" output="true">
	<cfset test_arr = ["aaa", "bbb"]>

	#serializeJson(test_arr)#<br>

	<cfloop array="#test_arr#" index="item_str">
		#item_str#<br>
	</cfloop>

	<cfset var item_str = "">
</cffunction>
  
<cfset test()>