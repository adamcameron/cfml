<cfcomponent displayname="Beer controller" accessors="true">
    
    <cfproperty name="beerService" ><!--- DI in action --->
    <cfproperty name="breweryService" >

    <cffunction name="init" access="public" returntype="any">
        <cfargument name="fw" >
        <cfset variables.fw = arguments.fw>
        <cfreturn this>
    </cffunction>
    
    <cffunction name="default" access="public" returntype="void">
        <cfargument name="rc" >
        <cfset variables.fw.redirect( action = 'beer.list', append = 'none' )>
    </cffunction>
    
    <cffunction name="list" access="public" returntype="void">
        <cfargument name="rc" >
        <cfset rc.beers = beerService.getAllBeers()>
        <cfset rc.subtitle = "Beer List">
    </cffunction>
    
    <cffunction name="add" access="public" returntype="void">
        <cfargument name="rc" >
        <cfset rc.beerId = 0>
        <cfset rc.beerName = "">
        <cfset rc.breweryId = 0>
        <cfset rc.beerType = "">
        <cfset rc.beerABV = "">
        <cfset rc.beerIBU = "">
        <cfset rc.beerTypes = beerService.getBeerTypes()>
        <cfset rc.breweries = breweryService.getAllBreweries()>
        <cfset rc.subtitle = "Add Brewery">
        <cfset variables.fw.setView( "beer.edit" )>
    </cffunction>
    
    <cffunction name="edit" access="public" returntype="void">
        <cfargument name="rc" >
        <cfif StructKeyExists( rc, "beerId" ) AND rc.beerId GT 0>
            <cfset var beer = beerService.getBeer( rc.beerId )>
            <cfset rc.beerName = beer.name>
            <cfset rc.breweryId = beer.breweryId>
            <cfset rc.beerType = beer.type>
            <cfset rc.beerABV = beer.ABV>
            <cfset rc.beerIBU = beer.IBU>
        </cfif>
        <cfset rc.beerTypes = beerService.getBeerTypes()>
        <cfset rc.breweries = breweryService.getAllBreweries()>
        <cfset rc.subtitle = "Edit Beer">
    </cffunction>
    
    <cffunction name="save" access="public" returntype="void">
        <cfargument name="rc" >
        <cfset rc.beerId = beerService.save( rc.beerId, rc.beerName, 
            rc.breweryId, rc.beerType, rc.beerABV, rc.beerIBU )>
        <cfset rc.subtitle = "Edit Beer">
        <cfset variables.fw.redirect( action = 'beer.edit', append = 'beerId' )>
    </cffunction>
    
    <cffunction name="delete" access="public" returntype="void">
        <cfargument name="rc" >
        <cfif StructKeyExists( rc, "beerId" ) AND rc.beerId GT 0>
            <cfset beerService.delete( rc.beerId )>
        </cfif>
        <cfset variables.fw.redirect( action = 'beer.list', append = 'none' )>
    </cffunction>
</cfcomponent>