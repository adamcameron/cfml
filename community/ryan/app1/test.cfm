<cfscript>
o1 = new MyComponent();
o2 = o1.newSelf(tahi="one", rua="two");
writeDump(o2.getProperties());
writeDump(getMetadata(o2));

o3 = new me.adamcameron.myApp.MyComponent();
o4 = o3.newSelf(toru="three", wha="four");
writeDump(o4.getProperties());
writeDump(getMetadata(o4));

sub = new me.adamcameron.myApp.MySubComponent();
subOther = sub.newSelf();
writeDump(getMetadata(subOther));
writeOutput(subOther.someOtherMethod());


</cfscript>
