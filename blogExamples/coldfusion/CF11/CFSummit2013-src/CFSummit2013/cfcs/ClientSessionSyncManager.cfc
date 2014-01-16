/**
	Handles synchronization of session information between server and device.
**/
component client=true 
{
	
	this.ds_name = "";
	
	function init(dsName)
	{
		this.ds_name = dsName;
	}
	
	function syncSessionsFromServer()
	{
		if (!isDefined("localStorage.lastUpdateId"))
		{
			localStorage.lastUpdateId = 0;
		}
		
		var serverCFC = new ServerSessionSyncManager() ;
		serverCFC.setCallbackHandler(this.onUpdatesReceivedFromServer);
		
		serverCFC.getSessionUpdates(localStorage.lastUpdateId); 
	}
	

	function onUpdatesReceivedFromServer(updatesWrapper)
	{
		if (!isDefined(updatesWrapper) || updatesWrapper == null)
			return;
			
		var updates = updatesWrapper.result;//it is an array of objects
		if (updates != null && updates.length > 0)
		{
			localStorage.lastUpdateId = updates[updates.length].UPDATE_ID;
			var i2 = 1; //Workaroung because of a bug - Ram
			for (i2 = 1;i2 <= updates.length; i2++) //for(;i <= updates.length; i++) - this throws NPE - Ram
			{
				syncSession(updates[i2]);
			}	
			
			//update sessions in the memory
			invokeCFClientFunction("window._g_db_manager.getSessions",this.onGetSessions);
		}		
	}
	
	function onGetSessions(sessions)
	{
		window.sessions = sessions;
	}
	
	function syncSession (session)
	{
		var op = session.OPERATION;
		if (op == null || op == "")
			op = "update";
		
		if (op == "update")
			updateSession(session);
		else if (op == "delete")
			deleteSession(session);
		else if (op == "insert")
			insertSession (session);
	}
	
	function updateSession (session)
	{
		var colNames = arrayNew(1);
		var colValues = arrayNew(1);
		
		var sql = "update sessions set id = " + session.SESSION_ID;
		
		if (session.SESSION_NAME != null && session.SESSION_NAME != "")
		{
			sql += ", name = ?";
			colValues.append(session.SESSION_NAME);
		}
		
		if (session.SESSION_INFO != null && session.SESSION_INFO != "")
		{
			sql += ", session_info = ?";
			colValues.append(session.SESSION_INFO);
		}

		if (session.SESSION_TYPE != null && session.SESSION_TYPE != "")
		{
			sql += ", session_type = ?";
			colValues.append(session.SESSION_TYPE);
		}

		if (session.SPEAKER_NAME != null && session.SPEAKER_NAME != "")
		{
			sql += ", speaker_name = ?";
			colValues.append(session.SPEAKER_NAME);
		}

		if (session.START_TIME != null && session.START_TIME != "")
		{
			sql += ", start_time = time('" + session.START_TIME + "')";
		}

		if (session.END_TIME != null && session.END_TIME != "")
		{
			sql += ", end_time = time('" + session.END_TIME + "')";
		}

		if (session.DAY != null && session.DAY != "")
		{
			sql += ", session_day = ?";
			colValues.append(parseInt(session.DAY).toString());
		}

		if (session.ROOM != null && session.ROOM != "")
		{
			sql += ", room = ?";
			colValues.append(session.ROOM);
		}
		
		sql += " where id = " + session.SESSION_ID;
		
		queryExecute(sql,colValues,{"datasource":this.ds_name});
		
	}
	
	function deleteSession(session)
	{
		queryExecute("delete from sessions where id = " + session.SESSION_ID,
		[],{"datasource":this.ds_name});
	}
	
	function insertSession (session)
	{
		queryExecute("insert into sessions (id,name,session_info,session_type,
			speaker_name,start_time,end_time,room,session_day) values (?,?,?,?,?," + 
			"time('" + session.START_TIME + "')," + 
			"time('" + session.END_TIME + "')," + 
			"?,?)",
			[
				session.SESSION_ID,session.SESSION_NAME,session.SESSION_INFO,
				session.SESSION_TYPE,session.SPEAKER_NAME,
				session.ROOM,
				parseInt(session.DAY).toString()
			],
			{"datasource":this.ds_name});
	}
	
}