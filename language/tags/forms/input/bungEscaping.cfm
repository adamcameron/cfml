<cfform method="post" action="./bungEscaping.cfm">
	<input type="button" name="btn1" value="Go &raquo;" /><!--- correct rendering of &raquo; --->
	<cfinput type="button" name="btn1" value="Go &raquo;" /><!--- incorrect rendering of &raquo;, because CF is escaping the & --->
</cfform>