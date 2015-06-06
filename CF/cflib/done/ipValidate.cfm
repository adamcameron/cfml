<cffunction name="ipValidate" access="public" returntype="boolean" hint="Method validates an ip address and returns a boolean">
	<cfargument name="_ip" type="string" />
	
	<cfset var ip                = arguments._ip />
	<cfset var arrayIP           = ArrayNew(1) />
	<cfset var arrayIPLength     = '' />
	<cfset var arrayIPList       = '' />
	<cfset var arrayListContains = '' />
	
	<cfloop list="#ip#" index="i" delimiters=".">
		<cfif i gte 0 and i lte 255>
			<cfset ArrayAppend(arrayIP,true) />
		<cfelse>
			<cfset ArrayAppend(arrayIP,false) />
		</cfif>
	</cfloop>
	
	<cfset arrayIPLength = ArrayLen(arrayIP) />
	
	<cfif arrayIPLength eq 4>
		<cfset ArrayAppend(arrayIP,true) />
	<cfelse>
		<cfset ArrayAppend(arrayIP,false) />
	</cfif>
	
	<cfset arrayIPList       = ArrayToList(arrayIP) />
	<cfset arrayListContains = ListContains(arrayIPList,false) />
	
	<cfif arrayListContains eq 0>
		<cfreturn true />
	<cfelse>
		<cfreturn false />
	</cfif>
</cffunction>

<cfscript>
function isIP(ip){
    var ii = 1;
    //make sure it is a '.' delimited list 4 long
    if(listlen(ip,".") is not 4) return false;

    //make sure each item is a number between 1 and 255
    for(ii = 1;ii lte 4;ii = ii + 1){
        if(not isnumeric(listgetat(ip,ii,".")) OR listgetat(ip,ii,".") GT 255 OR listgetat(ip,ii,".") LT 0)    return false;
    }
    //check for the special cases of 255.255.255.255 or 0.0.0.0, which is not really valid
    if(ip is "255.255.255.255" OR IP is "0.0.0.0") return false;
    return true;
}

	for (ip in [
	"a",
	0,
	192,
	"192.168",
	"192.168.0",
	"192.168.0.0",
	"192.168.0.0.0",
	"192.160.0.a",
	"192.168.256.0"
]){
	writeOutput("#ip#: #ipValidate(ip)#: #isIp(ip)#<br />");
}
</cfscript>
