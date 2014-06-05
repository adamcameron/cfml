<link rel="stylesheet" href="lib/css/styles.css">
<cfoutput>
<p>
This is a test of the footnotes. This is the #application.pageService.addFootnote(text="first footnote, and it does not have an href")#.
And now we have a second footnote: #application.pageService.addFootnote(text="second footnote has a different title", title="specific title for second one")#.
Continuing on we demonstrate giving the footnote an href to another doc: #application.pageService.addFootnote(text="third footnote has an href", href="someUrl")#,
and finally we've got one with both a #application.pageService.addFootnote(text="separate title for the footnote text and has an href too", href="someUrl", title="this is the footnote title for the fourth footnote")#.
That's enough testing.</p>
<p>This is a demo of the translator:
<dl>

	<cfloop array="#['one','two','three','four']#" index="number">
		<dt>#number#</dt><dd>#application.translationService.translate(number)#</dd>
	</cfloop>
	<dt>five</dt><dd>#application.translationService.translate("five")#</dd>

</dl>
</p>
Some filler text:<br>
#application.textUtilsService.getFiller(10)#
And some whitespace:<br>
#application.textUtilsService.getSpacer(5)#
#application.pageService.renderFootnotes()#
</cfoutput>