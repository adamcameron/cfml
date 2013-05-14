<cfoutput>
<cfset rc = event.getCollection()>
<!--- HELPBOX --->
#renderView("tags/help")#

<form name="updateform" id="udpateform" action="javascript:doFormEvent('#Event.getValue("xehDoSave")#','content',document.updateform)" onSubmit="return confirmit()" method="post">
<div class="maincontentbox">

	<div class="contentboxes_header">
		<div class="contentboxes_title"><img src="includes/images/icons/settings_27.gif" align="absmiddle" />&nbsp; Framework Conventions</div>
	</div>

	<!--- Messagebox --->
	#getPlugin("MessageBox").renderit()#
	<div class="contentboxes">

	<p>
		Below you can fill out the framework conventions for the key pieces in a ColdBox Application. <br />
	</p>
	
	<br />
		
	<div style="margin: 5px">
    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="tablelisting">
		<tr>
			<th>Setting</th>
			<th>Value</th>
		</tr>

	     <tr>
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Config Location</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="configLocation" value="#rc.Conventions.configLocation#" size="50">
	     	</td>
	     </tr>
	
	     <tr bgcolor="##f5f5f5">
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Handlers Location</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="handlerLocation" value="#rc.Conventions.handlerLocation#" size="30">
			</td>
	     </tr>
	     
	     <tr>
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Layouts Location</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="layoutsLocation" value="#rc.Conventions.layoutslocation#" size="30">
			</td>
	     </tr>
	     
	     <tr bgcolor="##f5f5f5">
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Views Location</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="viewsLocation" value="#rc.Conventions.viewslocation#" size="30">
			</td>
	     </tr>
	     
	     <tr>
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Plugins Location</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="pluginsLocation" value="#rc.Conventions.pluginsLocation#" size="30">
			</td>
	     </tr>
	     
	     <tr bgcolor="##f5f5f5">
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Default Event Action</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="eventAction" value="#rc.Conventions.eventAction#" size="30">
			</td>
	     </tr>
	     
	     <tr>
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Models Location</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="modelsLocation" value="#rc.Conventions.modelsLocation#" size="30">
			</td>
	     </tr>
		 
		 <tr>
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Modules Location</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="modulesLocation" value="#rc.Conventions.modulesLocation#" size="30">
			</td>
	     </tr>
     
    </table>
	</div>

	<div align="center" style="margin-top:30px">
		<a class="action" href="javascript:document.updateform.submit()" title="Submit Changes">
			<span>Submit Changes</span>
		</a>
	</div>

	</div>
</div>
</form>
</cfoutput>