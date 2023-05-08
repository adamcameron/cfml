component {

	function init(date, name) {
		this.date = date
		this.name = name
	}

	string function _toString() {
	    return "{date:#this.date#; name: #this.name#}"
	}
}