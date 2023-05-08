<cfset sPath = expandPath('./docs/') & "test.pdf">
<cfdocument filename="#sPath#" format="pdf">
<p>
We are using verity to create and search collections.
The text in the collections includes words with a hyphen (patient-centered) but when searching on patient-centered we don't find any results.
</p>
<p>
Is there a way to search on words with hyphens?
</p>
<p>
Thanks for the help.
</p>
</cfdocument>