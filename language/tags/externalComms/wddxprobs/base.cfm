<cfset o = createObject("component", "it2")>

<cfset q = o.queryIt()>
<cfdump var="#q#" label="q">
<!--- <cfset f = o.filterIt(q.value)>
<cfdump var="#f#" label="f">
<cfset w = o.wddxIt(f)>
<cfdump var="#w#" label="w">
<cfset s = o.storeIt(w)>
<cfdump var="#s#" label="s"> --->