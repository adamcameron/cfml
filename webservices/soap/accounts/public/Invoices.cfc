import me.adamcameron.accounts.*;

component wsversion=1 {

	remote Invoice function getByIdAsJson(numeric id) returnformat="json" {
		return getById(id);		
	}

	remote Invoice function getByIdAsWddx(numeric id) returnformat="wddx" {
		return getById(id);		
	}

	private Invoice function getById(id) {
		var address = new Address(1, "London", "United Kingdom", "E18");

		var account = new Account(2, "Adam", "Cameron", "1970-02-17", address);

		var penguin = new Product(3, "Penguin", 4.56);
		var pangolin = new Product(7, "Pangolin", 8.90);
		var platypus = new Product(11, "Playtpus", 12.13);

		var lines = [
			new InvoiceLine(14, penguin, 15, 16.17),
			new InvoiceLine(18, pangolin, 19, 20.21),
			new InvoiceLine(22, platypus, 23, 24.25)
		];

		invoice = new Invoice(id, account, lines);

		return invoice;		
	}

}