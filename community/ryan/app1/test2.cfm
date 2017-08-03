<cfscript>
o1 = new MyComponent(tahi="one", rua="two");
o2 = o1.newSelf(toru="three", wha="four");
writeDump(o1.getProperties());
writeDump(o2.getProperties());
</cfscript>
