<cfset variables.nonsense = "fuck head">
<cfset FORM.myExpression = "nonsense">
<!--- This example shows the use of DE and Evaluate --->
<h3>Evaluate Example</h3>
<cfif IsDefined("FORM.myExpression")>

<!--- Evaluate the expression --->
<cfset myExpression = Evaluate(FORM.myExpression)>
<!--- Use DE to output the value of the variable, unevaluated --->
<cfoutput>
The value of the expression #Evaluate(DE(FORM.MyExpression))# 
is #MyExpression#.
</cfoutput>

</cfif>