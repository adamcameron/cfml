fields = [
    {"name":"title"},
    {"name":"main_image"},
    {"name":"layout"},
    {"name":"teaser"},
    {"name":"main_content"},
    {"name":"sidebar_content"},
    {"name":"active"}
];

for (field of fields){
	if (field.name == "layout") {
		i = fields.findIndex(function(field){
				return field.name == "layout";
		});
		fields.splice(i,1);
	}
}

console.dir(fields);
