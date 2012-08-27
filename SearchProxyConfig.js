/**
 * Configuration settings for the SearchProxy
 * @param {Map} callbacks: needs to contain keys for getProductId, getVersionId, getSearchValue
 */
function SearchProxyConfig(callbacks){
	// do these individually as we want an error straight away if we don't get 'em
	this.callbacks	= {
		getProductId	: callbacks.getProductId,	
		getVersionId	: callbacks.getVersionId,	
		getSearchValue	: callbacks.getSearchValue
	};	

	this.settings = this.getSettings();

	return this;
}

SearchProxyConfig.prototype.getSettings = function(){
	return {
		proxyUrl: "http://shared.local:8500/shared/blog/cfbugs/2/searchProxy.cfm",
		bugbaseUrl: "https://bugbase.adobe.com/index.cfm",
		calls: {
			products: {
				params: {
					event		: "qAllProductsForSearch"
				}
			},
			versions: {
				params: {
					event		: "qVersionsForSearch",
					prodid		: this.callbacks.getProductId
				}
			},
			search: {
				params: {
					event		: "qSearchBugs",
					page		: 1,
					pageSize	: 500,
					product		: this.callbacks.getProductId,
					version		: this.callbacks.getVersionId,
					fieldValue	: this.callbacks.getSearchValue
				},
				fields: ["title", "testConfig", "reportedBy", "description"]
			}
		}
	}
};
