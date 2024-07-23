<cfscript>
// exception.cfm
try {
	a = [1,2,3];
	a.each(function(){
		throw(type="InsideEachException", message="Blam", detail="An exception raised inside a closure function");
	});
} catch(any e){
	writeDump(e);
}
</cfscript>