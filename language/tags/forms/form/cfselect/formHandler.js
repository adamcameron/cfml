$(document).ready(function() {
	$.ajax({
		url			: "Movies.cfc?method=getCities",
		dataType	: "json",
		success		: function(cities){
			$.each(
				cities,
				function(k, v){
					$("#city_code").append($("<option />").val(v.id).text(v.city));
				}
			)
		}
	});
});


getMovies = function(){
	var city = $("#city_code").val();
	$.ajax({
		url: "Movies.cfc?method=getMovies&cityId=" + city,
		dataType: "json",
		success: function(movies){
			$.each(movies, function(k, v){
				$("#movie_id").append($("<option />").val(v.id).text(v.title));
			})
		}
	});
}


getDate = function(){
	var movie = $("#movie_id").val();
	$.ajax({
		url: "Movies.cfc?method=getDates&movieId=" + movie,
		dataType: "json",
		success: function(dates){
			$.each(dates, function(k, v){
				$("#movie_id1").append($("<option />").val(v).text(v));
			})
		}
	});
}
