<<<<<<< HEAD
// Numbers.cfc
=======
>>>>>>> 72663db6aaf617f45924c7a4140b3f92a3318b87
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