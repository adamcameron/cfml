<cfscript>
s = '
<p>DMS Image:</p>
<p><shadodms><cfoutput>##request.objBHV.behaviour(debug="true",src="/dms2fms_testsite/dms/EEC3507E7E9262292C05EBC287B818F2.jpg",dfi_uuid="EEC3507E-7E92-6229-2C05-EBC287B818F2",bhv_uuid="562E235C-50BA-2D88-0CF2-7383E5B8058B",alt="")##</cfoutput></shadodms></p>
<p>DMS Doc:</p>
<p><shadodms><cfoutput>##request.objBHV.behaviour(debug="true",src="/dms2fms_testsite/dms/D7C6C656F94F429B91B7F655AE4524B7.gif",dfi_uuid="EA7E913F-7E92-6229-28BB-E0B6A556C79C",bhv_uuid="B12633F5-C60F-476D-88A5-A60D84AA625A",alt="")##</cfoutput></shadodms></p>
<p>FMS Image:</p>
<p><cfinvoke component="shadomx.apps.fms.fmsbehaviour" method="render"  alt="" src="/shadomx/apps/fms/fmsdownload.cfm?file_uuid=F3E41086-7E92-6229-270837796D5073B6&amp;siteName=dms2fms_testsite" behaviour="default" file_type="jpg" file_uuid="F3E41086-7E92-6229-270837796D5073B6" file_name="Test DMS Image.jpg"></p>
<p>FMS Doc:</p>
<p><cfinvoke component="shadomx.apps.fms.fmsbehaviour" method="render"  alt="" src="/shadomx/ui/images/icon_word.gif" behaviour="default" file_type="doc" file_uuid="F3E40EFF-7E92-6229-217A4C34C668C8AA" file_name="Test DMS Doc.doc" href="/shadomx/apps/fms/fmsdownload.cfm?file_uuid=F3E40EFF-7E92-6229-217A4C34C668C8AA&amp;siteName=dms2fms_testsite"></p>
';
r.dmsMatch		= REFindNoCase("<shadodms>.+?</shadodms>", s, 1, true);
r.wholeString	= mid(s, r.dmsmatch.pos[1], r.dmsmatch.len[1]);
r.bhvMatch  		= REFindNoCase('bhv_uuid="([^"]+?)"', r.wholestring, 1, true);
r.bhvString 		= mid(r.wholeString, r.bhvMatch.pos[2], r.bhvMatch.len[2]);
r.dfiMatch  		= REFindNoCase('dfi_uuid="([^"]+?)"', r.wholestring, 1, true);
r.dfiString 		= mid(r.wholeString, r.dfiMatch.pos[2], r.dfiMatch.len[2]);
r.argsMatch		= REFindNoCase("[^\(]+\(([^\)]+)\)", r.wholestring, 1, true);
r.argsString 	= mid(r.wholeString, r.argsMatch.pos[2], r.argsMatch.len[2]);
r.argsString = REReplaceNoCase(r.argsString, 'dfi_uuid="[^"]+"\s{0,1}', "", "ALL");	// get rid of dfi_uuid and bhv_uuid args which we don't need
r.argsString = REReplaceNoCase(r.argsString, 'bhv_uuid="[^"]+"\s{0,1}', "", "ALL");
r.argsString = REReplaceNoCase(r.argsString, 'src="[^"]+"\s{0,1}', "", "ALL");
r.argsString = createObject("component", "misc").argString2Struct(string=r.argsString);	// this turns the comma=delimited list of arg/value pairs into a struct...
r.argsString = createObject("component", "misc").struct2argString(struct=r.argsString, pDelim=" ");	// ...and turns it back into a space-delimited list.  We do this instead of just listChangeDelims() as it's savvy enough to respect spaces/commas in the data (as opposed to just treating them all as delimiters)
if (not len(left(r.argsString,1))){
	r.argsString = " " & r.argsString;	// make sure it starts with a space
}
</cfscript>
<cfdump var="#r#">

