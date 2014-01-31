<style>
dt { float: left; width: 100px; }
dd.cf { float: left;  margin-left: 20px; }
dd.railo { float: left;  margin-left: 20px; }
dd.openbd { float: none; margin-left: 260px; }
</style>

<cfscript>
//listing.cfm
dir = expandPath("/shared/git/adamcameroncoldfusion.cfmldeveloper.com/wwwroot/undocs/coldfusion/10_0_13/");

rootUrl = "http://adamcameroncoldfusion.cfmldeveloper.com/undocs/";
urls = {
	coldfusion = "coldfusion/10_0_13/",
	railo = "railo/4_2_0/",
	openbd = "openbd/3_1/"
};

files = directoryList(dir, false, "array", "*.html", "name asc");
writeOutput("<dl>");
arrayEach(files, function(v){
	var object = listFirst(listLast(v, "/\"), ".");
	writeOutput('<dt>#object#</dt>');
	writeOutput('<dd class="cf"><a href="#rootUrl##urls.coldfusion##object#.html" target="_blank">ColdFusion</a></dd>');
	writeOutput('<dd class="railo"><a href="#rootUrl##urls.railo##object#.html" target="_blank">Railo</a></dd>');
	writeOutput('<dd class="openbd"><a href="#rootUrl##urls.openbd##object#.html" target="_blank">OpenBD</a></dd>');
});
writeOutput("</dl>");
</cfscript>