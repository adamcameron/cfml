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
					{id: 10206,name: "11.0"},
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
		]
	};

	this.products.lookup = {
		1149	: {
			product	: this.products.details[0],
			7770	: this.products.details[0].versions[0],
			9288	: this.products.details[0].versions[1],
			9289	: this.products.details[0].versions[2],
			9290	: this.products.details[0].versions[3],
			9291	: this.products.details[0].versions[4]
		},
		1958	: {
			product	: this.products.details[1],
			8972	: this.products.details[1].versions[0],
			8104	: this.products.details[1].versions[1],
			8103	: this.products.details[1].versions[2]
		}
	};

	return this;
};