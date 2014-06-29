// app.js

var App = Ember.Application.create({
	LOG_TRANSITIONS	: true
});
App.ApplicationAdapter = DS.FixtureAdapter.extend();

App.Router.map(function(){
	this.route("about", {path:"/aboutus"});
	this.resource("products", function(){
		this.resource("product", {path:"/:product_id"});
	});
});




App.ProductsRoute = Ember.Route.extend({
	model	: function(){
		return this.store.findAll("product");
	}
});




App.IndexController = Ember.Controller.extend({
	productsCount	: 6,
	logo			: "../lib/images/logo.png",
	time			: function(){
		return new Date().toDateString();
	}.property()
});


App.Product = DS.Model.extend({
	title		: DS.attr("string"),
	price		: DS.attr("number"),
	description	: DS.attr("string"),
	isOnSale	: DS.attr("boolean"),
	image		: DS.attr("string")
});

App.Product.FIXTURES = [{
	id			: 1,
	title		: "Flint",
	price		: 99,
	description	: "Flint is...",
	isOnSale	: true,
	image		: "../lib/images/flint.png"
},{
	id			: 2,
	title		: "Kindling",
	price		: 249,
	description	: "Easily...",
	isOnSale	: false,
	image		: "../lib/images/kindling.png"
}];

