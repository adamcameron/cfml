<cfscript>
	
param name="URL.path";
param name="URL.site" type="regex" pattern="^(?i)build|local$" default="build";

sites = {
	local	= "http://m.hostelbookers.local",
	build	= "http://m.hostelbookers.build.hb-system.com:9090"
};

writeOutput('<a href="#sites[URL.site]##URL.path#" target="_blank">#URL.path#</a>');
</cfscript>