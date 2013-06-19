component extends="com.daccf.cfbugsubscriber.config.Application" {

	public boolean function onApplicationStart(){
		// just blocks the other one
		return true;
	}

	public void function onRequestStart(){
		// just blocks the other one
	}

}