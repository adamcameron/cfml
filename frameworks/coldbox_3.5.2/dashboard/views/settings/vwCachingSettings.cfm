<cfoutput>
<!--- HELPBOX --->
#renderView("tags/help")#

<form name="updateform" id="udpateform" action="javascript:doFormEvent('#Event.getValue("xehDoSave")#','content',document.updateform)" onSubmit="return confirmit()" method="post">
<div class="maincontentbox">

	<div class="contentboxes_header">
		<div class="contentboxes_title"><img src="includes/images/icons/settings_27.gif" align="absmiddle" />&nbsp; Caching Settings</div>
	</div>

	<!--- Messagebox --->
	#getPlugin("MessageBox").renderit()#
	<div class="contentboxes">

	<p>Below are the configuration settings for the ColdBox Cache Manager.  This version is for cf7 or compatiblity engines ONLY!
	   New 3.0 applications will use the CacheBox engine and configuration found here:
	   <em>/coldbox/system/web/config/CacheBox.cfc</em>
	</p>
	<br>
		<div style="margin: 5px">
	    <table width="100%" border="0" cellspacing="0" cellpadding="5" class="tablelisting">
	    	<tr>
			<th>Setting</th>
			<th>Value</th>
		  </tr>

	     <tr>
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Object Default Timeout</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="CacheObjectDefaultTimeout" value="#rc.fwSettings.CacheObjectDefaultTimeout#" size="6" maxlength="3">
	     	(In Minutes)
	     	</td>
	     </tr>

	     <tr bgcolor="##f5f5f5">
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Object Last Access Timeout</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="CacheObjectDefaultLastAccessTimeout" value="#rc.fwSettings.CacheObjectDefaultLastAccessTimeout#" size="6" maxlength="3">
	     	(In Minutes)
			</td>
	     </tr>
	     
	     <tr>
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Use Last Access Timeout</strong>
	     	</td>
	     	<td>
	     		<select name="CacheUseLastAccessTimeouts" id="CacheUseLastAccessTimeouts">
	     			<option value="true" <cfif rc.fwSettings.CacheUseLastAccessTimeouts>selected="selected"</cfif>>true</option>
	     			<option value="false" <cfif not rc.fwSettings.CacheUseLastAccessTimeouts>selected="selected"</cfif>>false</option>	     			
	     		</select>
			</td>
	     </tr>

	     <tr bgcolor="##f5f5f5">
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Cache Reaping Frequency</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="CacheReapFrequency" value="#rc.fwSettings.CacheReapFrequency#" size="6" maxlength="2">
	     	(In Minutes)
			</td>
	     </tr>
	     
	     <tr >
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Maximum Objects In Cache</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="CacheMaxObjects" value="#rc.fwSettings.CacheMaxObjects#" size="6" maxlength="4">
	     	(0 = Unlimited)
			</td>
	     </tr>
	     
	     <tr bgcolor="##f5f5f5">
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>JVM Free Memory Percentage Threshold</strong>
	     	</td>
	     	<td>
	     	<input type="text" name="CacheFreeMemoryPercentageThreshold" value="#rc.fwSettings.CacheFreeMemoryPercentageThreshold#" size="6" maxlength="2">
	     	(0 = Unlimited)
			</td>
	     </tr>
	     
	     <tr>
	     	<td align="right" width="40%" style="border-right:1px solid ##ddd">
	     	<strong>Eviction Policy</strong>
	     	</td>
	     	<td>
	     		<select name="CacheEvictionPolicy" id="CacheEvictionPolicy">
	     			<option value="LFU" <cfif rc.fwSettings.CacheEvictionPolicy eq "LFU">selected="selected"</cfif>>LFU</option>
	     			<option value="LRU" <cfif rc.fwSettings.CacheEvictionPolicy eq "LRU">selected="selected"</cfif>>LRU</option>	     			
	     		</select>
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