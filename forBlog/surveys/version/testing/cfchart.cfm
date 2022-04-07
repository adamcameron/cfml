<cfset chartArgs = {
	chartwidth		= "800",
	chartheight		= "600",
	format			= "html",
	type			= "pie",
	legend			= {
		"layout"			: "vertical",
		"margin"			: "420 5 5 580",
		"width"				: "75px",
		"shadow"			: false,
		"background-color"	: "##ffffff",
		"border-width"		: "0px",
		"item"				: {
			"border-width"	: "0px"
		}
	},
	tooltip			= {
		"visible"			: true,
		"border-width"		: "0px"
	},
	plot			= {
		"background-color"	: "##ffffff",
		"alpha"				: 1,
		"border-width"		: "1px",
		"offset"			: 2,
		"tooltip-text"		: "%v",
		"detach"			: true,
		"value-box"			: {
			"font-color"		: "##ffffff",
			"text"				: "%npv%",
			"placement"			: "out",
			"connected"			: false,
			"offset-r"			: "-20px"
		}
	},
	plotarea		= {
		margin				: "0 300 0 0",
		"background-color"	: "##ffffff"
	}
}>


<cfchart attributecollection="#chartArgs#">
	<cfchartseries colorlist="##e2cf56,##8a56e2,##aee256,##56e289,##e25668">
		<cfchartdata value="0" item="10,0,0,282462">
		<cfchartdata value="35" item="10,0,1,nnnnnn">
		<cfchartdata value="1" item="10,0,0,282462 with a footnote in CFAdmin & the server scope">
		<cfchartdata value="1" item="10,0,0,282462 with a footnote in CFAdmin">
		<cfchartdata value="2" item="Blimin' 'eck, Cameron: does it really matter? ;-)">
	</cfchartseries>
</cfchart>
