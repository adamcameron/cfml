/**
 * Configuration settings for the SearchForm
 * Just contains hard-coded data from Adobe.  If the data changes, we just need to change it here, rather than in the code
 */
function SearchFormConfig(){

	this.products = {
		details: [
			{
				id: 1149,
				name: "ColdFusion",
				versions: [
					{id: 7770,name: "10.0"},
					{id: 9288, name: "9.0.1"},
					{id: 9289, name: "9.0"},
					{id: 9290, name: "8.0.1"},
					{id: 9291, name: "8.0"}
				]
			}, {
				id: 1958,
				name: "ColdFusion Builder",
				versions: [
					{id: 8972, name: "2.0.1"},
					{id: 8104, name: "2.0"},
					{id: 8103, name: "1.0"}
				]
			}
		],
	};
	this.products.lookup = {
		1149	: this.products.details[0],
		1958	: this.products.details[1]
	};

	return this;
};