<!--- Query the database to fill up the grid. ---> 
<cfquery name = "qCourses" dataSource = "cfdocexamples"> 
	SELECT		Course_ID, Dept_ID, CorNumber, CorName, CorLevel 
	FROM		CourseList 
	ORDER BY	Dept_ID ASC, CorNumber ASC 
</cfquery> 

<cfscript>
	stGridArgs		= {
		name			= "FirstGrid",
		format			= "html",
		height			= 320,
		width			= 580,
		font			= "Tahoma",
		fontsize		= 12,
		striperows		= true,
		striperowcolor	= "##E0E0E0",
		query			= "qCourses",
		href			= "/shared/cf/cfml/tags/forms/grid/urlTests.cfm",
		appendKey		= true,
		selectMode		= "Single",
		hrefKey			= "course_id"
		
	};
</cfscript>


<cfform> 
	<cfgrid attributecollection="#stGridArgs#"></cfgrid> 
</cfform>

<cfdump var="#URL#">