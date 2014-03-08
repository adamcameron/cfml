<cfscript>
// basicExample.cfm
include "createLocalisedDayOfWeekAsInteger.cfm";

LSDayOfWeekAsIntegerFR = createLocalisedDayOfWeekAsInteger("fr_fr");

writeOutput("Dimanche is day of week: #LSDayOfWeekAsIntegerFR("dimanche")#");
</cfscript>