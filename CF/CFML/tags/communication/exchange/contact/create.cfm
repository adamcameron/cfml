<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfscript>
		iTest		= 3;
		stContact	= {
			Assistant			= "Test #iTest# Assistant",
			Attachments			= expandPath("./") & "space in name.jpg",
			BusinessAddress		= {
				street			=
"3 Tun Yard
Peardon Street
Clapham",
				city			= "London",
				zip				= "SW8 3HT"
			},
			BusinessFax			= "Test #iTest# Bus. Fax",
			BusinessPhoneNumber	= "Test #iTest# Bus. Ph.",
			Categories			= "Test Cat #iTest#, Test Cat #iTest+1#",
			Company				= "Test #iTest# Company",
			Department			= "Test #iTest# Dept",
			Description			= "Test #iTest# Desc",
			DisplayAs			= "Test #iTest# Display As",
			Email1				= "Test#iTest#@email1.address",
			Email2				= "Test#iTest#@email2.address",
			Email3				= "Test#iTest#@email3.address",
			FirstName			= "Test#iTest# First Name",
			HomeAddress			= {
				street			=
"9a Waldron Road
Earlsfield",
				city			= "London",
				zip				= "SW18 3TB"
			},
			HomePhoneNumber		= "Test#iTest# Home phone",
			JobTitle			= "Test#iTest# Job Title",
			LastName			= "Test#iTest# Last Name",
			MailingAddressType	= "Other",
			Manager				= "Test#iTest# Manager",
			MiddleName			= "Test#iTest# Middle Name",
			MobilePhoneNumber	= "Test#iTest# Mob. Ph.",
			NickName			= "Test#iTest# Nick Name",
			Office				= "Test#iTest# Office",
			OtherAddress		= {
				street			=
"34 Aldred Road
Remuera",
				city			= "Auckland",
				country			= "NEW ZEALAND"
			},
			OtherPhoneNumber	= "Test#iTest# Other Ph.",
			Pager				= "Test#iTest# Pager",
			Profession			= "Test#iTest# Profession",
			SpouseName			= "Test#iTest# Spouse Name",
			WebPage				= "www.test#iTest#.webpage"
		};
	</cfscript>


	<cfexchangecontact	action		= "create"
					    contact		= "#stContact#"
					    connection	= "connExch"
					    result		= "sUid">


	<cfdump var="#sUid#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>