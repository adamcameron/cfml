<cfscript>
loopThreshold = 6;

loop index="x" from="1" to="5" label="loopLabel" {
	if (x >= loopThreshold){
		break "loopLabel";
	}
}
</cfscript>
