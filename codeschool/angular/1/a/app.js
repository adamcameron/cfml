(function(){
	var app = angular.module("store", []);
	app.controller("StoreController", function(){
		this.product = gem;
	});
	var gem = {
		name		: "Dodecahedron",
		price		: 1.95,
		description	: "[desc]"
	};
})();

