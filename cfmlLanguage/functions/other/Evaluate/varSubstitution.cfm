<cfset s = "I think ##person1## is wrong. ##person2## has this suggestion :-)">
Demonstrating this has only the single pound-signs, as per the requirement: <cfoutput>#s#</cfoutput><br />

<cfset person1 = "Mike">
<cfset person2 = "Adam">
<cfoutput>#evaluate(de(s))#</cfoutput>