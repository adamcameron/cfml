// SomeDao.cfc
component {

	echo("SomeDao pseudoconstructor called<br>")

	function init(){
		echo("SomeDao init() called<br>")
		return this
	}

}