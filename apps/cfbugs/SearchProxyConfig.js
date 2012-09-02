/**
 * Configuration settings for the SearchProxy
 * @param {Map} callbacks: needs to contain keys for getProductId, getVersionId, getKeywords
 */
function SearchProxyConfig(callbacks){
	this.settings = {
		proxyUrl		: "http://shared.local:8500/shared/git/apps/cfbugs/searchProxy.cfm",
		bugbaseUrl		: "https://bugbase.adobe.com/index.cfm",
		listingRequests : {
			staticParams	: {
				event		: "qSearchBugs",
				page		: 1,
				pageSize	: 500,
				handler		: "_searchProxy.createListingData"
			},
			dynamicParamMap	: {
				// maps the purpose of the field onto Adobe's form field name
				product		: "product",
				version		: "version"
			},
			fields			: ["title", "testConfig", "reportedBy", "description"],
		},
		detailRequests	: {
			eventParam	: "event",
			eventValue	: "bug",
			idParam		: "id",
			handler		: "_searchProxy.createDetailData"
		},
		callbacks		: {
			getProductId	: callbacks.getProductId,
			getVersionId	: callbacks.getVersionId,
			getKeywords		: callbacks.getKeywords
		}
	};

	return this;
}