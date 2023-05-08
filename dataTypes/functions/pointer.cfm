<cffunction name="func">
	<cfargument name="arg1" type="any"><!--- not really "any" but nothing more appropriate to choose from --->
	<cfoutput>#arguments.arg1()#</cfoutput>
</cffunction>

<cffunction name="callback_func">
	in callback function
</cffunction>

<cfoutput>
	#func(arg1=callback_func)#<br>
</cfoutput>