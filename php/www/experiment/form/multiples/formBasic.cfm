<cfscript>
// formBasic.php

colours = ["whero", "karaka", "kowhai", "kakariki", "kikorangi", "tawatawa", "mawhero"];
numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
	
</cfscript>

<form method="post" action="dumpPost.cfm">
	Colours:<br>
	<cfoutput>
	<cfloop index="colour" array="#colours#">
		<input type="checkbox" name="colour" value="#colour#">#colour#<br>
	</cfloop>
	<hr>Number:<br>
	<cfloop index="number" array="#numbers#">
		<input type="checkbox" name="number" value="#number#">#number#<br>
	</cfloop>
	</cfoutput>
	<input type="submit" name="btnSubmit" value="Submit">
</form>