// SomeBadClass.js
HB.somepackage = HB.somepackage || {};

HB.somepackage.someSelector = "";
HB.somepackage.someOtherSelector = "";

HB.somepackage.SomeBadClass = function(someSelector, someOtherSelector){
	HB.somepackage.someSelector = someSelector;
	HB.somepackage.someOtherSelector = someOtherSelector;
};

HB.somepackage.SomeBadClass.prototype.doSomeStuff = function(){
	var $obj = $(HB.somepackage.someSelector);
	console.log($obj.data("somevalue"));
};
