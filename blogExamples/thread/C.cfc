component {

	public void function f(){
		var t1 = false;
		thread name="t1" action="run" {
			writeLog(file="t1", text="yup");
		}
	}

}