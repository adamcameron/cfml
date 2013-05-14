<cfoutput>
<div id="FileBrowser">

	<form name="fileviewer_form" id="fileviewer_form">
	<div class="container">
		
		<!--- Roots --->
		<div style="float:right;margin-right:3px">
			<strong>Volumes:</strong>
			<select name="roots" id="roots" onChange="javascript:doEventNOUI('#rc.xehBrowser#','FileBrowser',{computerRoot:this.value})" style="width:50px">
				<cfloop from="1" to="#arrayLen(rc.roots)#" index="i">
				<option value="#urlEncodedFormat(rc.roots[i].getAbsolutePath())#" <cfif rc.roots[i].getAbsolutePath() eq rc.computerRoot>selected=selected</cfif>>#rc.roots[i].getAbsolutePath()#</option>
				</cfloop>
			</select>
		</div>
		
		<!--- Your Current Location --->
		<div class="browser_titlebar">
		   <a href="javascript:doEventNOUI('#rc.xehBrowser#', 'FileBrowser',{dir:'#jsstringFormat(rc.currentroot)#'})" title="Refresh Listing"><img src="includes/images/icons/arrow_refresh.png" align="absmiddle" border="0" title="Refresh Listing."></a>
			You are Here: #rc.currentroot#
		</div>
		
		<!--- Show the File Listing --->
		<div class="filelisting">
		    <!--- Messagebox --->
		    #getPlugin("MessageBox").renderit()#
		    
		    <!--- Display back links --->
			<cfif rc.currentRoot neq rc.computerRoot>
				<cfset tmpHREF = "javascript:doEventNOUI('#rc.xehBrowser#','FileBrowser',{dir:'#JSStringFormat(rc.oSession.getVar('oldRoot'))#'})">
				<a href="#tmpHREF#"><img src="includes/images/icons/folder.png" border="0" align="absmiddle" alt="Folder"></a>
				<a href="#tmpHREF#">..</a><br>
			</cfif>
			
			<!--- Display directories --->
			<cfif rc.qryDir.recordcount>
			<cfloop query="rc.qryDir">
			<cfif rc.qryDir.type eq "Dir" and left(rc.qryDir.name,1) neq ".">
				
				<!--- URL used for selection --->
				<cfset plainURL = rc.currentroot & rc.thisSlash & rc.qryDir.name>
				<!--- HREF to go into a directory --->
				<cfset tmpHREF = "javascript:doEventNOUI('#rc.xehBrowser#','FileBrowser',{dir:'#JSStringFormat(plainURL)#'})">
				<!--- ID Name of the div --->
				<cfset validIDName = JSStringFormat(replace(rc.qryDir.name,".","_","all")) >
				<!--- Display the DiV --->
				<div id="#validIDName#" 
					 onClick="selectdirectory('#validIDName#','#JSStringFormat(plainURL)#')" 
					 style="cursor: pointer;"
					 onDblclick="#tmpHREF#">
					<a href="#tmpHREF#"><img src="includes/images/icons/folder.png" border="0" align="absmiddle" alt="Folder"></a>
					#rc.qryDir.name#
				</div>
			
			</cfif>
			</cfloop>
			<cfelse>
			<em>No directories found.</em>
			</cfif>
			
		</div>
	
		<!--- Selcted Folder --->
		<div class="selectedBar">
			Selected Folder:&nbsp;<span id="span_selectedfolder"></span>
		</div>
	
		<!--- The Bottom Bar --->
		<div class="bottomBar">
			<input type="hidden" name="selecteddir" id="selecteddir" value="">
			<input type="hidden" name="currentroot" id="currentroot" value="#rc.currentroot#">
			<!--- Selection Buttons --->
			<input type="button" id="sb_cancel_btn" 	value="Cancel" 			onClick="closeBrowser()" class="jqmClose"> &nbsp;
			<input type="button" id="sb_createdir_btn"  value="New Folder"  	onClick="newFolder('#rc.xehNewFolder#','#JSStringFormat(rc.currentroot)#')"> &nbsp;
			<input type="button" id="sb_selectdir_btn"  value="Choose Folder" 	onClick="chooseFolder('#rc.oSession.getVar('callbackItem')#')" disabled="true" class="jqmClose">
		</div>
		
	</div>
	</form>
</div>
</cfoutput>