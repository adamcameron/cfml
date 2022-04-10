<cfscript>
	o = new shared.cf.cfcs.new.nohyphenpath.c();

	writeOutput(o.f());

	try {
//		o = new shared.cf.cfcs.new.hyphen-path.c();
//		writeOutput(o.f());
	} catch(any e){
		// writeOutput("[#e.message#][#e.detail#]<br />")
	}

	try {
		o = new shared.cf.cfcs.new["hyphen-path"].c();
		writeOutput(o.f());
	} catch(any e){
		// writeOutput("[#e.message#][#e.detail#]<br />")
	}
</cfscript>