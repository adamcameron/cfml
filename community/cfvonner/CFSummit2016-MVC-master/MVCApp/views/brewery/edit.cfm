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
                <a href="#BuildURL( action='brewery.list' )#">
                    Brewery List
                </a>
            </li>
            <li class="active">
                #rc.subtitle#
            </li>
        </ol>
        <h1>#rc.appSettings.h1Title#</h1>
    </div>
    <div class="container">
        <form class="form-horizontal" action="#BuildURL( action='brewery.save' )#" 
              name="breweryForm" method="post">
            <input id="breweryId" name="breweryId" type="hidden" 
                   value="#rc.breweryId#">
            <div class="form-group">
                <label for="breweryName" class="col-sm-2 control-label">
                    Name
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="breweryName" 
                        name="breweryName" placeholder="Brewery Name" 
                        value="#rc.breweryName#" required="required">
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
                        value="#rc.breweryCity#">
                </div>
            </div>
            <div class="form-group">
                <label for="breweryState" class="col-sm-2 control-label">
                    State
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="breweryState" 
                        name="breweryState" placeholder="State" 
                        value="#rc.breweryState#">
                </div>
            </div>
            <div class="form-group">
                <label for="breweryCountry" class="col-sm-2 control-label">
                    Country
                </label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="breweryCountry" 
                        name="breweryCountry" placeholder="Country" 
                        value="#rc.breweryCountry#">
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
                    <a href="#BuildURL( action='brewery.list' )#" class="btn btn-warning" role="button">
                        Cancel
                    </a>
                </div>
            </div>
        </form>
    </div>
</cfoutput>