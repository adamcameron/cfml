loopThreshold = 3;

for (x=1; x <= 5; x++; "loopLabel") {
	if (x >= loopThreshold){
		break "loopLabel";
	}
}
</cfscript>
