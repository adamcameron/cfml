// app.js

var App = Ember.Application.create({
	LOG_TRANSITIONS	: true
});

App.Router.map(function(){
	this.route("about", {path:"/aboutus"});
	this.resource("products", {path:"/items"});
});

App.ProductsRoute = Ember.Route.extend({
	model	: function(){
		return App.PRODUCTS;
	}
});




App.IndexController = Ember.Controller.extend({
	productsCount	: 6,
	logo			: "../lib/images/logo.png",
	time			: function(){
		return new Date().toDateString();
	}.property()
});


App.PRODUCTS = [{
	title		: "Flint",
	price		: 99,
	description	: "Flint is...",
	isOnSale	: true,
	image		: "../lib/images/flint.png"
},{
	title		: "Kindling",
	price		: 249,
	description	: "Easily...",
	isOnSale	: false,
	image		: "../lib/images/kindling.png"
}];