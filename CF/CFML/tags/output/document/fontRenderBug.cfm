<cfparam name="URL.style" type="regex" pattern="(?i)^(arial|times)$">
<cfif URL.style eq "arial">
	<cfset sStyle="font-family:Arial, Helvetica, sans-serif; font-size:12px;">
<cfelse>
	<cfset sStyle="font-family: 'Times New Roman', Times, serif; font-size: 12px;">
</cfif>


<cfdocument
format="PDF"
backgroundvisible="yes"
fontembed="yes"
orientation="portrait"
pagetype="letter"
pageheight="11"
pagewidth="8.5"
marginbottom=".25"
marginleft=".25"
marginright=".25"
margintop=".25"
unit="in"
scale="100">

<cfoutput><div style="#sStyle#"></cfoutput>
Lorem ipsum dolor sit amet, <strong>consectetur adipisicing elit</strong>, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. <strong>Excepteur sint occaecat</strong> cupidatat non proident, sunt in culpa qui officia <strong>deserunt</strong> mollit anim id est laborum.
</div>
</cfdocument>
