(function(){
	var app = angular.module("store", []);
	app.controller("StoreController", function(){
		this.products = gems;
	});
	var gems = [{
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
	},{
		name		: "Pentagonal Gem",
		price		: 5.95,
		description	: "desc of pentagonal gem",
		canPurchase	: false,
		soldOut		: false,
		images		: [{
			full	: "../../lib/images/gem-02.gif",
			thumb	: "Pentagonal_t1.jpg"
		},{
			full	: "Pentagonal_f2.jpg",
			thumb	: "Pentagonal_t2.jpg"
		}]
	}];
})();

