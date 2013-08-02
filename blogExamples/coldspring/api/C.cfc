// C.cfc
component {

	public C function init(required date timestamp){
		this.timestamp = arguments.timestamp;

		writeOutput("C initialised @ #timeFormat(timestamp, "HH:MM:SS.LLL")#<br>");

		return this;
	}

}