$( document ).ready(function() {
	var accountHolder = new HB.accounts.Person("#accountHolder", 'input[name="firstName"]', 'input[name="lastName"]');
	var accountContact = new HB.accounts.Person("#accountContact", 'input[name="firstName"]', 'input[name="lastName"]');

	$("#theFirstButton").click(function(){
		$("#nameHere").html(accountHolder.getFullName());
	});
	$("#theSecondButton").click(function(){
		HB.accounts.Person.displayFullNameControl($("#fullNameControlHere"));
	});
});
