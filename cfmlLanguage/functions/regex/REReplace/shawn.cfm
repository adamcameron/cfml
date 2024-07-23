<cfset urlstring = 'http://www.mysite.com' />

<cfset domain = ReReplace(urlstring, '^.*?://([^/?##]+).*$', '\1', 'ONE') />

<cfoutput>#domain#</cfoutput>
