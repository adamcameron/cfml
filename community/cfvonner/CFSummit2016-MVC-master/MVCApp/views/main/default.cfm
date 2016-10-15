<cfoutput>
    <div id="home" class="page-header">
        <ol class="breadcrumb">
            <li>
                <a href="/">
                    Home
                </a>
            </li>
            <li class="active">
                MVC Demo - FW/1
            </li>
        </ol>
        <h1>#rc.appSettings.h1Title#</h1>
    </div>
    <div class="container">
        <ul>
            <li>
                <a href="#BuildURL( action='brewery.list' )#">Brewery List</a>
            </li>
            <li>
                <a href="#BuildURL( action='beer.list' )#">Beer List</a>
            </li>
        </ul>
    </div>
</cfoutput>