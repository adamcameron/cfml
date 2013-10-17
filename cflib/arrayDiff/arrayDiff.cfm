<cffunction name="arrayDiff" access="public" output="false" returntype="array" hint="Removes the subset array2 from array1 to get the difference. For large arrays, you have the option to break up the tasks into multi-threaded batches. You also have the option to remove duplicates.">
	<cfargument name="array1" type="array" required="true" hint="The array with items that may not exist in array2." />
	<cfargument name="array2" type="array" required="true" hint="The array with items that array1 will be checked against." />
	<cfargument name="threads" type="numeric" required="false" default="5" hint="How many threads to create when breaking up the logic (useful when dealing with a lot of data). If you choose zero (0), then a simple compare will happen in a normal single thread." />
	<cfargument name="bRemoveDuplicates" type="boolean" required="false" default="true" hint="Removes duplicates from the final result." />

	<cfset var maxThreadLoop = threads />
	<cfset var array1Len = arrayLen(array1) />

	<!--- break the processing into chucks with cfthread --->
	<cfif threads gt 0>
		<cfset var maxBatchLoop = ceiling(array1Len / maxThreadLoop) />
		<cfset var threadName = "" />
		<cfset var lThreadNames = "" />
		<cfset var threadCount = 0 />
		<cfset var thisId = "" />
		<cfloop index="threadCount" from="1" to="#maxThreadLoop#">
			<cfset threadName = createUuid()>
			<cfset lThreadNames = listAppend(lThreadNames, threadName) />
			<cfthread action="run" name="#threadName#" threadCount="#threadCount#" maxBatchLoop="#maxBatchLoop#" array1Len="#array1Len#" array1="#array1#" array2="#array2#">
				<cfset var thread["aObjectIds"] = [] />
				<cfloop from="1" to="#attributes.maxBatchLoop#" index="i">
					<cfset thisId = (attributes.maxBatchLoop*attributes.threadCount)-attributes.maxBatchLoop+i />
					<cfif thisId lte attributes.array1Len>
						<cfset arrayAppend(thread["aObjectIds"], attributes.array1[thisId]) />
						<cfset var thread["bContinue"] = true />
					<cfelse>
						<!--- If we've run out of items, break out of the inner loop --->
						<cfset var thread["bContinue"] = false />
						<cfbreak />
					</cfif>
				</cfloop>
				<cfset thread["aObjectIds"].removeAll(attributes.array2) />
			</cfthread>
			<!--- If we have less remaining items than the maxThreadLoop, break out of the outer loop rather than do empty cfthread calls --->
			<cfif threadCount eq array1Len>
				<cfbreak />
			</cfif>
		</cfloop>

		<!--- Join the threads after they have completed --->
		<cfthread action="join" name="#lThreadNames#" />
		<cfset var aItemsDiff = [] />
		<cfloop list="#lThreadNames#" index="a">
			<!--- Combine the arrays using java --->
			<cfset aItemsDiff.addAll(cfthread[a]["aObjectIds"]) />
		</cfloop>
	<cfelse>
		<!--- No threading --->
		<cfset array1.removeAll(array2) />
		<cfset aItemsDiff = duplicate(array1) />
	</cfif>

	<!--- Remove any duplicates --->
	<cfif bRemoveDuplicates is true>
		<cfset aItemsDiff = createObject("java", "java.util.HashSet").init(aItemsDiff).toArray() />
	</cfif>

	<cfreturn aItemsDiff />
</cffunction>