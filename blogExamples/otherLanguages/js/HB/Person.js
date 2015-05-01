HB.accounts = HB.accounts || {};

HB.accounts.Person = function(personContainer, firstNameSelector, lastNameSelector){
	this.$personContainer = $(personContainer);
	this.$firstName = $(firstNameSelector, this.$personContainer);

	this.$lastName = $(lastNameSelector, this.$personContainer);
	this.$fullName = HB.accounts.Person.displayFullNameControl(this.$personContainer);

	this.$personContainer.on("keyup", [firstNameSelector,lastNameSelector], $.proxy(HB.accounts.Person.keyUpHandler, this));
};

HB.accounts.Person.displayFullNameControl = function(el){
	var $fullName = $('<input type="text" name="fullName" value="">');
	el.append("Full name: ");
	$fullName.appendTo(el);
	el.append("<br>");
	return $fullName;
};

HB.accounts.Person.keyUpHandler = function(){
	var fullName = this.getFullName();
	this.setFullName(fullName);
};

HB.accounts.Person.prototype.setFullName = function(fullName){
	this.$fullName.val(fullName);
}

HB.accounts.Person.prototype.getFullName = function(){
	var fullName = this.$firstName.val() + " " + this.$lastName.val();
	return fullName;
};
