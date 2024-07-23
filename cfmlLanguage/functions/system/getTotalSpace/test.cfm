<cfscript>
	space	= {
		total	= {
			c = getTotalSpace("C:"),
			d = getTotalSpace("D:"),
			e = getTotalSpace("E:"),
			f = getTotalSpace("F:"),
			ram = getTotalSpace("ram:")
		},
		free	= {
			c = getFreeSpace("C:"),
			d = getFreeSpace("D:"),
			e = getFreeSpace("E:"),
			f = getFreeSpace("F:"),
			ram = getFreeSpace("ram:")
		}
	};
</cfscript>
<cfdump var="#variables#">