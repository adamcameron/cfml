/*
<cfcomponent accessors="true">
	
	
	
	<cfproperty type="string" name="username" setter="true" required="true">
	<cfproperty  type="string" name="password" setter="true" required="true">
	<cfproperty  type="string" name="WSURL" setter="true" required="true">
 
 	<cfscript>
 		
	public function returnVariables(){
		return variables
	}
	
	public function returnMetadata(){
		return getMetadata()
	}
 	</cfscript>
	
</cfcomponent>
*/


component accessors = true {
	
	property string username setter = true required=true;
	property  string password setter = true required=true;
	property  string WSURL setter=true required=true;
 
	public function returnVariables(){
		return variables
	}
	
	public function returnMetadata(){
		return getMetadata()
	}
	
}
--->