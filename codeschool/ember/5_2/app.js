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


App.IndexRoute = Ember.Route.extend({
	model	: function(){
		return this.store.findAll("product");
	}
});


App.ProductsRoute = Ember.Route.extend({
	model	: function(){
		return this.store.find("product");
	}
});



App.IndexController = Ember.ArrayController.extend({
	/*
	productsCount	: function(){
		return this.get("length");
	}.property("length"),
	*/
	productsCount	: Ember.computed.alias("length"),
	logo			: "../lib/images/logo.png",
	time			: function(){
		return new Date().toDateString();
	}.property()
});


App.ProductsController = Ember.ArrayController.extend({
	sortProperties	: ["title"]
	//,sortAscending	: false
});




App.Product = DS.Model.extend({
	title		: DS.attr("string"),
	price		: DS.attr("number"),
	description	: DS.attr("string"),
	isOnSale	: DS.attr("boolean"),
	image		: DS.attr("string"),
	reviews		: DS.hasMany("review", {async: true})
});

App.Product.FIXTURES = [{
	id			: 1,
	title		: "Flint",
	price		: 99,
	description	: "Flint is...",
	isOnSale	: true,
	image		: "../lib/images/flint.png",
	reviews		: [100,101]
},{
	id			: 2,
	title		: "Kindling",
	price		: 249,
	description	: "Easily...",
	isOnSale	: false,
	image		: "../lib/images/kindling.png"
},{
	id			: 3,
	title		: "Kerosene",
	price		: 10,
	description	: "Do the job properly",
	isOnSale	: true,
	image		: "../lib/images/kindling.png"
}];



App.Review = DS.Model.extend({
	text		: DS.attr("string"),
	reviewedAt	: DS.attr("date"),
	product		: DS.belongsTo("product")
});

App.Review.FIXTURES = [{
	id		: 100,
	product	: 1,
	text	: "Started a fire in no time!"
},{
	id		: 101,
	product	: 1,
	text	: "not the brightest flame, but warm!"
}];

