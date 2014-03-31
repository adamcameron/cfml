$(document).ready(function(){
    var Greeting = Backbone.Model.extend({
        defaults: function(){
            return {
                title: "default"
            };
        }
    });

    var GreetingView = Backbone.View.extend({
    	el		: "#greeting",
        render: function(){
            this.$el.html("<p>G'day World</p>");
            return this;
        }
    });

    var greetingView = new GreetingView({
        model: greeting
    });

    greetingView.render();

});