// Movie.cfc

component {

	public Movie function init(required title, required year, required Person director) {
		variables.title   = title
		variables.year    = year
		variables.director= director

		return this
	}

	public function get() {
		return [
			title   = title,
			year    = year,
			director= director.getFullName()
		]
	}

	public function getDirector(){
		return director
	}

}