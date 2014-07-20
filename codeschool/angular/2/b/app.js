(function(){
	var app = angular.module("store", []);
	app.controller("StoreController", function(){
		this.product = gem;
	});
	app.controller("PanelController", function(){
		this.tab = 1;

		this.selectTab = function(setTab){
			this.tab = setTab
		};

		this.isSelected = function(checkTab){
			return this.tab === checkTab;
		}
	});



	var gem = {
		name		: "Dodecahedron",
		price		: 2,
		description	: "desc of dodecahedron",
		canPurchase	: true,
		soldOut		: false,
		images		: [{
			full	: "../../lib/images/gem-02.gif",
			thumb	: "Dodecahedron_t1.jpg"
		},{
			full	: "Dodecahedron_f2.jpg",
			thumb	: "Dodecahedron_t2.jpg"
		}]
	};
})();

