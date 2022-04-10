<!--- onErrorArgs.cfm --->
<cfimport taglib="lib" prefix="t">

<h3>Exception in init()</h3>
<t:onErrorArgs>
<hr>

<h3>Exception in start tag</h3>
<t:onErrorArgs throwInStartTag="true" />
<hr>

<h3>Exception in end tag</h3>
<t:onErrorArgs throwInEndTag="true" />
<hr>