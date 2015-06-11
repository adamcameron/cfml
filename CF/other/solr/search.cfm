<cfparam name="URL.search">
<cfsearch collection="scratch" name="q" criteria="#URL.search#">
<cfdump var="#q#">