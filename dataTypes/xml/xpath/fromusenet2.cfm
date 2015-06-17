<cfxml variable="x">
 <PROJECT>
   <LAYOUT>
     <ID UID="1"/>
     <SPREAD>
       <BOX BOXTYPE="CT_TEXT">
         <ID NAME="Text 1"/>
         <TEXT>
           <STORY CLEAROLDTEXT="false" FITTEXTTOBOX="true" CONVERTQUOTES="true">
 		  	<PARAGRAPH>
 				<RICHTEXT>
 					Sweet wines
 				</RICHTEXT>
 			</PARAGRAPH>
           </STORY>
         </TEXT>
       </BOX>
       <BOX BOXTYPE="CT_TEXT">
         <ID NAME="Text 2"/>
         <TEXT>
           <STORY CLEAROLDTEXT="true" FITTEXTTOBOX="true" CONVERTQUOTES="true">
 		  	<PARAGRAPH>
 				<RICHTEXT>
 				  Simpy Joe's Vineyard
 				</RICHTEXT>
 			</PARAGRAPH>
           </STORY>
         </TEXT>
       </BOX>
     </SPREAD>
   </LAYOUT>
 </PROJECT>
</cfxml>

<cfset aBoxes = xmlSearch(x, "//BOX")>
<cfloop index="i" from="1" to="#arrayLen(aBoxes)#">
	<cfset aName = xmlSearch(aBoxes[i], "//BOX[position()=#i#]/ID[@NAME]")>
	<cfset aText = xmlSearch(aBoxes[i], "//BOX[position()=#i#]/TEXT/STORY/PARAGRAPH/RICHTEXT")>
		<cfoutput>
			<cfif arrayLen(aName)>
				#aName[1].xmlAttributes["NAME"]#
			</cfif>
			:
			<cfif arrayLen(atext)>
				#atext[1].xmlText#
			</cfif>
			<br />
		</cfoutput>
	<br />
</cfloop>