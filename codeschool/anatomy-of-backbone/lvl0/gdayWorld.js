//gdayWorld.js
$(document).ready(function(){
    // Create Model Class = where the data goes
    var Greeting = Backbone.Model.extend({
        // return data defaults of model wrapped in a function so the
        // defaults are returned each time a model instance is created
        defaults: function(){
            return {
                title: "default"
            };
        }
    });

    // Create an instance of the model
    var greeting = new Greeting({
        title: "hello-world"
    });

    // Create the View Class to render in HTML
    // Views communicate with Models and let them know if the data in the Models
    // have changed due to user interaction, etc
    var GreetingView = Backbone.View.extend({
        render: function(){
            $(this.el).html("<p>Hello World</p>");
            return this;
        }
    });

    // Create a new view instance
    var greetingView = new GreetingView({
        model: greeting
    });

    // call the render function
    greetingView.render();
    $('#test').html(greetingView.el);

});