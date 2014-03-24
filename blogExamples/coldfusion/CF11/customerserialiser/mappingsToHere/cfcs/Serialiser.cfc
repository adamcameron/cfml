// Serialiser.cfc
component {

	public function serialize(){
		return "SERIALISED!";
	}

	public function deserialize(){
		return "DESERIALISED!";
	}

	public function canSerialize(){
		return true;
	}

	public function canDeserialize(){
		return true;
	}

}