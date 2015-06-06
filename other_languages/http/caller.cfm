<cfhttp method="get" url="/shared/other_languages/http/target.cfm" result="st" port="8305" useragent="Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.1.12) Gecko/20080201 Firefox/2.0.0.12">
	<cfhttpparam type="cgi" name="referer" value="www.shadocms.com" encoded="false">
	<cfhttpparam type="cgi" name="remote_addr" value="12.34.56.78" encoded="false">
	<cfhttpparam type="cgi" name="remote_host" value="www.pangolin.com" encoded="false">
</cfhttp>

<cfoutput>#st.fileContent#"</cfoutput>
<cfdump var="#st#">