component {

	public AdobeBugService function init(){

		var bugQueryPageSize = 10;

		variables.products	= [
			{
				id		= 1149,
				name	=	"CF",
				versions= [
					{name="11.0",	version= 10206}, 
					{name="10.0.0",	version= 7770},
					{name="9.0.1",	version= 9288},
					{name="9.0.0",	version= 9289},
					{name="8.0.1",	version= 9290},
					{name="8.0.0",	version= 9291}
				]
			},
			{
				id		= 1958,
				name	=	"CFB",
				versions= [
					{name="2.0.1",	version= 8972},
					{name="2.0.0",	version= 8104},
					{name="1.0.0",	version= 8103}
				]
			}
		];
		
		variables.bugsUrl	= "https://bugbase.adobe.com/index.cfm?event=qSearchBugs&page=1&pageSize=#bugQueryPageSize#&product={PRODUCT}&version={VERSION}&gridsortcolumn=AD_S_DEFECT_ID&gridsortdirection=DESC";
		variables.bugUrl	= "https://bugbase.adobe.com/index.cfm?event=bug&id=";
		
		variables.dataFile = getDirectoryFromPath(getCurrentTemplatePath()) & "AdobeBugService.dat";

		return this;
	}

	public numeric function getLastBugProcessed(){
		var lastBugProcessed = 0;
		
		try {
			lock name="AdobeBugServiceLastBugProcessed" type="exclusive" timeout=2 throwontimeout=true {  
				if (fileExists(variables.dataFile)){
					lastBugProcessed = fileRead(variables.dataFile);
				}
			}
		} catch (any e){
			rethrow;
		}
		return val(lastBugProcessed);
	}

	public void function setLastBugProcessed(required numeric lastBugProcessed){
		try {
			lock name="AdobeBugServiceLastBugProcessed" type="readonly" timeout=2 throwontimeout=true {  
				fileWrite(variables.dataFile, lastBugProcessed);
			}
		} catch (any e){
			rethrow;
			// we're not that fussed
		}
	}

	public query function getBugs(numeric since){
		var product			= false;
		var version			= false;
		var thisVersionUrl	= "";
		var httpService		= false;
		var response		= false;
		var responseData	= "";
		var bugData			= false;
		var bugQuery		= false;
		var row				= 0;
		var bugs			= queryNew("id,title,version,product,bugUrl");
		
		for (product in variables.products){
			for (version in product.versions){
				thisVersionUrl = replace(variables.bugsUrl, "{PRODUCT}", product.id, "ONE");
				thisVersionUrl = replace(thisVersionUrl, "{VERSION}", version.version, "ONE");
				httpService = new http(
					method	= "get",
					url		= thisVersionUrl
				);
				response = httpService.send().getPrefix();
				if (response.statusCode == "200 OK"){
					responseData = reReplace(response.fileContent, "^//", "", "ONE");
					bugData = deserializeJson(responseData);
					bugQuery = queryNew("id,title,version,product,bugUrl");
					try {
						for (row=1; row <= arrayLen(bugData.query.data); row++){
							queryAddRow(bugQuery);
							querySetCell(bugQuery, "id", bugData.query.data[row][2]);
							querySetCell(bugQuery, "title", bugData.query.data[row][5]);
							querySetCell(bugQuery, "version", version.name);
							querySetCell(bugQuery, "product", product.name);
							querySetCell(bugQuery, "bugUrl", variables.bugUrl & bugData.query.data[row][2]);
						}
						bugs = new Query(
							dbtype		= "query",
							sql			= "
								SELECT	cast(id AS integer) AS id,
										cast(title AS varchar) AS title,
										cast(version AS varchar) AS version,
										cast(product AS varchar) AS product,
										cast(bugUrl AS varchar) AS bugUrl
								FROM	bugs
								UNION
								SELECT	cast(id AS integer) AS id,
										cast(title AS varchar) AS title,
										cast(version AS varchar) AS version,
										cast(product AS varchar) AS product,
										cast(bugUrl AS varchar) AS bugUrl
								FROM	bugQuery
							",
							bugs		= bugs,
							bugQuery	= bugQuery
						).execute().getResult();
					}
					catch (any e){
						writeDump(local);
						rethrow;
						// oh well
					}
				}	// end of 200-OK			
			}	// end of looping over versions
		}	// end of looping over products
		
		// now if we are getting only a subset, filter further
		if (structKeyExists(arguments, "since")){
			bugs = new Query(
				dbtype		= "query",
				sql			= "
					SELECT	*
					FROM	bugs
					WHERE	id > #arguments.since#
				",
				bugs		= bugs,
				bugQuery	= bugQuery
			).execute().getResult();
		}
		return bugs;
	}

}

