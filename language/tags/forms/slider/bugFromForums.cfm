<cfform name="form01"> 
    <cfslider
		name		= "slider1" 
		format		= "HTML" 
		vertical	= "false" 
		width		= "350" 
		value		= "100" 
		min			= "0" 
		max			= "200" 
		increment	= "10" 
		tip			= "true"
	/> 
	<cfinput type="submit" name="btnSubmit" value="Go" />
</cfform> 

<cfdump var="#form#">