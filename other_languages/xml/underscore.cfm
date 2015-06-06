 <cfxml variable="Variables.XML">
 <parent>
 <child>
 <_e1>Starting With Underscore</_e1>
 <e2>Without Underscore</e2>
 <e_3>Has an Underscore</e_3>
 <Message>Testing ColdFusion and XMLDoc Object unable to reference an element
with an underscore</Message>
 </child>
 </parent>
 </cfxml>

 <cfset Variables.XMLObject = Variables.XML>

 <cfdump var="#Variables.XMLObject#">

 <cfoutput>
 #Variables.XMLObject["parent"]["child"]["Message"].XmlText#<br />
 #Variables.XMLObject["parent"]["child"].XmlChildren[1].XmlText#<br />

 <cftry>
 	#Variables.XMLObject["parent"]["child"]["_e1"].XmlText#<br />
 	<cfcatch type="any">
 		<strong>ERROR:</strong>
Variables.XMLObject["parent"]["child"]["_e1"].XmlText<br />
 	</cfcatch>
 </cftry>

 <cfif StructKeyExists(Variables.XMLObject["parent"]["child"], "_e1")>
 "_e1" is there! But I can't reference it....<br />
 </cfif>

 #Variables.XMLObject["parent"]["child"]["e2"].XmlText#<br />
 #Variables.XMLObject["parent"]["child"]["e_3"].XmlText#<br />
 </cfoutput>
<cfset a = xmlSearch(Variables.XMLObject, "/parent/child/_e1")>
<cfdump var="#a#">
<cfdump var="#a[1].xmlText#">

