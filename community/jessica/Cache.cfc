// Cache.cfc

component {
	
	d = ".";

	this.cached = {};
	this.protected = [];

	function init(base){
		this.cached = base;
	}

	function setProperty(path, value){
		protect(path);
		var key = path.listLast(d);
		var keyIndex = path.listLen(d);
		var obj = path.listDeleteAt(keyIndex, d).listReduce(function(obj, key){
			return obj[key];
		}, this.cached, d);
		obj[key] = value;
	}

	function protect(path){
		return this.protected.some(function(element){
			return path.listFindNoCase(element, d);
		}, d) ? throw(type="ProtectionException") : true;
	}

}