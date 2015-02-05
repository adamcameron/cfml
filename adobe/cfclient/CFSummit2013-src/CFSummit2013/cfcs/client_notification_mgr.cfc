/**
	Manages storage and retrieval of notifications on the device.
**/
component client=true
{
	this.ds_name = window.ds_name;
	variables._tmpCallback = "";
	
	function create_notification_table()
	{
		queryExecute("create table if not exists notifications (
				id integer, title text, desc text, sent_on integer, read integer)",
				[],{"datasource":this.ds_name});
	}
	
	//returns array of notification_vo
	function get_notifications()
	{
		var sql = "select * from notifications order by id desc";
			
		queryExecute(sql,[],{"datasource":this.ds_name, "name":"sq"});

		return this.query2notification_value_objs(sq);		
	}
	
	//returns array of notification_vo
	function query2notification_value_objs (queryObj)
	{
		if (queryObj.length == 0)
			return [];
		
		var result = [];
		var queryLen = queryObj.length;
		for (var i = 1; i <= queryLen; i++)
		{
			var vo = new notification_vo(); 
			vo.id = queryObj.id[i];
			vo.title = queryObj.title[i];
			vo.desc = queryObj.desc[i];
			vo.sent_on = queryObj.sent_on[i];
			vo.read = queryObj.read[i];
			
			arrayAppend(result,vo);
		}
		return result;
	}
	
	function add_notification (notification_vo)
	{
		queryExecute("insert into notifications (id,title,desc,sent_on, read) values (?,?,?,?,?)",
			[
				notification_vo.id,notification_vo.title,notification_vo.desc,
				notification_vo.sent_on,notification_vo.read
			],
			{"datasource":this.ds_name});
	}
	
	function delete_notifications (ids)
	{
		var sql = "delete * from notifications where id in (";
		for (var i = 1; i < ids.length; i++)
		{
			if (i > 1)
				sql +",";
			sql += ids[i];
		} 
		sql += ")";
		
		queryExecute(sql,[],{"datasource":this.ds_name, "name":"sq"});
	}
	
	function mark_notification_read (id)
	{
		queryExecute("update notifications set read = 1 where id = " + id,
			[],{"datasource":this.ds_name});
	}
	
	//returns array of notification_vo
	function fetchNotificationsFromServer (onReceivedNotifications)
	{
		//Get after last notification.
		//Get max id first
//		queryExecute("select max(id) as max_id from notifications",[],
//			{"datasource":this.ds_name, "name":"sq"});
//			
//		var fromId = sq.max_id[1];
//		
//		if (fromId eq null)
//			fromId = 0;
		
		//For now we will get all notifications from the server and then syc with
		//notifications on the client side - Ram
		var fromId = 0;
		
		var serverCFC = new server_notification_mgr();
		variables._tmpCallback = onReceivedNotifications;
		serverCFC.setCallbackHandler(this.onNotificationReceivedFromServer);
		
		serverCFC.getNotifications(fromId); 
		
	}
	
	function onNotificationReceivedFromServer(notificationsArg)
	{
		if (variables._tmpCallback == '')
			return;
			
		var callback = variables._tmpCallback;
		variables._tmpCallback  = "";
		
		var result = [];
		
		var notifications = notificationsArg.result;
		
		//delete all local notifications first
		queryExecute("delete from notifications",[],{"datasource":this.ds_name});
		
		var i1 = 1;
		var notificationLen = notifications.length;
		for ( i1 = 1; i1 <= notificationLen; i1++)
		{
			var vo = new notification_vo();
			vo.id = notifications[i1].ID;
			vo.title = notifications[i1].TITLE;
			vo.desc = notifications[i1].DESC;
			vo.sent_on = notifications[i1].SENT_ON._date_;
			vo.read = 0;
			result.push(vo);
			
			this.add_notification(vo); 
		}
		
		this.reconcileNotifications(notifications);
		
		if (isDefined("callback") and callback != '')
			callback(result);
	}
	
	function reconcileNotifications (newNotifications)
	{
		if (!isDefined("newNotifications") || newNotifications.length == 0)
		{
			//delete all local notifications
			queryExecute("delete from notifications",[],{"datasource":this.ds_name});
			return;
		}
		
		var sql = "delete from notifications where id not in (";
		var i = 1;
		var len = newNotifications.length;		
		for (i = 1; i <= len; i++)
		{
			if (i > 1)
				sql += ",";
			sql += newNotifications[i].ID;
		}
		
		sql += ")";
		
		queryExecute(sql,[],{"datasource":this.ds_name});
	}
}