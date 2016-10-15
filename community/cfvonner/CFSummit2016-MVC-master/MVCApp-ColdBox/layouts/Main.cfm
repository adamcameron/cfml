<!DOCTYPE html>
<html lang="en">
    <cfoutput>
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />
            <link rel="stylesheet" href="/assets/css/bootstrap-theme.min.css" />
            <link rel="stylesheet" href="/assets/css/dataTables.bootstrap.min.css" />
            <link rel="stylesheet" href="/assets/css/font-awesome.min.css" />
            <link rel="stylesheet" href="/assets/css/custom.css" />
            <title>#getSetting( 'title' )#</title>
        </head>
        <body role="document">
            <div class="container" role="main">
                #renderView()#	<!--- body is result of views --->
            </div>
            <footer class="footer">
                <div class="container">
                    <p class="text-muted text-center">
                        ColdFusion Summit 2016
                    </p>
                    <p class="text-muted text-center small">
                        Powered by CFML version #server.coldfusion.productversion#, 
                        ColdBox version #getSetting( 'version', true )#, Bootstrap 3, jQuery, 
                        DataTables, and Font Awesome.<br>
                        This request took <cfoutput>#getTickCount() - rc.startTime#</cfoutput>ms.
                    </p>
                </div>
            </footer>
        </body>
    </cfoutput>
    <script src="/assets/js/jquery-2.2.2.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jquery.dataTables.min.js"></script>
    <script src="/assets/js/dataTables.bootstrap.min.js"></script>
    <script src="/assets/js/global.js"></script>
</html>