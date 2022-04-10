<cfset st = {
	component			= "c",
	method				= "f",
	returnVariable		= "s",
	argumentCollection	= {
		arg1	= "Hello",
		arg2	= "there",
		arg3	= "world"
	}
}>
<cfinvoke attributecollection="#st#">
<cfdump var="#variables#">
