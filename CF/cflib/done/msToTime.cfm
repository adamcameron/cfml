<cffunction name="msToTime" output="false" access="public" returntype="string" hint="">
	<cfargument name="millis" type="numeric" required="true"/>
	<cfargument name="long" 	type="boolean" required="true" default="false"/>
	<cfscript>
		var locals = {};	
		
		//Cast to a string to preserve all digits and grab the rightmost 3 digits
		locals.ms = val(right(javacast("string", arguments.millis),3)) mod 1000;
		arguments.millis = int(arguments.millis/1000); 
		locals.s = millis mod 60;
		locals.m = int(millis/60) mod 60;
		locals.h = int(millis/3600) mod 24;
		locals.d = int(millis/86400);

		//Formatting
		if(arguments.long){
			return 
				lsnumberformat(locals.d) & ":" 
				& lsnumberformat(locals.h, "00") & ":" 
				& lsnumberformat(locals.m, "00") & ":" 
				& lsnumberformat(locals.s, "00") & "." 
				& lsnumberformat(locals.ms, "000");
		}
		
		if(locals.d gte 2){
			return lsnumberformat(locals.d) & "d " & locals.h & "h " & locals.m & "m";
		}

		if(locals.h gt 1){
			return locals.h & "h " & locals.m & "m";
		}

		if(locals.m gt 1){
			return (locals.h * 60) + locals.m & "m " & locals.s & "s";
		}

		if(locals.s gt 1){
			return (locals.m * 60) + locals.s & "." & lsnumberformat(locals.ms, "000") & "s";
		}
	
		return (locals.s * 1000) + locals.ms & "ms";
	</cfscript>
</cffunction>

<cfscript>
	s = 1000;
	m = 60 * s;
	h = 60 * m;
	d = 24 * h;
	w = 7 * d;
	y = 365 * d;
	
	tests = [0,1,10,100,s,3.5*s, m, h, d, w, 5*w, y, y+d];
	
	for (test in tests){
		writeOutput("#test#: #msToTime(test)#<br />");
	}
</cfscript>

