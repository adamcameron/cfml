<cfset o = new PickedSettingValue()>

<cfset o.setValueNVARCHAR("     value     ")>
<cfset entitySave(o)>
<cfset a = entityLoad("PickedSettingValue")>

<pre>
<cfloop array="#a#" index="o">
	<cfoutput>[#o.getValueNVARCHAR()#]<br /></cfoutput>
</cfloop>
</pre>

<cfdump var="#a#">