<cfxml variable="x">
<dsp ver="2.0" mode="summary">
	<result	type="1"
			search-phrase="SanDisk SDMX3-512-A18" 
			result-phrase="SanDisk SDMX3-512-A18"
			is-modified="0"
			search-category="0" 
			search-domain="0"
			live-merchant-count="15678"
			total-product-count="4339534"
	>
	</result>
</dsp>
</cfxml>

<cfset a = xmlSearch(x, "//@type")>
<cfdump var="#a#">