<cfxml variable="x">
<AFDPostcodeEverywhere>
<AddressListItem value="1">
	<Address>LL49 0AB Oldfield Systems Ltd, PO Box 38, Porthmadog</Address>
	<PostKey>LL49 0AB1001</PostKey>
</AddressListItem>
<AddressListItem value="2">
	<Address>LL49 0AG PO Box 42, Porthmadog</Address>
	<PostKey/>
</AddressListItem>
</AFDPostcodeEverywhere>
</cfxml>

<cfset a = xmlSearch(x, "/AFDPostcodeEverywhere/AddressListItem[1]/PostKey/text()[string-length() > 1]")>
<cfdump var="#a#">