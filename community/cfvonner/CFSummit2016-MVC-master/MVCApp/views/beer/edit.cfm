<cfoutput>
    <div id="home" class="page-header">
        <ol class="breadcrumb">
            <li>
                <a href="/">
                    Home
                </a>
            </li>
            <li>
                <a href="#BuildURL( action='main.default' )#">
                    MVC Demo - FW/1
                </a>
            </li>
            <li>
                <a href="#BuildURL( action='beer.list' )#">
                    Beer List
                </a>
            </li>
            <li class="active">
                #rc.subtitle#
            </li>
        </ol>
        <h1>#rc.appSettings.h1Title#</h1>
    </div>
    <div class="container">
        <form class="form-horizontal" action="#BuildURL( action='beer.save' )#" 
              name="beerForm" method="post">
            <input id="beerId" name="beerId" type="hidden" value="#rc.beerId#">
            <div class="form-group">
                <label for="beerName" class="col-sm-2 control-label">
                    Name
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="beerName" 
                           name="beerName" placeholder="Beer Name" 
                           value="#rc.beerName#" required="required">
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
                            <cfif rc.breweryId EQ 0>selected="selected"</cfif>>
                            -Select a Brewery-</option>
                        <cfloop query="rc.breweries">
                            <option value="#rc.breweries.id#" 
                                <cfif rc.breweryId EQ rc.breweries.id>selected="selected"</cfif>>
                                #rc.breweries.name#</option>
                        </cfloop>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="beerType" class="col-sm-2 control-label">
                    Style
                </label>
                <div class="col-sm-10">
                    <select class="form-control" id="beerType" name="beerType">
                        <option value="" 
                            <cfif rc.beerType IS "">selected="selected"</cfif>>
                            -Select a Style-</option>
                        <cfloop query="rc.beerTypes">
                            <option value="#rc.beerTypes.type#" 
                                <cfif rc.beerType IS rc.beerTypes.type>selected="selected"</cfif>>
                                #rc.beerTypes.type#</option>
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
                           placeholder="Alcohol Content" value="#rc.beerABV#">
                </div>
            </div>
            <div class="form-group">
                <label for="beerIBU" class="col-sm-2 control-label">
                    IBU
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="beerIBU" name="beerIBU"
                           placeholder="Bitterness Units" value="#rc.beerIBU#">
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
                    <a href="#BuildURL( action='beer.list' )#" class="btn btn-warning" role="button">
                        Cancel
                    </a>
                </div>
            </div>
        </form>
    </div>
</cfoutput>