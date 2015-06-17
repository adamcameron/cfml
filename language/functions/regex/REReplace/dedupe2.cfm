<cfset oRegex = createObject("component", "shared.cfcs.regex.tmt_java_regexp")>
<cfset s = "zsdaiogfyoasdghasdhgklanhglkafhgahkhdglkjajghjkaohvdengfnaiosdhgozdfjklgnsdlkghd">
<cfset l = oRegex.regExpReplace("(\w)", s, "$1,", true)>
<cfset sDeDupe = oRegex.regExpReplace("(?<=,|^)([^,]*)(,\1)+(?=,|$)", l, "$1", true)>
<cfset structDelete(variables, "oRegex")>
<cfdump var="#variables#">