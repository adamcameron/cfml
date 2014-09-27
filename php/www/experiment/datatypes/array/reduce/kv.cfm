<cfscript>
rainbow	= {
	red		="Whero",
	orange	="Karaka",
	yellow	="Kowhai",
	green	="Kakariki",
	blue	="Kikorangi",
	indigo	="Poropango",
	violet	="Papura"
};

result = rainbow.reduce(function(reduction, value, key, all){
	reduction["_#key#"] = value
	return reduction
},{})

dump([rainbow,result])
	
</cfscript>