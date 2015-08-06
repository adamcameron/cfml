// Cache.cfc

component {

	this.cached = {};

	function init(base){
		this.cached = base;
	}

	function setProperty(path, value){
		var d = ".";
		var key = path.listLast(d);
		var keyIndex = path.listLen(d);
		var obj = path.listDeleteAt(keyIndex, d).listReduce(function(obj, key){
			return obj[key];
		}, this.cached, d);
		obj[key] = value;
	}

}