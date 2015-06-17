<cfscript>
// controller.cfm

person = new Person("Mary", "Midgley")

savecontent variable="dump" {
	writeDump(person)
}

include "view.cfm"
</cfscript>