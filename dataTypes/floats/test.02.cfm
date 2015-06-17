<cfscript>
	multiplier = 1;	// change this to 100
	
	temp=QueryNew("x");
	QueryAddRow(temp);
	QuerySetCell(temp,"x","0");
	XMax=5*multiplier;
	X = 4*multiplier;
	looper = 0;
	while(X LT XMAX)
	{
	QueryAddRow(temp);
	x = x + (0.02*multiplier);
	QuerySetCell(temp,"x",x);
	}
</cfscript>
<cfdump var="#temp#">