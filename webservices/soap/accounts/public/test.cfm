<cfscript>
import me.adamcameron.accounts.*;

address = new Address(1, "London", "United Kingdom", "E18");

account = new Account(2, "Adam", "Cameron", createDate(1970,2,17), address);

penguin = new Product(3, "Penguin", 1.23);
pangolin = new Product(4, "Pangolin", 4.56);
platypus = new Product(5, "Playtpus", 7.89);

lines = [
	penguin,
	pangolin,
	platypus
];

invoice = new Invoice(6, account, lines);
writeDump(invoice);
writeDump(getMetadata(invoice));
writeDump(GetTimeZoneInfo());

</cfscript>