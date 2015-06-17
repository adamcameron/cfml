<cfset o = createObject("component", "c")>
<cfset o.bridge("callThis", "payload when calling just [callThis]")>
<cfset o.bridge("junk.cfcs.dyn_com_and_method.c.callThis", "payload when calling just [junk.cfcs.dyn_com_and_method.c.callThis]")>
<cfset o.bridge("junk.cfcs.dyn_com_and_method.c2.callThat", "payload when calling just [junk.cfcs.dyn_com_and_method.c2.callThat]")>
