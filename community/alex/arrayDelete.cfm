<cfscript>
fields = [
    {"name":"title"},
    {"name":"main_image"},
    {"name":"layout"},
    {"name":"teaser"},
    {"name":"main_content"},
    {"name":"sidebar_content"},
    {"name":"active"}
];

writedump(fields); // should have 7 items

for ( field in fields ) {
    if (field.name == "layout") {
        arraydelete(fields, field);
    }
}

filteredFields = fields.filter(function(field){
    return field.name != "layout";
});

writedump(filteredFields); // should now have 6 items

fieldsLen = fields.len();
for (i=1; i <= fieldsLen; i++) {
    if (fields[i].name == "layout") {
        arrayDelete(fields, fields[i]);
    }
}
writedump(fields); // should now have 6 items


</cfscript>