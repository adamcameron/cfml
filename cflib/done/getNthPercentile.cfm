<cfscript>
public numeric function getNthPercentile(required array population, required numeric percentile){
	if (percentile < 0 || percentile > 100){
		throw(type="ArgumentOutOfRangeException", message="percentile argument value out of range", detail="The percentile argument must be in the range 1-100")
	}
	arraySort(population, "numeric");

	var populationSize = arrayLen(population);
	var nthPercentIndex = round((percentile/100) * populationSize + 0.5);

	return population[min(nthPercentIndex, populationSize)];
}

</cfscript>

<cffunction name="getNthPercentileOld" access="remote" hint="get the nth percentile of the list">
    <cfargument name="pop" type="string" required="yes" hint="the population">
    <cfargument name="n"  type="numeric"  required="yes" default="95" hint="the nth percent (0-100)">


<!---  if less than n zero set to zero--->

	<cfif n LT 0>
    	<cfset n =0>
    </cfif>


<!---    sort population from lowest to greatest--->
	<cfset arrPop = ListToArray( ListSort(pop,'numeric','asc'))>
<!---    get  no of  population--->
    <cfset popLen = ArrayLen(arrPop)>

    <cfset nthPct = (n /100)*  popLen + (1/2)>

    <cfset nth = round(nthPct)>


    <cfif popLen LT nth>
 		<cfset nthPctile = arrPop[popLen]>
	<cfelse>
		<cfset nthPctile = arrPop[nth]>

	</cfif>

    <cfreturn nthPctile>
</cffunction>


<cfset numbers = "">
<cfloop index="i" from="1" to="50">
	<cfset numbers = listAppend(numbers, randRange(0,1000))>
</cfloop>

<cfoutput>numbers: #numbers#<br></cfoutput>

<cfloop index="i" from="1" to="100" step="0.5">
	<cfset theirs = getNthPercentile(numbers, i)>
	<cfset mine = getNthPercentileMine(listToArray(numbers), i)>
<cfoutput>
	<cfif theirs NEQ mine>
		getNthPercentile(): #theirs#<br>
		getNthPercentileMine(): #mine#<br>
		<hr>
	</cfif>
</cfoutput>
</cfloop>
