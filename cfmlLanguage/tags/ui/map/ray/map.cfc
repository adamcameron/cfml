<cfcomponent output="false">

<cffunction name="getOrderData" access="remote">
	<cfargument name="cfmapname">
	<cfargument name="cfmaplatitude">
	<cfargument name="cfmaplongitude">
	<cfargument name="cfmapaddress">
	
	<cfquery name="local.data" datasource="cfartgallery">
	select	art.artname, art.price
	from	art
	left join orderitems on art.artid = orderitems.artid
	where orderitems.orderid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cfmapname#">
	</cfquery>
	
	<cfquery name="local.orderinfo" datasource="cfartgallery">
	select	customerfirstname, customerlastname, address, city, state, postalcode, total, tax
	from	orders
	where 	orderid = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.cfmapname#">
	</cfquery>
	
	<cfsavecontent variable="local.display">
<cfoutput>
<h2>Order ID: #arguments.cfmapname#</h2>

<p>
Total: <span style="color:green">#dollarFormat(local.orderinfo.total)#</span><br/>
Tax: #dollarFormat(local.orderinfo.tax)#
</p>
<br/>
<p>
Items:<br/>
</cfoutput>

<cfoutput query="local.data">
#artname# (#dollarFormat(price)#)<br/>
</cfoutput>
</p>

<cfoutput>
<br/>
<p>
Ordered by #local.orderinfo.customerlastname#, #local.orderinfo.customerfirstname#<br/>
#local.orderinfo.address#, #local.orderinfo.city#, #local.orderinfo.state# #local.orderinfo.postalcode#
</p>
</cfoutput>
	</cfsavecontent>
	
	<cfreturn local.display>
</cffunction>

</cfcomponent> 