$(document).ready(
	function(){
		$.ajax({
			url			: "http://adamcameroncoldfusion.cfmldeveloper.com/paralympicmedals/paralympicMedals.cfm",
			dataType	: "jsonp",
			data		: {handler:"displayIt"},
			success		: function(data, textStatus, jqXHR){
			},
			error		: function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR);
				console.log(textStatus);
				console.log(errorThrown);
			},
			complete	: function(jqXHR, textStatus){
			}
		});
	
		displayIt = function(data){
			$("#medals").html(data.table);
		};
	}
);