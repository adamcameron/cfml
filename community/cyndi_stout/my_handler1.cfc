component rest="true" restPath="MyHandler1" output="false" {
 
 
 
       remote any function GetHandler(required boolean booleanVal restargsource="path") restpath="MyTest/{booleanVal}"  httpmethod="GET" produces="application/json" {
 
            httpSvc = new http();
 
            httpSvc.setMethod("GET").setCharset("utf-8");

writeLog(file="cyndi", text="arguments: #serializeJson(arguments)# raw: #arguments.booleanVal#");
 
            httpSvc.setUrl("http://#CGI.http_host#/rest/cyndi/MyHandler2/MyTest/#arguments.booleanVal#");  //booleanVal will be yes not true
 
 
 
            result = httpSvc.send().getPrefix();
 
            return result;
 
       }
 
}