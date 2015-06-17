<cfquery name="q" datasource="cfartgallery">
SELECT artID, artistID, artName
FROM app.art
ORDER BY artName
</cfquery>
 
 
<cfform name="frm">
    <cfgrid name="testGrid"
              query="q"
        height="250" 
        appendkey="yes" 
      <!---  width="100%"--->
        selectmode="browse"
        enabled="yes"
        visible="yes"
        format="html"
        striperows="yes"
        selectonload="false">
       
    </cfgrid>
</cfform>