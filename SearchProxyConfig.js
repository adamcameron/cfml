/**
 * Configuration settings for the SearchProxy
 * @param {Map} callbacks: needs to contain keys for getProductId, getVersionId, getKeywords
 */
function SearchProxyConfig(callbacks){
	// do these individually as we want an error straight away if we don't get 'em
	this.callbacks	= {
		getProductId	: callbacks.getProductId,	
		getVersionId	: callbacks.getVersionId,	
		getKeywords		: callbacks.getKeywords
	};	

	this.settings = {
		proxyUrl	: "http://shared.local:8500/shared/blog/cfbugs/current/searchProxy.cfm",
		bugbaseUrl	: "https://bugbase.adobe.com/index.cfm",
		search: {
			staticParams: {
				event		: "qSearchBugs",
				page		: 1,
				pageSize	: 500
			},
			dynamicParams: {
				product		: this.callbacks.getProductId,
				version		: this.callbacks.getVersionId,
				fieldValue	: this.callbacks.getKeywords
			},
			fields: ["title", "testConfig", "reportedBy", "description"]
		}
	};

	return this;
}