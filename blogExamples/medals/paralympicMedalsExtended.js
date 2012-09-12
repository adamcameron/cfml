$(document).ready(
	function(){
		$.ajax({
			url			: "http://adamcameroncoldfusion.cfmldeveloper.com/paralympicmedals/paralympicMedalsExtendedFinal.cfm",
			dataType	: "jsonp",
			data		: {handler:"displayItInMain"},
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
	
		displayItInMain = function(data){
			$("#medalsMain").html(data.table);
		};
	}
);