<!--- pageWithoutFootnotes.cfm --->
<link rel="stylesheet" href="lib/css/styles.css">
<cfimport taglib="lib" prefix="doc">
<doc:page>
<p>
This is a test of the footnotes. This is the &lt;doc:footnote&gt;first footnote, and it does not have an href&lt/doc:footnote&gt;.
And now we have a second footnote: &lt;doc:footnote title="specific title for second one"&gt;second footnote has a different title&lt/doc:footnote&gt;.
Continuing on we demonstrate giving the footnote an href to another doc: &lt;doc:footnote href="someUrl"&gt;third footnote has an href&lt/doc:footnote&gt;,
and finally we've got one with both a &lt;doc:footnote href="someUrl" title="this is the footnote title for the fourth footnote"&gt;separate title for the footnote text and has an href too&lt/doc:footnote&gt;.
That's enough testing.</p>
</doc:page>