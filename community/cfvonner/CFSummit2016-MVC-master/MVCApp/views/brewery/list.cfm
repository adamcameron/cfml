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
            <li class="active">
                #rc.subtitle#
            </li>
        </ol>
        <h1>#rc.appSettings.h1Title#</h1>
    </div>
    <div class="container space-bottom">
        <a class="btn btn-default btn-sm" href="#BuildURL( action='brewery.add' )#" role="button">
            <i class="fa fa-plus-square text-success" aria-hidden="true">
            </i>
            <span class="text-success">
                Add Brewery
            </span>
        </a>
    </div>
    <div class="container">
        <table id="breweries" 
               class="table table-bordered 
            table-striped table-hover table-condensed table-dt">
            <thead>
                <th>
                    Name
                </th>
                <th>
                    City
                </th>
                <th>
                    State/Province/Region
                </th>
                <th>
                    Country
                </th>
                <th data-orderable="false">
                </th>
            </thead>
            <tbody>
                <cfloop query="rc.breweries">
                    <tr>
                        <td class="text-left">
                            #rc.breweries.name#
                        </td>
                        <td class="text-left">
                            #rc.breweries.city#
                        </td>
                        <td class="text-left">
                            #rc.breweries.state#
                        </td>
                        <td class="text-left">
                            #rc.breweries.country#
                        </td>
                        <td class="text-center text-nowrap">
                            <a href="#BuildURL( action='brewery.edit', queryString='breweryId=#rc.breweries.id#' )#" 
                               title="Edit" role="button">
                                <i class="fa fa-pencil-square-o text-success" 
                                   aria-hidden="true">
                                </i>
                            </a>
                            &nbsp;
                            <a href="#BuildURL( action='brewery.delete', queryString='breweryId=#rc.breweries.id#' )#" 
                               title="Delete" role="button">
                                <i class="fa fa-trash text-danger" aria-hidden="true">
                                </i>
                            </a>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
</cfoutput>