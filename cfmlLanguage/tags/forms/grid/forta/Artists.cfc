<cfcomponent output="false">

   <cfset THIS.dsn="cfartgallery">

   <!--- Get artists --->
   <cffunction name="getArtists" access="remote" returntype="struct">
      <cfargument name="page" type="numeric" required="yes">
      <cfargument name="pageSize" type="numeric" required="yes">
      <cfargument name="gridsortcolumn" type="string" required="no" default="">
      <cfargument name="gridsortdir" type="string" required="no" default="">

      <!--- Local variables --->
      <cfset var artists="">

      <!--- Get data --->
      <cfquery name="artists" datasource="#THIS.dsn#">
      SELECT artistid, lastname, firstname, email
      FROM artists
      <cfif ARGUMENTS.gridsortcolumn NEQ ""
         and ARGUMENTS.gridsortdir NEQ "">
         ORDER BY #ARGUMENTS.gridsortcolumn# #ARGUMENTS.gridsortdir#
      </cfif>
      </cfquery>

      <!--- And return it as a grid structure --->
      <cfreturn QueryConvertForGrid(artists,
                     ARGUMENTS.page,
                     ARGUMENTS.pageSize)>
   </cffunction>

</cfcomponent>