Creating TBL_PERSON table<br />
<cftry>
	<cfquery datasource="intranet">
		CREATE TABLE tbl_person (
			prs_id NUMBER(*,0) NOT NULL ENABLE,
			prs_name VARCHAR2(20 CHAR),
	 		CONSTRAINT tbl_person_pk PRIMARY KEY (prs_id) ENABLE
		)
	</cfquery>
	Table created<br />
	<cfcatch type="database">
		Table already existed<br />
		Clearing TBL_PERSON table<br />
		<cfquery datasource="intranet">
			DELETE FROM tbl_person
		</cfquery>
		Cleared TBL_PERSON table<br />
	</cfcatch>
	<cfcatch type="any">
		<cfrethrow>
	</cfcatch>
</cftry>

Inserting data into TBL_PERSON table<br />
<cfset aNames=listToArray("Adam,Barbara,Charlie,Donna,Eric,Felicity,Graham,Helen,Ian,Janet")>
<cfloop index="i" from="1" to="#arrayLen(aNames)#">
	<cfquery datasource="intranet">
		INSERT INTO tbl_person (
			prs_id, prs_name
		) values (
			<cfqueryparam value="#i#">,
			<cfqueryparam value="#aNames[i]#">
		)
	</cfquery>
	<cfoutput>[#i#][#aNames[i]#] inserted<br /></cfoutput>
</cfloop>


Creating TBL_PRS_LOCATION table<br />
<cftry>
	<cfquery datasource="intranet">
		CREATE TABLE tbl_prs_location (
			loc_id NUMBER(*,0) NOT NULL ENABLE,
			prs_id NUMBER(*,0),
			loc_name VARCHAR2(20 CHAR)	/* not normalised for purposes of clarity */,
			CONSTRAINT tbl_prs_location_pk PRIMARY KEY (loc_id) ENABLE,
			CONSTRAINT tbl_prs_location_tbl_pers_fk1 FOREIGN KEY (prs_id) REFERENCES tbl_person (prs_id) ON DELETE SET NULL ENABLE
		)
	</cfquery>
	Table TBL_PRS_LOCATION created<br />
	<cfcatch type="database">
		Table TBL_PRS_LOCATION already existed<br />
		Clearing  TBL_PRS_LOCATION table<br />
		<cfquery datasource="intranet">
			DELETE FROM tbl_prs_location
		</cfquery>
		Cleared TBL_PRS_LOCATION table<br />
	</cfcatch>
	<cfcatch type="any">
		<cfrethrow>
	</cfcatch>
</cftry>


Inserting data into TBL_PRS_LOCATION table<br />
<cfset lPlaces="1;2;Bangkok,2;4;Dublin,3;6;Frankfurt,4;8;Harare,5;10;Johannesburg">
<cfloop index="lLocation" list="#lPlaces#">
	<cfset iId = listGetAt(lLocation, 1, ";")>
	<cfset iFk = listGetAt(lLocation, 2, ";")>
	<cfset sLoc = listGetAt(lLocation, 3, ";")>
	<cfquery datasource="intranet">
		INSERT INTO tbl_prs_location (
			loc_id, prs_id, loc_name
		) values (
			<cfqueryparam value="#iId#">,
			<cfqueryparam value="#iFk#">,
			<cfqueryparam value="#sLoc#">
		)
	</cfquery>
	<cfoutput>[#iId#][#iFk#][#sLoc#] inserted<br /></cfoutput>
</cfloop>

<cfquery name="qNoTags" datasource="intranet">
	select		prs_id, prs_name
	from		tbl_person p
	inner join	(
		select
	) t
	on	p.prs_id = t.prs_id
</cfquery>


<!---
Dropping TBL_PRS_LOCATION table<br />
<cftry>
	<cfquery datasource="intranet">
		DROP TABLE tbl_prs_location
	</cfquery>
	Table TBL_PRS_LOCATION dropped<br />
	<cfcatch type="database">
		Error dropping TBL_PRS_LOCATION table<br />
	</cfcatch>
	<cfcatch type="any">
		<cfrethrow>
	</cfcatch>
</cftry>

Dropping TBL_PERSON table<br />
<cftry>
	<cfquery datasource="intranet">
		DROP TABLE tbl_person
	</cfquery>
	Table TBL_PERSON dropped<br />
	<cfcatch type="database">
		Error dropping TBL_PERSON table<br />
	</cfcatch>
	<cfcatch type="any">
		<cfrethrow>
	</cfcatch>
</cftry>
 --->