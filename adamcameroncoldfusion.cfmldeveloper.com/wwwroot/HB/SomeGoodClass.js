// SomeGoodClass.js
HB.somepackage = HB.somepackage || {};

HB.somepackage.SomeGoodClass = function(someSelector, someOtherSelector){
	this.someSelector = someSelector;
	this.someOtherSelector = someOtherSelector;
};

HB.somepackage.SomeGoodClass.prototype.doSomeStuff = function(){
	var $obj = $(this.someSelector);
	console.log($obj.data("somevalue"));
};