<cfscript>
function getRelativeNew(abspath) {
        var currentPath = ListToArray(GetDirectoryFromPath(GetBaseTemplatePath()),"\/");
        var filePath = ListToArray(abspath,"\/");
        var relativePath = ArrayNew(1);
        var pathStart = 0;
        var i = 0;

        /* Define the starting path (path in common) */
        for (i = 1; i LTE ArrayLen(currentPath); i = i + 1) {

                if (currentPath[i] NEQ filePath[i]) {
                        pathStart = i;
                        break;
                }
        }

        if (pathStart GT 0) {
                /* Build the prefix for the relative path (../../etc.) */
                for (i = ArrayLen(currentPath) - pathStart ; i GTE 0 ; i = i - 1) {
                        ArrayAppend(relativePath,"..");
                }

                /* Build the relative path */
                for (i = pathStart; i LTE ArrayLen(filePath) ; i = i + 1) {
                        ArrayAppend(relativePath,filePath[i]);
                }
        }

        /* Same level */
        else
                ArrayAppend(relativePath,filePath[ArrayLen(filePath)]);

        /* Return the relative path */
        return ArrayToList(relativePath,"/");
}

function getRelativeOld(abspath) { 
       var currentPath = ListToArray(GetDirectoryFromPath(GetBaseTemplatePath()),"\/");
       var filePath = ListToArray(abspath,"\/");
       var relativePath = ArrayNew(1);
       var pathStart = 0;
       var i = 0;

       /* Define the starting path (path in common) */
       for (i = 1; i LTE ArrayLen(currentPath); i = i + 1) {

               if (currentPath[i] NEQ filePath[i]) {
                       pathStart = i;
                       break;
               }
       }

       /* Build the prefix for the relative path (../../etc.) */
       for (i = ArrayLen(currentPath) - pathStart ; i GTE 0 ; i = i - 1) {
               ArrayAppend(relativePath,"..");
       }

       /* Build the relative path */
       for (i = pathStart; i LTE ArrayLen(filePath) ; i = i + 1) {
               ArrayAppend(relativePath,filePath[i]);
       }

       /* Return the relative path */
       return ArrayToList(relativePath,"/");
}



</cfscript>

<cfoutput>
	#getRelativeOld(getCurrentTemplatePath())#
	
</cfoutput>