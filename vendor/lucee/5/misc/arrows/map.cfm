<cfscript>
peopleData = {"2008-11-08" = "Jacinda", "1990-10-27" = "Bill", "2014-09-20" = "James", "1979-05-24" = "Winston"}

people = peopleData.map((date, name) => new IndexedPerson(date, name))

people.each((date, person) => echo("#date# => #person#<br>"))
</cfscript>