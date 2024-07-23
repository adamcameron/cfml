component {

	remote struct function myRemoteMethod(){
		return {
			ts = now(),
			uuid = createUuid()
		};
	}

}