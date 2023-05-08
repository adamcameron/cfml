<cfquery name="getOrderAddress" datasource="cfartgallery" maxrows="8">
select		orderid, total, address, city, state, postalcode
from		orders
order by	total desc
</cfquery>

<cfmap centeraddress="St. Louis, MO" name="ordermap" width="1000" height="600" 
	   showCenterMarker="false" showMarkerWindow="true"
	   markerBind="cfc:map.getOrderData({cfmapname}, {cfmaplatitude}, {cfmaplongitude}, {cfmapaddress})"
		>
	<cfloop query="getOrderAddress">
		<cfmapitem name="#orderid#" address="#city#, #state# #postalcode#" >
	</cfloop>
</cfmap>