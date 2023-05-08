<cfset sMask = "$,999999999.9999">
<cfoutput>
<pre>#numberFormat(.9999, sMask)#</pre>
<pre>#numberFormat(.999, sMask)#</pre>
<pre>#numberFormat(.99, sMask)#</pre>
<pre>#numberFormat(.9, sMask)#</pre>
<pre>#numberFormat(9, sMask)#</pre>
<pre>#numberFormat(99, sMask)#</pre>
<pre>#numberFormat(999, sMask)#</pre>
<pre>#numberFormat(9999, sMask)#</pre>
<pre>#numberFormat(99999, sMask)#</pre>
<pre>#numberFormat(999999, sMask)#</pre>
<pre>#numberFormat(9999999, sMask)#</pre>
<pre>#numberFormat(99999999, sMask)#</pre>
<pre>#numberFormat(999999999, sMask)#</pre>
</cfoutput>
<cfsetting showdebugoutput="no">
<cfexit>