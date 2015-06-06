<cfquery name="getOrderAddress" datasource="cfartgallery" maxrows="8">
select		orderid, total, address, city, state, postalcode
from		orders
order by	total desc
</cfquery>

<cfmap centeraddress="St. Louis, MO" width="500" height="500" showCenterMarker="false">
	<cfloop query="getOrderAddress">
		<cfmapitem address="#city#, #state# #postalcode#" tip="Order #orderid#/#dollarFormat(total)#">
	</cfloop>
</cfmap>