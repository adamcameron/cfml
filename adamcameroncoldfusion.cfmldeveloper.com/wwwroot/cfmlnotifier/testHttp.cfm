<cfhttp
	method="get"
	url="https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=10&product=1149&version=7770&gridsortcolumn=AD_S_DEFECT_ID&gridsortdirection=DESC"
	useragent="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36"
>

<cfdump var="#cfhttp#">