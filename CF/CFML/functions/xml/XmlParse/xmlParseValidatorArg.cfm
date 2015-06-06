<cfset x = xmlParse("file:///C:/webroots/cf8_770/strakeruk/app_config/apps/pods/podframework.xml")>
<cfdump var="#x#" label="not validated">

<cfset x = xmlParse("file:///C:/webroots/cf8_770/strakeruk/app_config/apps/pods/podframework.xml", true, "http://#cgi.http_host#/com/strakerinteractive/podframework/lib/dtds/podframework.dtd")>
<cfdump var="#x#" label="validated">