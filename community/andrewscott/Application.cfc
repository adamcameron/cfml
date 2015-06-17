// Application.cfc

component {
	this.name="test11";
	this.ormEnabled="true";
	this.datasource="scratch_mysql";
/*
	public void function onError(exception){
		writeLog(file=this.name, type="error", text="Thread: #URL.thread# Iteration: #URL.iteration# [#exception.type#] [#exception.message#] [#exception.detail#]");
		throw(object=exception);
	}
*/
}
