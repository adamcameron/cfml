<!DOCTYPE html>
<cfsilent>
    <cfparam name="request.breweryId" type="integer" default="0">
    <cfparam name="request.breweryName" type="string" default="">
    <cfparam name="request.breweryCity" type="string" default="">
    <cfparam name="request.breweryState" type="string" default="">
    <cfparam name="request.breweryCountry" type="string" default="">

    <cfif request.breweryId GT 0>
        <!--- Query the database to see if a matching record exists --->
        <cfquery name="getBrewery">
            SELECT  id
                    ,name
                    ,city
                    ,state
                    ,country
            FROM dbo.Brewery
            WHERE id = <cfqueryparam value="#request.breweryId#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cfif>
    <cfif request.breweryId GT 0 AND getBrewery.recordcount>
        <cfif StructKeyExists( request, "submit" )>
            <cfquery>
                UPDATE dbo.Brewery
                SET name = <cfqueryparam value="#request.breweryName#" 
                        null="#!Len( Trim( request.breweryName ) )#" cfsqltype="cf_sql_varchar">
                    ,city = <cfqueryparam value="#request.breweryCity#" 
                        null="#!Len( Trim( request.breweryCity ) )#" cfsqltype="cf_sql_varchar">
                    ,state = <cfqueryparam value="#request.breweryState#" 
                        null="#!Len( Trim( request.breweryState ) )#" cfsqltype="cf_sql_varchar">
                    ,country = <cfqueryparam value="#request.breweryCountry#" 
                        null="#!Len( Trim( request.breweryCountry ) )#" cfsqltype="cf_sql_varchar">
                WHERE id = <cfqueryparam value="#request.breweryId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfset subtitle = "Edit Brewery">
        <cfelseif StructKeyExists( request, "edit" )>
            <cfset request.breweryName = getBrewery.name>
            <cfset request.breweryCity = getBrewery.city>
            <cfset request.breweryState = getBrewery.state>
            <cfset request.breweryCountry = getBrewery.country>
            <cfset subtitle = "Edit Brewery">
        <cfelseif StructKeyExists( request, "delete" )>
            <cfquery>
                DELETE FROM dbo.Brewery
                WHERE id = <cfqueryparam value="#request.breweryId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cflocation url="brewery-list.cfm" addtoken="false">
        </cfif>
    <cfelseif StructKeyExists( request, "submit" ) AND request.breweryId EQ 0>
        <cfquery>
            INSERT INTO dbo.Brewery
            ( name, city, state, country )
            VALUES ( <cfqueryparam value="#request.breweryName#" 
                      null="#!Len( Trim( request.breweryName ) )#" cfsqltype="cf_sql_varchar">
                    ,<cfqueryparam value="#request.breweryCity#" 
                      null="#!Len( Trim( request.breweryCity ) )#" cfsqltype="cf_sql_varchar">
                    ,<cfqueryparam value="#request.breweryState#" 
                      null="#!Len( Trim( request.breweryState ) )#" cfsqltype="cf_sql_varchar">
                    ,<cfqueryparam value="#request.breweryCountry#" 
                      null="#!Len( Trim( request.breweryCountry ) )#" cfsqltype="cf_sql_varchar">
            )
        </cfquery>
        <cfset subtitle = "Edit Brewery">
    <cfelse>
        <cfset subtitle = "Add Brewery">
    </cfif>
</cfsilent>

<html lang="en">
    <head>
        <cfinclude template="header.cfm">
        <title>
            Procedural Demo
        </title>
    </head>
    <body role="document">
        <cfoutput>
            <div class="container" role="main">
                <div id="home" class="page-header">
                    <ol class="breadcrumb">
                        <li>
                            <a href="/">
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="index.cfm">
                                Procedural Demo
                            </a>
                        </li>
                        <li>
                            <a href="brewery-list.cfm">
                                Brewery List
                            </a>
                        </li>
                        <li class="active">
                            #subtitle#
                        </li>
                    </ol>
                    <h1>
                        #application.settings.title#
                    </h1>
                </div>
                <div class="container">
                    <form class="form-horizontal" action="brewery-edit.cfm" name="breweryForm" 
                          method="post">
                        <input id="breweryId" name="breweryId" type="hidden" 
                               value="#request.breweryId#">
                        <div class="form-group">
                            <label for="breweryName" class="col-sm-2 control-label">
                                Name
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="breweryName" 
                                       name="breweryName" placeholder="Brewery Name" 
                                       value="#request.breweryName#" required="required">
                                <span id="helpBlock" class="help-block">
                                    <p class="text-danger">Required</p>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="breweryCity" class="col-sm-2 control-label">
                                City
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="breweryCity" 
                                       name="breweryCity" placeholder="City" 
                                       value="#request.breweryCity#">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="breweryState" class="col-sm-2 control-label">
                                State
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="breweryState" 
                                       name="breweryState" placeholder="State" 
                                       value="#request.breweryState#">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="breweryCountry" class="col-sm-2 control-label">
                                Country
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="breweryCountry" 
                                       name="breweryCountry" placeholder="Country" 
                                       value="#request.breweryCountry#">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary" name="Submit">
                                    Save
                                </button>
                                <button type="reset" class="btn btn-default" name="Reset">
                                    Reset
                                </button>
                                <a href="brewery-list.cfm" class="btn btn-warning" role="button">
                                    Cancel
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </cfoutput>
        <cfinclude template="/ProceduralApp/footer.cfm">
    </body>
</html>