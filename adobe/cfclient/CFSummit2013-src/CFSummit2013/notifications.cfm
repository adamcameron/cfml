<!---
	Custom tag to display notifications.
	Attributes :
		parent - Id of parent div 
--->

<cfclient>
	<cfif thisTag.executionMode eq "start">
		<cfset display_notifications()>
	</cfif>
	
	<cffunction name="display_notifications" >
		<cfset var parent_div = $("##"+attributes.parent)>
		
		<cfsavecontent variable="tmphtml" >
			<div id="notification_div">
				<table id="notification_tbl" class="table">
				</table>
			</div>
		</cfsavecontent>
		
		<cfset $(parent_div).append(tmphtml)>
		<cfset setTopDivMargin("notification_div")>


		<cfset notificationCFC = new cfcs.client_notification_mgr()>

		<cfset localNotifications = notificationCFC.get_notifications()> 
		
		<cfloop array="#localNotifications#" index="note">
			<cfset addToDisplayTable(note,true)>
		</cfloop>	
		
		<!--- Also sync sessions from server --->
		
		<!--- 
			BUG : This is a major bug in the code generation. Following two calls interfer
				with the results of each other because of which not all notifications 
				are displayed - Ram 
		--->
<!---		
		<cfset window._g_db_manager.sessionSyncMgr.syncSessionsFromServer()>
		<cfset notificationCFC.fetchNotificationsFromServer(onGetNotificationsFromServer)>
--->

		<!--- Work around for above bug --->	
		<cfscript>
			setTimeout(window._g_db_manager.sessionSyncMgr.syncSessionsFromServer,1000);
			setTimeout(function(){
				notificationCFC.fetchNotificationsFromServer(onGetNotificationsFromServer);
			},10);
			
		</cfscript>
	
	</cffunction>	
	
	<cffunction name="addToDisplayTable" >
		<cfargument name="vo" >
		<cfargument name="append" default="true">
	
		<cfset tmpDate = new Date(vo.sent_on)>
		
		<cfoutput >
			<cfsavecontent variable="tmphtml" >
				<tr>
					<td class="notification-row">
						<span class="notification-title">#vo.title#</span>
						<br>
						<span class="notification-dtls">#vo.desc#</span>
						<br>
						<span class="notification-time">#dateTimeFormat(tmpDate,"mm/dd/yyyy hh:nn tt")#</span>
					</td>
				</tr>
			</cfsavecontent>
		</cfoutput>
		
		<cfif append eq true>
			<cfset var row = $(tmphtml).appendTo("##notification_tbl")>
		<cfelse>
			<cfset var row = $(tmphtml).prependTo("##notification_tbl")>
		</cfif>
		
		<cfif vo.read eq 0>
			<cfset $(row).addClass("unread_note")>
		</cfif>							
	</cffunction>
	
	<cffunction name="onGetNotificationsFromServer" >
		<cfargument name="notifications" >
		
		<cfset var len = arrayLen(notifications)>
		
		<cfif len eq 0>
			<cfreturn >
		</cfif>
		
		<!--- remove all rows --->
		<cfset $("##notification_tbl tr").remove()>
		
		<cfloop index="i" from="#len#" to="1" step="-1">
			<cfset addToDisplayTable(notifications[i], false)>
		</cfloop>	
		
	</cffunction>

</cfclient>