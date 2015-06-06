<cffunction name="SeparatedValue" access="public" returntype="query" output="false" hint="Returns the separated value from decimal value">
	<!--- Define arguments. --->
	<cfargument name="ValueSeparated" type="string" required="true" />
    <cfset GetDecimal = val(listRest(val(ARGUMENTS.ValueSeparated), "."))>
    <cfif LEN(GetDecimal) GT 2>
    	<cfset GetDecimal = left(GetDecimal,2)>
    <cfelse>
    	<cfset GetDecimal = RepeatString('0',2-LEN(GetDecimal))&GetDecimal>
    </cfif> 
 	<cfset qSeparatedValue = QueryNew("Value1,Value2","VarChar,VarChar")>
    <cfset AddRow = QueryAddRow(qSeparatedValue)>
	<Cfset SetCell = QuerySetCell(qSeparatedValue,"Value1","#val(Int(val(ARGUMENTS.ValueSeparated)))#")>
    <Cfset SetCell = QuerySetCell(qSeparatedValue,"Value2","#GetDecimal#")>
    <cfreturn qSeparatedValue>
</cffunction>

<cfscript>
public struct function splitDecimal(required numeric number){
	var result = {};
	result.integer = listFirst(number, ".");
	if (listLen(number, ".") > 1){
		result.decimal = listRest(number, ".");
	}else{
		result.decimal = 0;
	}
	return result;
}
</cfscript>

<cfset result = splitDecimal(254.999989)>
<cfoutput>
Integer Value = #result.integer#<br />
Decimal Value = #result.decimal#<br />
</cfoutput>
<cfset result = splitDecimal(0)>
<cfoutput>
Integer Value = #result.integer#<br /><!--- 0 --->
Decimal Value = #result.decimal#<br /><!--- 0 --->
</cfoutput>

<cfset result = splitDecimal(-1)>
<cfoutput>
Integer Value = #result.integer#<br /><!--- -1 --->
Decimal Value = #result.decimal#<br /><!--- 0 --->
</cfoutput>