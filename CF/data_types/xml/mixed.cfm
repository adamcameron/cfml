<cfxml variable="sXML"><thing>
	<textp textstyle-name="Standard">
		This is a paragraph and it contains some 
		<textspan textstyle-name="T4">bold text abcd</textspan>
		. Then after that there's some 
		<textspan textstyle-name="T5">italics</textspan>
		 text. I wonder what'll happen when i have some text that is both 
		<textspan textstyle-name="T6">bold and italics</textspan>?
	</textp>
</thing>
</cfxml>
<cfdump var="#sXML#">