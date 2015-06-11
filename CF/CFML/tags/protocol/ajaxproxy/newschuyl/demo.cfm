<cfajaxproxy cfc="shared.cf.cfml.tags.protocol.ajaxproxy.newschuyl.Proxy" jsclassname="Proxy">

<script type="text/javascript" src="/shared/cf/cfml/tags/protocol/ajaxproxy/newschuyl/util.js"></script>
<button name="serverTime" onClick="serverTimeClick()">Server Time</button>
<br /><br />
<input type="text" name="source" id="source" value="Hello World!" />
<button name="reverseString" onClick="reverseString(getElementById('source').value)">Reverse String</button>
<br /><br />
<div id="output"></div>