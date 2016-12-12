import me.adamcameron.accounts.*;

component {

	remote Person function getById(id) {
		return new Person(id, "Zachary", "Cameron Lynch");	
	}

}