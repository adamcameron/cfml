<cfscript>
header name="Content-Type" value="application/json";

try {
result = queryExecute("INSERT INTO customers (given_name) VALUES (?)", [form.given_name], {result="insertion"})
writeOutput(serializeJson({
    result = result,
    insertion = insertion
}))
} catch (any e) {
    writeOutput(serializeJson(e))
}

</cfscript>
