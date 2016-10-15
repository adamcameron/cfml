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
        <a class="btn btn-default btn-sm" href="#BuildURL( action='beer.add' )#" role="button">
            <i class="fa fa-plus-square text-success" aria-hidden="true">
            </i>
            <span class="text-success">
                Add Beer
            </span>
        </a>
    </div>
    <div class="container">
        <table id="beers" 
               class="table table-bordered 
            table-striped table-hover table-condensed table-dt">
            <thead>
                <th>
                    Name
                </th>
                <th>
                    Brewery
                </th>
                <th>
                    Type
                </th>
                <th>
                    <a href="##" data-toggle="tooltip" 
                        title="Alcohol By Volume">ABV</a>
                </th>
                <th>
                    <a href="##" data-toggle="tooltip" 
                        title="International Bitterness Units">IBU</a>
                </th>
                <th data-orderable="false">
                </th>
            </thead>
            <tbody>
                <cfloop query="rc.beers">
                    <tr>
                        <td class="text-left">
                            #rc.beers.name#
                        </td>
                        <td class="text-left">
                            #rc.beers.breweryName#
                        </td>
                        <td class="text-left">
                            #rc.beers.type#
                        </td>
                        <td class="text-right">
                            #rc.beers.abv#
                        </td>
                        <td class="text-right">
                            #rc.beers.ibu#
                        </td>
                        <td class="text-center text-nowrap">
                            <a href="#BuildURL( action='beer.edit', queryString='beerId=#rc.beers.id#' )#" 
                               title="Edit" role="button">
                                <i class="fa fa-pencil-square-o text-success" 
                                   aria-hidden="true">
                                </i>
                            </a>
                            &nbsp;
                            <a href="#BuildURL( action='beer.delete', queryString='beerId=#rc.beers.id#' )#" 
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