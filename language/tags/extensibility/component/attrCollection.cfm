<cfset stAttr = {
	component			= "AttrCollection",
	method				= "f",
	returnVariable		= "stReturn",
	argumentCollection	= {
		arg1 	= "foo",
		arg2	= "bar"
	}
}>

<cfinvoke attributecollection="#stAttr#" />
<cfdump var="#variables#">