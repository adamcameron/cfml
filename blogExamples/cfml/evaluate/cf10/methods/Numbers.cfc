component {

	variables.maori		= ["tahi", "rua", "toru", "wha"];
	variables.english	= ["one", "two", "three", "four"];

	public function inMaori(number){
		return variables.maori[number];
	}

	public function inEnglish(number){
		return variables.english[number];
	}

}