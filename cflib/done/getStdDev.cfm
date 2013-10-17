--->
<!---this function is used to get the standard deviation of samples given--->
<cffunction name="getStdDev" access="public" returntype="any">
  <cfargument name="param1" type="array" required="yes" hint="this is the array of samples to be supplied">


  <!---1. Calculate the mean.--->
  <cfset smean = ArrayAvg(ARGUMENTS.param1)>
  <cfset paramLen = ArrayLen(ARGUMENTS.param1)>

  <cfif paramLen LT 2>
  	<cfset paramLen = 2>
  </cfif>

  <!---2. For each data point, subtract the mean to give the difference.--->
  <!---3. Square each difference (multiply it by itself) to give the squared differences. --->
  <!---4. Add all of the squared differences together, to give the sum of squared differences.--->
  <cfset diffSumSqr = 0>
  <cfloop array="#ARGUMENTS.param1#" index="s">
  <cfset diffSumSqr = diffSumSqr + ((s - smean)^2)>
  </cfloop>
  <!---5. Divide the sum of squared differences by the number of points, to give the mean squared difference, or variance.--->
  <cfset divSumSqr = diffSumSqr/(paramLen-1)>
  <!---6. Take the square root of the variance to give the standard deviation.--->
  <cfset stdDev = sqr(divSumSqr)>
  <cfreturn stdDev>
</cffunction>

<cfscript>
/**
 * Returns the standard deviation calculated using the divisor n-1 method.
 *
 * @param values      Comma delimited list or one dimensional array of numeric values
 * @return Returns a simple value.
 * @author Rob Brooks-Bilson (rbils@amkor.com)
 * @version 1.1, September 7, 2001
 */
function StdDevSamp(values)
{
  Var MyArray = 0;
  Var NumValues = 0;
  Var xBar = 0;
  Var SumxBar = 0;
  Var i=0;
  if (IsArray(values)){
     MyArray = values;
    }
  else {
     MyArray = ListToArray(values);
    }
  NumValues = ArrayLen(MyArray);
  xBar = ArrayAvg(MyArray);
  for (i=1; i LTE NumValues; i=i+1) {
    SumxBar = SumxBar + ((MyArray[i] - xBar)*(MyArray[i] - xBar));
    }
  Return Sqr(SumxBar/(NumValues-1));
}
</cfscript>


 <!---In this example we used LIST instead of ARRAY for the SAMPLES --->

<cfset samples = '1,2,3,4,5,6,1,2,4,45,5,6,89,7,7,8,12,8,99,7,7,8,8,8,1,99,98'>


<cfset samplestoArray= ListToArray(samples)>
<cfset stdDev = getStdDev(samplestoArray)>

<cfoutput>
	getStdDev(): #stdDev#<br>
	StdDevSamp(): #StdDevSamp(samplestoArray)#<br>
</cfoutput>

