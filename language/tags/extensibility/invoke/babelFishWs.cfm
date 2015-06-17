<cfinvoke	webservice		= "http://www.xmethods.net/sd/2001/BabelFishService.wsdl"
			method			= "babelFish"
			returnvariable	= "aString"
>
	<cfinvokeargument name="translationmode" value="en_fr">
	<cfinvokeargument name="sourcedata" value="Hello, my name is Adam">
</cfinvoke>
<cfoutput>#aString#</cfoutput>