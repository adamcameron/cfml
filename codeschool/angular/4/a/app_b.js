(function(){
	var app = angular.module("store", []);
	app.controller("StoreController", function(){
		this.products = gems;
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
	app.controller("ReviewController", function(){
		this.review = {};

		this.addReview = function(product){
			this.review.createdOn = Date.now();
			product.reviews.push(this.review);
			this.review = {};
		};
	});
	app.directive("productTitleViaAttribute", function(){
		return {
			restrict	: "A",
			templateUrl	: "product-title.html"
		};
	});
	app.directive("productTitleViaElement", function(){
		return {
			restrict	: "E",
			templateUrl	: "product-title.html"
		};
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
		}],
		reviews		: [
			{stars:5, body: "I love this product", author:"joe@example.com"},
			{stars:1, body: "This product sux", author:"tim@example.com"}
		],
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
		}],
		reviews		: []
	}];
})();

