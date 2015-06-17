<cfwindow initshow="true" center="true"
         width="430" height="340" title="Artists">

<cfform>
   <cfgrid name="artists"
         format="html"
         pagesize="10"
         striperows="yes"
         bind="cfc:artists.getArtists({cfgridpage},
                              {cfgridpagesize},
                              {cfgridsortcolumn},
                              {cfgridsortdirection})">
      <cfgridcolumn name="lastname" header="Last Name" width="100"/>
      <cfgridcolumn name="firstname" header="First Name" width="100"/>
      <cfgridcolumn name="email" header="E-Mail" width="200"/>
   </cfgrid>
</cfform>

</cfwindow>