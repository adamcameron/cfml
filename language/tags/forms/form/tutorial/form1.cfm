<cfparam name="form.firstName" default="">
<cfparam name="form.lastName" default="">

<cfparam name="form.sex" default="">

<cfparam name="form.age" default="">

<cfparam name="form.email" default="">
<cfparam name="form.telephone" default="">
<cfparam name="form.faxNumber" default="">

<cfparam name="form.colour" default="">
<cfparam name="form.animal" default="">
<cfparam name="form.thumbnailPic" default="">

<cfdirectory action="list" directory="#expandPath('./')#" name="qPics" filter="*.jpg">
<!---
<cfscript>
	qPics = queryNew("fname");
	queryAddRow(qPics);	querySetCell(qPics, "fname", "file1");
	queryAddRow(qPics);	querySetCell(qPics, "fname", "file2");
	queryAddRow(qPics);	querySetCell(qPics, "fname", "file3");
</cfscript>
 --->

<cfform method="post" action="./form1.cfm" format="flash" width="500" height="400" skin="haloorange">
	<cfformgroup type="tabnavigator">
		<cfformgroup type="page" label="Personal Details">
			<cfformgroup type="horizontal" label="Name" tooltip="Enter your name">
				<cfinput name="firstName" type="text" label="First" width="200" value="#form.firstName#" required="true" />
				<cfinput name="lastName" type="text" label="Last" width="200" value="#form.lastName#" required="true" />
			</cfformgroup>
		</cfformgroup>

		<cfformgroup type="page" label="Additional Details">
			<cfformgroup type="vertical" label="Sex">
				<cfinput name="sex" type="radio" label="Male" value="Male" checked="#iif(form.sex eq 'Male', true, false)#" />
				<cfinput name="sex" type="radio" label="Female" value="Female" checked="#iif(form.sex eq 'Female', true, false)#" />
			</cfformgroup>

			<cfformgroup type="vertical" label="Age">
				<cfinput name="age" type="radio" label="18-30" value="18-30" checked="#iif(form.age eq '18-30', true, false)#" />
				<cfinput name="age" type="radio" label="31-40" value="31-40" checked="#iif(form.age eq '31-40', true, false)#" />
				<cfinput name="age" type="radio" label="41 and over" value="41 and over" checked="#iif(form.age eq '41 and over', true, false)#" />
			</cfformgroup>
		</cfformgroup>

		<cfformgroup type="page" label="Contact Details">
			<cfformgroup type="horizontal" label="Contact">
				<cfinput name="email" type="text" label="Email" value="#form.email#" required="true" />
				<cfinput name="telephone" type="text" label="Telephone" value="#form.telephone#" />
				<cfinput name="faxNumber" type="text" label="Fax" value="#form.faxNumber#" />
			</cfformgroup>
		</cfformgroup>

		<cfformgroup type="page" label="Trivial Details">
			<cfformgroup type="vertical" label="Stuff">
				<cfselect name="colour">
					<cfloop index="sColour" list="Red,Orange,Yellow,Green,Blue,Indigo,Violet">
						<cfoutput><option<cfif form.colour eq sColour> selected="selected"</cfif>>#sColour#</option></cfoutput>
					</cfloop>
				</cfselect>
				<cfselect name="animal">
					<cfloop index="sAnimal" list="Bandicoot,Fish,Marmoset,Ocelot,Octopus,Pangolin,Wombat">
						<cfoutput><option<cfif form.animal eq sAnimal> selected="selected"</cfif>>#sAnimal#</option></cfoutput>
					</cfloop>
				</cfselect>
				<cfselect name="thumbnailPic" query="qPics" text="name" value="name" />
				<cfformitem type="html" height="100" width="100" bind='<p><img src="/shared/cf/cfml/F/form/tutorial/{thumbnailPic.text}" height="80" width="60" /></p>' />
			</cfformgroup>
		</cfformgroup>

		<cfformgroup type="page" label="Summary">
			<cfformitem type="text" bind="Name: {firstName.text} {lastName.text}" />
			<cfformitem type="text" bind="Sex: {sex.selectedData}" />
			<cfformitem type="text" bind="Age: {age.selectedData}" />
			<cfformitem type="hrule" />
			<cfformitem type="text" bind="Email: {email.text}" />
			<cfformitem type="text" bind="Tel No: {telephone.text}" />
			<cfformitem type="text" bind="Fax No: {faxNumber.text}" />
		</cfformgroup>



	</cfformgroup>

	<cfinput type="submit" name="submit" value="Send Details" />

</cfform>
<cfif structKeyExists(form, "fieldNames")>
<cfdump var="#form#">
</cfif>
