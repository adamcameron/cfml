<cfscript>
    variables['c_test']=createObject('component','cfcFile');
    variables['s_test']=variables['c_test']['f_public']();
    writeDump(var=variables);
</cfscript>
