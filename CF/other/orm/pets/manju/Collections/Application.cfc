<!---
Name for the application
--->
<cfset this.name = "ORM_Collections">

<!---
ormenabled should be set to true so that ORM is enabled for this application
--->
<cfset this.ormenabled = "true">

<!---
Set the datasource that needs to be used by the ORM Functions.  You can also set this in the ormsettings struct.
--->
<cfset this.datasource = "cfartgallery">

<!---
Set the dialect.  Dialect is one of the setting that you can set in ormsettings struct.  For details on the other ORM settings, refer ORM documentation.
--->
<cfset this.ormsettings = {Dialect="derby"}>

