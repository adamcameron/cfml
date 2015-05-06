// bindSomeBadClassToSomeHtml.js
$(document).ready(function() {
	var firstOne = new HB.somepackage.SomeBadClass("#firstOneMaster", "#firstOneDetail");
	var secondOne = new HB.somepackage.SomeBadClass("#secondOneMaster", "#secondOneDetail");

	firstOne.doSomeStuff();
	secondOne.doSomeStuff();
});