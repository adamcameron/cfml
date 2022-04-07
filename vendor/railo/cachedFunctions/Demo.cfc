// Demo.cfc
component {

	function heavyLifting(required string label) cachedwithin=createTimespan(0,0,0,5) {
		writeOutput("Executed for #label# at: #timeFormat(now(), 'HH:MM:SS')#<br>");
		sleep(1000);
	}

}