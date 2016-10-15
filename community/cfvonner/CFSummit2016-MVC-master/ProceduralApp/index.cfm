<!DOCTYPE html>
<html lang="en">
    <head>
        <cfinclude template="header.cfm">
        <title>Procedural Demo</title>
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
                        <li class="active">
                            Procedural Demo
                        </li>
                    </ol>
                    <h1>#application.settings.title#</h1>
                </div>
                <div class="container">
                    <ul>
                        <li>
                            <a href="brewery-list.cfm">Brewery List</a>
                        </li>
                        <li>
                            <a href="beer-list.cfm">Beer List</a>
                        </li>
                    </ul>
                </div>
            </div>
        </cfoutput>
        <cfinclude template="/ProceduralApp/footer.cfm">
    </body>
</html>
