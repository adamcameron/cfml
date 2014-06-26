(function(){
	var app = angular.module("store", []);
	app.controller("StoreController", function(){
		this.products = gems;
	});
	var gems = [{
		name		: "Dodecahedron",
		price		: 1.95,
		description	: "[desc of dodecahedron]",
		canPurchase	: true,
		soldOut		: false
	},{
		name		: "Pentagonal Gem",
		price		: 5.95,
		description	: "[desc of pentagonal gem]",
		canPurchase	: false,
		soldOut		: false
	}];
})();

