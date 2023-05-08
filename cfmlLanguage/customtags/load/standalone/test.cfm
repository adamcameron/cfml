<!--- test.cfm --->
<link rel="stylesheet" href="../lib/css/styles.css">
<cfimport taglib="../lib/tags" prefix="doc">
<doc:page>
<p>
This is a test of the footnotes. This is the <doc:footnote>first footnote, and it does not have an href</doc:footnote>.
And now we have a second footnote: <doc:footnote title="specific title for second one">second footnote has a different title</doc:footnote>.
Continuing on we demonstrate giving the footnote an href to another doc: <doc:footnote href="someUrl">third footnote has an href</doc:footnote>,
and finally we've got one with both a <doc:footnote href="someUrl" title="this is the footnote title for the fourth footnote">separate title for the footnote text and has an href too</doc:footnote>.
That's enough testing.</p>
</doc:page>