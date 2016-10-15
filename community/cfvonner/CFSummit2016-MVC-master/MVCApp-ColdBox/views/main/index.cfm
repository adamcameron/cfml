<cfoutput>
    <div id="home" class="page-header">
        <ol class="breadcrumb">
            <li>
                <a href="/">
                    Home
                </a>
            </li>
            <li class="active">
                MVC Demo - ColdBox
            </li>
        </ol>
        <h1>#getSetting( 'h1Title' )#</h1>
    </div>
    <div class="container">
        <ul>
            <li>
                <a href="#event.buildLink( 'brewery.list' )#">Brewery List</a>
            </li>
            <li>
                <a href="#event.buildLink( 'beer.list' )#">Beer List</a>
            </li>
        </ul>
    </div>
</cfoutput>