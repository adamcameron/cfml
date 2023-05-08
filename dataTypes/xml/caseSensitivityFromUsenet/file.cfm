<cfxml variable="MyXml" casesensitive="true">
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

<!--- <CFSET MyXmlFile = ExpandPath("test.xml")>
<CFFILE
  ACTION="READ"
  FILE="#MyXmlFile#"
  VARIABLE="MyXmlCode">
<CFSET MyXml = XmlParse(MyXmlCode)> --->
<cfset xProject = MyXML.XmlRoot>
<CFSET arBOX = XmlSearch(MyXml, "//BOX")>
<CFLOOP FROM="1" TO="#ArrayLen(arBOX)#" INDEX="i">
   <li> <cfoutput>Text #i#: #arBox[i]["text"]["story"]["paragraph"]["richtext"].XmlText#</cfoutput> </li>
</CFLOOP>