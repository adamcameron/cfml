component {
	function get(){
		return queryNew("id,country,Region,District,Person", "integer,varchar,varchar,varchar,varchar", [
			[1, "Australia", "Sydney", "Neutral Bay", "Angela"],
			[2, "Ireland", "Galway", "Renmore", "Bill"],
			[3, "Ireland", "Galway", "Salthill", "Charlotte"]/*,
			[4, "England", "London", "Willesden Green", "Dave"],
			[5, "England", "London", "Willesden Green", "Edith"],
			[6, "England", "London", "Brixton", "Fred"],
			[7, "England", "London", "Brixton", "Gabrielle"],
			[8, "England", "London", "Brixton", "Horace"],
			[9, "England", "London", "Bayswater", "Inga"],
			[10, "England", "London", "Bayswater", "Joe"],
			[11, "England", "Weybridge", "Weybridge", "Kim"],
			[12, "England", "Weybridge", "Weybridge", "Larry"],
			[13, "New Zealand", "Auckland", "Ponsonby", "Marjorie"],
			[14, "New Zealand", "Auckland", "Ponsonby", "Neville"],
			[15, "New Zealand", "Auckland", "Remuera", "Olive"],
			[16, "New Zealand", "Auckland", "Remuera", "Percy"],
			[17, "New Zealand", "Auckland", "Remuera", "Queenie"],
			[18, "New Zealand", "Auckland", "Remuera", "Rupert"],
			[19, "New Zealand", "Auckland", "Remuera", "Sally"],
			[20, "New Zealand", "Auckland", "Mt Eden", "Tim"],
			[21, "New Zealand", "Wellington", "Aro Valley", "Una"],
			[22, "New Zealand", "Wellington", "Ngaio", "Vince"],
			[23, "New Zealand", "Wellington", "Ngaio", "Wanda"],
			[24, "New Zealand", "Wellington", "Newtown", "Xavier"],
			[25, "New Zealand", "Wellington", "Newtown", "Yasmin"],
			[26, "France", "Dordogne", "Limeuil", "Zachary"],
			[27, "France", "Dordogne", "Limeuil", "Andrew"],
			[28, "France", "Dordogne", "Limeuil", "Betty"],
			[29, "France", "Dordogne", "Limeuil", "Chuck"]*/
		]);	
	}
}
