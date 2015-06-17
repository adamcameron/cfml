<cfset objects = [
	new TagBased(),
	new TagBased(),
	new TagBased()
]>
<cfset object = objects[1]>
<cfset object.notContains()>
<cfset object.contains()>