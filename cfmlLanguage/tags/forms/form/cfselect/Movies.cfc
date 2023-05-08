component {

	remote array function getCities() returnformat="JSON" {
		return [
			{"id"=1, "city"="Auckland"},
			{"id"=2, "city"="Dublin"},
			{"id"=3, "city"="London"}
		];
	}

	remote array function getMovies(cityId) returnformat="JSON"{
		switch (cityId){
			case 1 :{
				return [
					{"id"=1, "title"="Alien"},
					{"id"=2, "title"="All Quiet on the Western Front"},
					{"id"=3, "title"="Angel Heart"}
				];
				break;
			}
			case 2 :{
				return [
					{"id"=1, "title"="Das Boot"},
					{"id"=2, "title"="The Day the Earth Stood Still (1951)"},
					{"id"=3, "title"="The Duellists"}
				];
				break;
			}
			case 3 :{
				return [
					{"id"=1, "title"="Lock, Stock and Two Smoking Barrels"},
					{"id"=2, "title"="Lifeboat"},
					{"id"=3, "title"="Life of Brian"}
				];
				break;
			}
		}
	}

	remote array function getDates(movieId) returnformat="JSON"{
		var times = [];
		for (var i=1; i <= 3; i++){
			arrayAppend(times, "1#movieId#:#i##i#");
		}
		return times;
	}

}