<!DOCTYPE html>
<cfsilent>
    <cfparam name="request.beerId" type="integer" default="0">
    <cfparam name="request.breweryId" type="integer" default="0">
    <cfparam name="request.beerName" type="string" default="">
    <cfparam name="request.beerType" type="string" default="">
    <cfparam name="request.beerABV" type="numeric" default="0">
    <cfparam name="request.beerIBU" type="numeric" default="0">

    <cfif request.beerId GT 0>
        <cfquery name="getBeer">
            SELECT  id
                    ,breweryId
                    ,name
                    ,type
                    ,abv
                    ,ibu
            FROM dbo.Beer
            WHERE id = <cfqueryparam value="#request.beerId#" cfsqltype="cf_sql_integer">
        </cfquery>
    </cfif>
    <cfif request.beerId GT 0 AND getBeer.recordcount>
        <cfif StructKeyExists( request, "submit" )>
            <cfquery>
                UPDATE dbo.Beer
                SET breweryId = <cfqueryparam value="#request.breweryId#" cfsqltype="cf_sql_integer">
                    ,name = <cfqueryparam value="#request.beerName#" 
                          null="#!Len( Trim( request.beerName ) )#" cfsqltype="cf_sql_varchar">
                    ,type = <cfqueryparam value="#request.beerType#" 
                          null="#!Len( Trim( request.beerType ) )#" cfsqltype="cf_sql_varchar">
                    ,abv = <cfqueryparam value="#request.beerABV#" null="#!Len( Trim( request.beerABV ) )#" 
                          cfsqltype="cf_sql_decimal">
                    ,ibu = <cfqueryparam value="#request.beerIBU#" null="#!Len( Trim( request.beerIBU ) )#" 
                          cfsqltype="cf_sql_decimal">
                WHERE id = <cfqueryparam value="#request.beerId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfset subtitle = "Edit Beer">
        <cfelseif StructKeyExists( request, "edit" )>
            <cfset request.breweryId = getBeer.breweryId>
            <cfset request.beerName = getBeer.name>
            <cfset request.beerType = getBeer.type>
            <cfset request.beerABV = getBeer.abv>
            <cfset request.beerIBU = getBeer.ibu>
            <cfset subtitle = "Edit Beer">
        <cfelseif StructKeyExists( request, "delete" )>
            <cfquery>
                DELETE FROM dbo.Beer
                WHERE id = <cfqueryparam value="#request.beerId#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cflocation url="beer-list.cfm" addtoken="false">
        </cfif>
    <cfelseif StructKeyExists( request, "submit" ) AND request.beerId EQ 0>
        <cfquery>
            INSERT INTO dbo.Beer
            ( breweryId, name, type, abv, ibu )
            VALUES ( <cfqueryparam value="#request.breweryId#" cfsqltype="cf_sql_integer">
                    ,<cfqueryparam value="#request.beerName#" null="#!Len( Trim( request.beerName ) )#" 
                      cfsqltype="cf_sql_varchar">
                    ,<cfqueryparam value="#request.beerType#" null="#!Len( Trim( request.beerType ) )#" 
                      cfsqltype="cf_sql_varchar">
                    ,<cfqueryparam value="#request.beerABV#" null="#!Len( Trim( request.beerABV ) )#" 
                      cfsqltype="cf_sql_decimal">
                    ,<cfqueryparam value="#request.beerIBU#" null="#!Len( Trim( request.beerIBU ) )#" 
                      cfsqltype="cf_sql_decimal">
            )
        </cfquery>
        <cfset subtitle = "Edit Beer">
    <cfelse>
        <cfset subtitle = "Add Beer">
    </cfif>

    <cfquery name="getBreweries">
        SELECT  id
                ,name
        FROM dbo.Brewery
        ORDER BY name ASC
    </cfquery>

    <cfquery name="getTypes">
        SELECT DISTINCT type
        FROM dbo.Beer
        ORDER by type ASC
    </cfquery>
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
                                Beer List
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
                    <form class="form-horizontal" action="beer-edit.cfm" name="beerForm" 
                          method="post">
                        <input id="beerId" name="beerId" type="hidden" value="#request.beerId#">
                        <div class="form-group">
                            <label for="beerName" class="col-sm-2 control-label">
                                Name
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="beerName" 
                                       name="beerName" placeholder="Beer Name" 
                                       value="#request.beerName#" required="required">
                                <span id="helpBlock" class="help-block">
                                    <p class="text-danger">Required</p>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="breweryId" class="col-sm-2 control-label">
                                Brewery
                            </label>
                            <div class="col-sm-10">
                                <select class="form-control" id="breweryId" name="breweryId" 
                                        required="required">
                                    <option value="0" 
                                        <cfif request.breweryId EQ 0>selected="selected"</cfif>>
                                        -Select a Brewery-</option>
                                    <cfloop query="getBreweries">
                                        <option value="#getBreweries.id#" 
                                            <cfif getBreweries.id EQ request.breweryId>selected="selected"</cfif>>
                                            #getBreweries.name#</option>
                                    </cfloop>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="beerType" class="col-sm-2 control-label">
                                Style
                            </label>
                            <div class="col-sm-10">
                                <select class="form-control" id="beerType" name="beerType" 
                                        required="required">
                                    <option value="" 
                                        <cfif request.beerType IS "">selected="selected"</cfif>>
                                        -Select a Style-</option>
                                    <cfloop query="getTypes">
                                        <option value="#getTypes.type#" 
                                            <cfif request.beerType IS getTypes.type>selected="selected"</cfif>>
                                            #getTypes.type#</option>
                                    </cfloop>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="beerABV" class="col-sm-2 control-label">
                                ABV
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="beerABV" name="beerABV"
                                       placeholder="Alcohol Content" value="#request.beerABV#">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="beerIBU" class="col-sm-2 control-label">
                                IBU
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="beerIBU" name="beerIBU"
                                       placeholder="Bitterness Units" value="#request.beerIBU#">
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
                                <a href="beer-list.cfm" class="btn btn-warning" role="button">
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