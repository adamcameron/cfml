 <cfsavecontent variable="myXML">
 <parent>
 	<child>A&amp;L</child>
 </parent>
 </cfsavecontent>

 <cfoutput>
 	isXML: #isXML(myXML)#<br>
 	isValid: #isValid('xml',myXML)#
 </cfoutput>