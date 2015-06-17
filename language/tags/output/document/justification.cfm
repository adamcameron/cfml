<cfsavecontent variable="sData"><?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head><title>Justification Test</title></head>
	<body>
<div style="text-align:justify">1.  This is the first paragraph.  This is an amount of
text equal to about a paragraph.  This is for testing purposes only.  I need
enough text to fill four or five lines.  This is the first paragraph.  This is
an amount of text equal to about a paragraph.  This is for testing purposes
only.  I need enough text to fill four or five lines.  This is the first
paragraph.  This is an amount of text equal to about a paragraph.  This is for
testing purposes only.  I need enough text to fill four or five lines.  This is
the first paragraph.  This is an amount of text equal to about a paragraph.
This is for testing purposes only.  I need enough text to fill four or five
lines.</div>

<p align="justify">2. This is the Second paragraph.  This is an amount of text
equal to about a paragraph.  This is for testing purposes only.  I need enough
text to fill four or five lines.  2. This is the Second paragraph.  This is an
amount of text equal to about a paragraph.  This is for testing purposes only.
I need enough text to fill four or five lines.  2. This is the Second
paragraph.  This is an amount of text equal to about a paragraph.  This is for
testing purposes only.  I need enough text to fill four or five lines.  2. This
is the Second paragraph.  This is an amount of text equal to about a paragraph.
 This is for testing purposes only.  I need enough text to fill four or five
lines.</p>

<p style="text-align:justify">3. This is the Third paragraph.  This is an
amount of text equal to about a paragraph.  This is for testing purposes only.
I need enough text to fill four or five lines.  3. This is the Third paragraph.
 This is an amount of text equal to about a paragraph.  This is for testing
purposes only.  I need enough text to fill four or five lines.  3. This is the
Third paragraph.  This is an amount of text equal to about a paragraph.  This
is for testing purposes only.  I need enough text to fill four or five lines.
3. This is the Third paragraph.  This is an amount of text equal to about a
paragraph.  This is for testing purposes only.  I need enough text to fill four
or five lines.</p>

<p style="text-align: justify"> 4. This is the Forth paragraph.  This is an
amount of text equal to about a paragraph.  This is for testing purposes only.
I need enough text to fill four or five lines.  4. This is the Forth paragraph.
 This is an amount of text equal to about a paragraph.  This is for testing
purposes only.  I need enough text to fill four or five lines.  4. This is the
Forth paragraph.  This is an amount of text equal to about a paragraph.  This
is for testing purposes only.  I need enough text to fill four or five lines.
4. This is the Forth paragraph.  This is an amount of text equal to about a
paragraph.  This is for testing purposes only.  I need enough text to fill four
or five lines.</p>

<table><tr align="justify"> <td align="justify">5. This is the Fifth
paragraph.  This is an amount of text equal to about a paragraph.  This is for
testing purposes only.  I need enough text to fill four or five lines.  5. This
is the Fifth paragraph.  This is an amount of text equal to about a paragraph.
This is for testing purposes only.  I need enough text to fill four or five
lines.  5. This is the Fifth paragraph.  This is an amount of text equal to
about a paragraph.  This is for testing purposes only.  I need enough text to
fill four or five lines.  5. This is the Fifth paragraph.  This is an amount of
text equal to about a paragraph.  This is for testing purposes only.  I need
enough text to fill four or five lines.</td></tr></table>

<table> <tr align="justify"><td>6. This is the Sixth paragraph.  This is an
amount of text equal to about a paragraph.  This is for testing purposes only.
I need enough text to fill four or five lines.  6. This is the Sixth paragraph.
 This is an amount of text equal to about a paragraph.  This is for testing
purposes only.  I need enough text to fill four or five lines.  6. This is the
Sixth paragraph.  This is an amount of text equal to about a paragraph.  This
is for testing purposes only.  I need enough text to fill four or five
lines.</td></tr></table>

<table> <tr> <td align="justify">7. This is the Seventh paragraph.  This is an
amount of text equal to about a paragraph.  This is for testing purposes only.
I need enough text to fill four or five lines.  7. This is the Seventh
paragraph.  This is an amount of text equal to about a paragraph.  This is for
testing purposes only.  I need enough text to fill four or five lines.  7. This
is the Seventh paragraph.  This is an amount of text equal to about a
paragraph.  This is for testing purposes only.  I need enough text to fill four
or five lines.</td></tr></table>
	</body>
</html></cfsavecontent>
<cfcontent reset="true"><cfoutput>#sData#</cfoutput>

<cfset sFileName = expandPath("./justification.pdf")>
<cfdocument format="pdf" filename="#sFileName#" overwrite="yes">
	<cfoutput>#sData#</cfoutput>
</cfdocument>