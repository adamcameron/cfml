<cflog file="redirect1" text="#getFileFromPath(getCurrentTemplatePath())# TOP">
<cflocation url="./second.cfm" addtoken="false">
<cflog file="redirect1" text="#getFileFromPath(getCurrentTemplatePath())# BOTTOM">