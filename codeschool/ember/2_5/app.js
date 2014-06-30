// app.js

var App = Ember.Application.create({
	LOG_TRANSITIONS	: true
});

App.Router.map(function(){
	this.route("about", {path:"/aboutus"});
});

App.IndexController = Ember.Controller.extend({
	productsCount	: 6,
	logo			: "../lib/images/logo.png",
	time			: function(){
		return new Date().toDateString();
	}.property()
});
