// sortHandling.js

$(document).ready(function(){
	var charOrderRules = "a[àáâãäåæ]"; // "a[Æàáâãäåæ]c[ç]e[èéêë]i[ìíîï]n[Ññ]o[òóôõöø]s[š]u[ùúûü]y[ÿý]

	$("#sortByLabel").on("click", function(e){
		var $this = $(this);
		var dir = $this.attr("data-dir");

		tinysort("#sortMe > li", {order:dir, charOrder:charOrderRules});

		var newDir = dir === "asc" ? "desc" : "asc";
		$this.attr("data-dir", newDir);
		$("#currentSort").html(dir);
		return false;
	});


	$("#sortRest").on("click", function(){
		tinysort("#sortMe > li", {order:"asc", attr:"data-id"});
		$("#sortByLabel").attr("data-dir", "asc");
		$("#currentSort").html("ID");
		return false;
	});

	$("input:radio").on("click", function(){
		charOrderRules = $(this).attr("value");
		$("#charOrder").html(charOrderRules);
	});
});	