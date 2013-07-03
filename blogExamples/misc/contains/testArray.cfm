<cfset objects = [
	new TagBased(),
	new TagBased(),
	new TagBased()
]>

<cfset objects[1].notContains()>
<cfset objects[1].contains()>