<cfcomponent>
	
	<cffunction name="tagOutputNotSpecified" returntype="struct" access="public">
		<cfset var bareMessage = "Bare variable from within tagOutputNotSpecified()<br>"> 
		<cfset var outputMessage = "Outputed variable from within tagOutputNotSpecified()<br>">
		#bareMessage#
		Text from within tagOutputNotSpecified()<br>
		<cfoutput>#outputMessage#</cfoutput>
		<cfreturn getMetadata(tagOutputNotSpecified)>
	</cffunction>
	
	<cffunction name="tagOutputTrue" returntype="struct" access="public" output="true">
		<cfset var bareMessage = "Bare variable from within tagOutputTrue()<br>"> 
		<cfset var outputMessage = "Outputed variable from within tagOutputTrue()<br>">
		#bareMessage#
		Text from within tagOutputTrue()<br>
		<cfoutput>#outputMessage#</cfoutput>
		<cfreturn getMetadata(tagOutputTrue)>
	</cffunction>
	
	<cffunction name="tagOutputFalse" returntype="struct" access="public" output="false">
		<cfset var bareMessage = "Bare variable from within tagOutputFalse()<br>"> 
		<cfset var outputMessage = "Outputed variable from within tagOutputFalse()<br>">
		#bareMessage#
		Text from within tagOutputFalse()<br>
		<cfoutput>#outputMessage#</cfoutput>
		<cfreturn getMetadata(tagOutputFalse)>
	</cffunction>
	
	<cfscript>
		public struct function scriptOutputNotSpecified(){
			var bareMessage = "Bare variable via include from within scriptOutputNotSpecified()<br>";
			var outputMessage = "Outputed variable from within scriptOutputNotSpecified()<br>";
			include "inc.cfm";
			writeOutput(outputMessage);
			return getMetadata(scriptOutputNotSpecified);
		} 

		public struct function scriptOutputFalse() output=false {
			var bareMessage = "Bare variable via include from within scriptOutputFalse()<br>";
			var outputMessage = "Outputed variable from within scriptOutputFalse()<br>";
			include "inc.cfm";
			writeOutput(outputMessage);
			return getMetadata(scriptOutputFalse);
		} 

		public struct function scriptOutputTrue() output=true {
			var bareMessage = "Bare variable via include from within scriptOutputTrue()<br>";
			var outputMessage = "Outputed variable from within scriptOutputTrue()<br>";
			include "inc.cfm";
			writeOutput(outputMessage);
			return getMetadata(scriptOutputTrue);
		} 
	</cfscript>
	
</cfcomponent>