<cfscript>
// stackoverflow.cfm

li_1 = "suffix 1"
li_2 = "suffix 2"
temp_content = "content"
	
pages = {
	'Administrator' = {
		'network-administrator' = {
			'title' = 'Network ' & li_1,
			'description' = 'Network ' & li_1 & ' ' & temp_content,
			'post' = '<p>Network ' & li_1 & ' ' & temp_content & '.</p>'
		},
		'database administrator' = {
			'title' = 'Database ' & li_1,
			'description' = 'Database ' & li_1 & ' ' & temp_content,
			'post' = '<p>Database ' & li_1 & ' ' & temp_content & '.</p>'
		}
	},
	'Analyst' = {
		'business systems analyst' = {
			'title' = 'Business Systems ' & li_2,
			'description' = 'Business Systems ' & li_2 & ' ' & temp_content,
			'post' = '<p>Business Systems ' & li_2 & ' ' & temp_content & '.</p>'
		},
		'data-analyst' = {
			'title' = 'Data ' & li_2,
			'description' = 'Data ' & li_2 & ' ' & temp_content,
			'post' = '<p>Data ' & li_2 & ' ' & temp_content & '.</p>'
		}
	}
}

newPages = pages.map(function(key,value){
	return value.reduce(function(reduction, key, value){
		key = key.replace("-", " ", "all")
		reduction[key] = value
		return reduction
	}, {})
})

dump([pages, newPages])
</cfscript>