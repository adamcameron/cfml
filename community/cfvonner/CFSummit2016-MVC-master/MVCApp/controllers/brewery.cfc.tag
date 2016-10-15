<cfcomponent displayname="Brewery controller" accessors="true">
    
    <cfproperty name="breweryService" ><!--- DI in action --->

    <cffunction name="init" access="public" returntype="any">
        <cfargument name="fw" >
        <cfset variables.fw = arguments.fw>
        <cfreturn this>
    </cffunction>
    
    <cffunction name="default" access="public" returntype="void">
        <cfargument name="rc" >
        <cfset variables.fw.redirect( action = 'brewery.list', append = 'none' )>
    </cffunction>
    
    <cffunction name="list" access="public" returntype="void">
        <cfargument name="rc" >
        <cfset rc.breweries = breweryService.getAllBreweries()>
        <cfset rc.subtitle = "Brewery List">
    </cffunction>
    
    <cffunction name="add" access="public" returntype="void">
        <cfargument name="rc" >
        <cfset rc.breweryId = 0>
        <cfset rc.breweryName = "">
        <cfset rc.breweryCity = "">
        <cfset rc.breweryState = "">
        <cfset rc.breweryCountry = "">
        <cfset rc.subtitle = "Add Brewery">
        <cfset variables.fw.setView( "brewery.edit" )>
    </cffunction>
    
    <cffunction name="edit" access="public" returntype="void">
        <cfargument name="rc" >
        <cfif StructKeyExists( rc, "breweryId" ) AND rc.breweryId > 0>
            <cfset var brewery = breweryService.getBrewery( rc.breweryId )>
            <cfset rc.breweryName = brewery.name>
            <cfset rc.breweryCity = brewery.city>
            <cfset rc.breweryState = brewery.state>
            <cfset rc.breweryCountry = brewery.country>
        </cfif>
        <cfset rc.subtitle = "Edit Brewery">
    </cffunction>
    
    <cffunction name="save" access="public" returntype="void">
        <cfargument name="rc" >
        <cfset rc.breweryId = breweryService.save( rc.breweryId, rc.breweryName,
            rc.breweryCity, rc.breweryState, rc.breweryCountry )>
        <cfset rc.subtitle = "Edit Brewery">
        <cfset variables.fw.redirect( action = 'brewery.edit', append = 'breweryId' )>
    </cffunction>
    
    <cffunction name="delete" access="public" returntype="void">
        <cfargument name="rc" >
        <cfif StructKeyExists( rc, "breweryId" ) AND rc.breweryId > 0>
            <cfset breweryService.delete( rc.breweryId )>
        </cfif>
        <cfset variables.fw.redirect( action = 'brewery.list', append = 'none' )>
    </cffunction>
</cfcomponent>