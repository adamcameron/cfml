component implements="cfide.orm.iinterceptor" {

	function onInsert(required any cfc, required struct data){}

	function onLoad(required any cfc, required struct data){}

	function onUpdate(required any cfc, required struct previousData, required struct currentData){}

	function onDelete(required any cfc){}

}
