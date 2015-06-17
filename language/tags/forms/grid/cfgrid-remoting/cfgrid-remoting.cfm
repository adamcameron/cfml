<cfsilent>
<!--- make an empty query to populate the grid with no records --->
<cfset memberList = queryNew("id,name,age,gender") />
<cfsavecontent variable="getData">
<cfoutput>
	//create connection
	var connection:mx.remoting.Connection = mx.remoting.NetServices.createGatewayConnection("http://#cgi.HTTP_HOST#:#CGI.HTTP_PORT#/flashservices/gateway/");
	//declare service
	var myService:mx.remoting.NetServiceProxy;
</cfoutput>

	var responseHandler = {};

	//put the controls in scope to avoid calling _root
	var contactList = contactList;

	responseHandler.onResult = function( results: Object ):Void {
		//when results are back, populate the cfgrid
		contactList.dataProvider = results;
	}

	responseHandler.onStatus  = function( stat: Object ):Void {
		//if there is any error, show an alert
		alert("Error while calling cfc:" + stat.description);
	}

	//get service
	myService = connection.getService("shared.cf.cfml.G.grid.cfgrid-remoting.flashRemotingResponder", responseHandler );
	//make call
	myService.getMembers();
</cfsavecontent>
</cfsilent>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>Populating a cfgrid with Flash Remoting</title>
</head>

<body>
<cfform name="myform" height="350" width="400" format="Flash" timeout="300">
	<cfgrid name="contactList" query="memberList" height="200" rowheaders="false">
			<cfgridcolumn name="name" header="Name" />
			<cfgridcolumn name="age" header="Age" />
			<cfgridcolumn name="gender" header="Gender" />
	</cfgrid>
	<cfinput type="text" name="filterValues" onchange="#getData#" />
	<cfinput type="button" name="getValues" value="Populate data grid" onclick="#getData#">
</cfform>
</body>
</html>
