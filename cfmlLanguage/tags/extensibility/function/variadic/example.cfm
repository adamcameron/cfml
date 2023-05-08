<cfscript>
function f(required numeric number, SomeClass someClass, boolean bool=true){
	writeDump(arguments);
}

f(bool=false, string="something else", number=1);

f(argumentCollection={bool=false, string="something else", number=1});


args = [1,new SomeClass(),false,"something else"];
f(argumentCollection=args);
</cfscript>