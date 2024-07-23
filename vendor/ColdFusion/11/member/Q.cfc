//Q.cfc
component{

	Q function new(required string cols, string types="", any data=[]){
		this.records = queryNew(cols, types, data);
		return this;
	}

	Q function addColumn(required string col, required string type, required array data){
		this.records.addColumn(col, type, data);
		return this;
	}

	Q function addRow(numeric rows=1, array data){
		if (structKeyExists(arguments, "data")){
			this.records.addRow(col);
		}else{
			this.records.addRow(col, data);
		}
		return this;
	}

	Q function setCell(required string col, required any value, numeric row){
		if (structKeyExists(arguments, "row")){
			this.records.setCell(col, value, row);
		}else{
			this.records.setCell(col, value);
		}
		return this;
	}

	Q function execute(required string sql, any params=[], struct options){
		if (structKeyExists(arguments, "options")){
			this.records = queryExecute(sql, params, options);
		}else{
			this.records = queryExecute(sql, params);
		}
		return this;
	}

	string function dump(){
		var result="";
		savecontent variable="result" {
			writeDump(var=this.records, attributeCollection=arguments);
		}
		return result;
	}

	string function toJson(){
		return serializeJson(this.records);
	}

}