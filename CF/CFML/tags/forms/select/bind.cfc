<cfcomponent output="false" hint="">


	<cffunction name="getOptions" returntype="query" access="remote" output="false" hint="">
		<cfscript>
			var q		= queryNew("value,display");
			var aData	= ["Adam", "Belinda", "Charlie", "Donna", "Eric", "Fleur"];
			var i		= 0;
			for (i=1; i < arrayLen(aData); i++){
				queryAddRow(q);
				querySetCell(q, "value", i);
				querySetCell(q, "display", aData[i]);
			}
			return q;
		</cfscript>
	</cffunction>


	<cffunction name="getStates" returntype="query" access="remote" output="false" hint="">
		<cfscript>
			var lStates	= "New South Wales,Victoria,Tasmania,South Australia,Western Australia, Northern Territory,Queensland";
			var qStates = queryNew("value,display");
			var i		= 0;
			
			for (i=1; i <= listLen(lStates); i++){
				queryAddRow(qStates);
				sState = listGetAt(lStates, i);
				querySetCell(qStates, "value", sState);
				querySetCell(qStates, "display", sState);
			}
			
			return qStates;
		</cfscript>
	</cffunction>


</cfcomponent>