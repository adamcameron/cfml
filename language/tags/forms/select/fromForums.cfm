<cfform>
<cfselect	selected	= "Tasmania"
			name		= "states"
			bind		= "cfc:bind.getStates()"
			display		= "display"
			value		= "value"
			bindonload	= "true"
			required	= "yes"
			message		= "Please select the state."
/>
</cfform>