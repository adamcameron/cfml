<cfscript>
// threadedHttp.cfm

urls = [
	"http://cf11.local:8511/rest/blog/article/2",
	"http://cf11.local:8511/rest/blog/reference/articleId/2",
	"http://cf11.local:8511/rest/blog/comment/articleId/2"
];

threadId = 0;
for (urlToRequest in urls){
	threadName = "t" & ++threadId;
	writeLog(file="threadTest2", text="#threadName# before thread");
	thread action="run" name="#threadName#" urlToRequest=urlToRequest {
		writeLog(file="threadTest2", text="#thread.name# before request");
		http method="get" url=attributes.urlToRequest result="httpResponse";
		writeLog(file="threadTest2", text="#thread.name# after request");
	}
	writeLog(file="threadTest2", text="#threadName# after thread");
}
writeLog(file="threadTest2", text="before join");
thread action="join" name="t1,t2,t3";
writeLog(file="threadTest2", text="after join");
</cfscript>
