<!--- onFinally.cfm --->
<cfimport taglib="lib" prefix="t">

<h3>No exception</h3>
<t:onFinally />
<hr>

<h3>Exception in init()</h3>
<t:onFinally>
<hr>

<h3>Exception in start tag</h3>
<t:onFinally throwInStartTag="true" />
<hr>

<h3>Exception in end tag</h3>
<t:onFinally throwInEndTag="true" />
<hr>

<h3>Exception in onError</h3>
<t:onFinally throwInStartTag="true" throwInOnError="true" />
<hr>