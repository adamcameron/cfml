<cfoutput>#SERVER.ColdFusion.ProductVersion#</cfoutput>

 

<cflayout  type="tab"  name="someTabs">

<cflayoutarea  name="dontDisplay" title="dont display this" initHide="true">The  Hidden Tab!</cflayoutarea>
<cflayoutarea name="tab1" title="Your Tab 1"   selected="true">
Tab 1
</cflayoutarea>
<cflayoutarea name="tab2" title="Your  Tab 2"  selected="false">
Tab 2
</cflayoutarea>
<cflayoutarea  name="tab3" title="Your Tab 3"  selected="false">
Tab 3
</cflayoutarea>

</cflayout>