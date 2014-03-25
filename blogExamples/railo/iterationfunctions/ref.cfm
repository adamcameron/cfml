<cfscript>
	function getData(){
		return [
			{id=1, en="one", mi="tahi"},
			{id=1, en="two", mi="rua"}
		]
	}

	data = getData()
	dump(var=data,label="before")
	data.each(function(v,i,a){
		v.mi = v.mi & " changed by EACH()"
	})
	dump(var=data, label="after each()")

	data = getData()
	data.filter(function(v){
		v.mi = v.mi & " changed by FILTER()"
		return true
	})
	dump(var=data, label="after filter()")

	data = getData()
	data.sort(function(v1,v2){
		v1.mi = v1.mi & " changed by SORT()"
		return sgn(v2.id - v1.id)
	})
	dump(var=data, label="after sort()")

	data = getData()
	mapped = data.map(function(v,i,a){
		v.mi = v.mi & " changed by MAP()"
		return "mapped"
	})
	dump(var=[data,mapped], label="after map()")

	data = getData()
	reduced = data.reduce(function(prev, v, i, a){
		v.mi = v.mi & " changed by REDUCE()"
		return listAppend(prev, "REDUCED_#v.mi#")
	}, "START")
	dump(var=[data,reduced], label="after map()")

</cfscript>