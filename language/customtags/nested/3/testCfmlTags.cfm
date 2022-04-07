<!--- testCfmlTags.cfm --->
<cfimport taglib="cfmlBasedTags" prefix="t">

Text before tags<br>
<t:grandparent gp:attr="set in grandparent">
	Text in grandparent, before parent<br>
	<t:parent p:attr="set in parent">
		Text in parent, before child<br>
		<t:child c:attr="set in child">
			Text in child<br>
		</t:child>
		Text in parent, after child<br>
	</t:parent>
	Text in grandparent, after parent<br>
</t:grandparent>
Text after tags<br>