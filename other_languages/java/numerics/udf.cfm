<cffunction name="convertBaseN" access="public"returntype="string">
	<cfargument name="from" type="numeric" required="true">
	<cfargument name="to" type="numeric" required="true">
	<cfargument name="s" type="string" required="true">

	<cfscript>
		var iL		= len(arguments.s);
		var fs		= listToArray(repeatString("0,", iL));
		var k		= 1;
		var i		= 0;
		var j		= 0;
		var oL		= int(iL * (arguments.from / arguments.to + 1));
		var ts		= listToArray(repeatString("0,", oL+10));
		var cums	= listToArray(repeatString("0,", oL+10));
		var temp 	= 0;
		var rem		= 0;
		var iP		= 0;
		var sOut	= "";
		var first	= false;
		var c		= '';
		var iDigit	= "";
	</cfscript>
	<cfif not iL>
		<cfthrow message="s argument must not be empty">
	</cfif>

	<cfif arguments.from lt 2 or arguments.from gt 36 or arguments.to lt 2 or arguments.to gt 36>
		<cfthrow message="from and to arguments must be between 2 and 36 (inclusive).">
	</cfif>

	<cfif not reFind("^[0-9A-Za-z]+$", arguments.s)>
		<cfthrow message="Input string must only contain any of 0-9 or A-Z">
	</cfif>

	<cfset arguments.s = ucase(arguments.s)>

   <!--- convert string to an array of integer digits representing number in base:from --->
	<cfloop index="i" from="#iL#" to="1" step="-1">
		<cfset c = mid(arguments.s, i, 1)>
		<cfif c ge 0 and c le 9>
			<cfset iDigit = val(c)>
		<cfelse>
			<cfset iDigit = 10 + (asc(c) - asc('A'))>
		</cfif>
		<!--- check the input for digits that exceed the allowable for base:from --->
		<cfif iDigit lt arguments.from>
			<cfset fs[k++] = iDigit>
		<cfelse>
			<cfthrow message="Not a valid number for this input base">
		</cfif>
	</cfloop>

	<cfscript>
		ts[1] = 1; //initialise array with number 1

		//evaluate the output
		for (i=1; i <= iL; i++){ //for each input digit
			for (j=1; j <= oL; j++){
				cums[j]	+= ts[j] * fs[i];
				temp	= cums[j];
				rem		= 0;
				ip		= j;

				do {	// fix up any remainders in base:to
	                rem = int(temp / arguments.to);
	                cums[ip] = temp - (rem*arguments.to);
	                ip++;
	                cums[ip] += rem;
	                temp = cums[ip];
				} while (temp >= arguments.to);
			}

			//calculate the next power from^i) in base:to format
			for (j=1; j <= ol; j++){
				ts[j] = ts[j] * arguments.from;
			}

			for (j=1; j<=ol; j++){ //check for any remainders
				temp = ts[j];
				rem = 0;
				ip = j;
				do {  //fix up any remainders
					rem = int(temp / arguments.to);
					ts[ip] = temp - rem * arguments.to;
					ip++;
					ts[ip] += rem;
					temp = ts[ip];
			    } while (temp >= arguments.to);
			}
		}

		//convert the output to string format (digits 0,to-1 converted to 0-Z characters)
		first = false; //leading zero flag
		for (i=ol; i > 0; i--) {
		    if (cums[i] != 0){
		    	first = true;
		    }
		    if (!first) {
		    	continue;
		    }
		    if (cums[i] < 10) {
		    	sout &= cums[i];
		    }else{
		    	sOut &= chr(cums[i] + (asc('A') - 10));
		    }
		}
		if (not len(sOut)){
			return "0"; //input was zero, return 0
		}
		//return the converted string
		return sOut;
	</cfscript>
</cffunction>