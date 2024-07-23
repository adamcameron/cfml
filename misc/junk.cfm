<cfscript>
yearToUse = Evaluate("#year(#now()#)# - 1");

```
<cfquery name="getDataVariable">
SELECT DISTINCT year
FROM art
WHERE year <= #yearToUse#
ORDER BY year DESC
</cfquery>
```
</cfscript>
