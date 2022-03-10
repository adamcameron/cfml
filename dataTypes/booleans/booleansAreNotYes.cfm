<cfscript>
writeDump([
    '"Yes" == "Yes"' = "Yes" == "Yes",
    '"Yes" === "Yes"' = "Yes" === "Yes",
    '"Yes" == true' = "Yes" == true,
    '"Yes" === true' = "Yes" === true,
    'true == true' = true == true,
    'true === true' = true === true,
    '"Yes" == ("Yes" == "Yes")' = "Yes" == ("Yes" == "Yes"),
    'true == ("Yes" == "Yes")' = true == ("Yes" == "Yes"),
    '"Yes" === ("Yes" == "Yes")' = "Yes" === ("Yes" == "Yes"),
    'true === ("Yes" == "Yes")' = true === ("Yes" == "Yes")
])
</cfscript>