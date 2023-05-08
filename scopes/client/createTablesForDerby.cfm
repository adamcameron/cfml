<!---- Create the Client variable storage tables in a datasource.
This example applies to Derby databases. --->
<cfset dsn = "clientvars">
<cfquery name="data1" datasource="#DSN#">
CREATE TABLE CDATA
(
cfid char(20),
app char(64),
data clob
)
</cfquery>

<cfquery name="data2" datasource="#DSN#">
    CREATE UNIQUE INDEX id1
    ON CDATA (cfid,app)
</cfquery>

<cfquery name="global1" datasource="#DSN#">
CREATE TABLE CGLOBAL
(
cfid char(20),
data clob,
    lvisit timestamp
)
</cfquery>

<cfquery name="global2" datasource="#DSN#">
    CREATE INDEX id2
    ON CGLOBAL (cfid)
</cfquery>

<cfquery name="global2" datasource="#DSN#">
    CREATE INDEX id3
    ON CGLOBAL (lvisit)
</cfquery>
