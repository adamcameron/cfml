// bindSomeGoodClassToSomeHtml.js
$(document).ready(function() {
	var firstOne = new HB.somepackage.SomeGoodClass("#firstOneMaster", "#firstOneDetail");
	var secondOne = new HB.somepackage.SomeGoodClass("#secondOneMaster", "#secondOneDetail");

	firstOne.doSomeStuff();
	secondOne.doSomeStuff();
});