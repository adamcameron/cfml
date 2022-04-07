<cfindex
	action		= "refresh"
	collection	= "scratch"
	key			= "#expandPath('.')#"
	type		= "path"
	extensions	= ".pdf"
>

<cfsearch collection="scratch" name="q" criteria="">
<cfdump var="#q#">