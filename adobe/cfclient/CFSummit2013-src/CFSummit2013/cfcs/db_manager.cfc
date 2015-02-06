/**
	Main database manager CFC. Most DB functions are accessed through this CFC
**/
component client="true"
{
	this.ds_name = window.ds_name;
	this.sessionMgr = new sessions_mgr(this.ds_name); 
	this.notification_mgr = new client_notification_mgr(this.ds_name); 
	this.speakerMgr = new SpeakerManager((this.ds_name)); 
	this.sessionSyncMgr = new ClientSessionSyncManager(this.ds_name);
	
	function init_dbs()
	{
		//dropTables();
		if (localStorage.tablesCreated == undefined || localStorage.tablesCreated == 'false')
			create_tables();

	}
	
	function create_tables()
	{
		this.sessionMgr.createSessionTable();
		
		this.speakerMgr.createSpeakerTable();
								
		this.notification_mgr.create_notification_table();
			
		var sessions = read_session_json();
		if (sessions == "")
		{
			alert("Error reading session data from json file");
			return;
		}
		
		var sessionCount = arrayLen(sessions);
		var i = 1; //working around the issue of declaring i as var in the loop initializer
		for (i = 1; i <= sessionCount; i++)
		{
			this.sessionMgr.insertSession(sessions[i]);
		}
		
		var speakers = read_speaker_json();
		if (speakers == "")
		{
			alert("Error reading speaker data from json file");
			return;
		}
		
		var speakerCount = arrayLen(speakers);
		for (i = 1; i <= speakerCount; i++) //working around the issue of declaring i as var in the loop initializer
		{
			this.speakerMgr.insertSpeaker(speakers[i]);
		}
		
		localStorage.tablesCreated = true;
	}

	function setMySession (session_vo, set_session)
	{
		this.sessionMgr.setMySession(session_vo,set_session);
	}
	
	//Returns array of session_vo.cfc
	function read_session_json() returntype="Array"
	{
		var json_objs = read_json("data/sessions_data.js");
		
		if (json_objs == "")
			return json_objs;
		
		var result = [];
		
		var count = arrayLen(json_objs);
		for (var i = 1; i <= count; i++)
		{
			var json_obj = json_objs[i];
			var vo = new session_vo();
			vo.id = json_obj.id;
			vo.name = json_obj.name;
			vo.session_info = json_obj.session_info;
			vo.session_type = json_obj.session_type;
			vo.speaker_name = json_obj.speaker_name;
			vo.start_time = json_obj.start_time;
			vo.end_time = json_obj.end_time;
			vo.room = json_obj.room;
			vo.day = json_obj.day;
			result.push(vo);
		}
		
		return result;
	}

	
	//Returns array of speaker_vo.cfc
	function read_speaker_json() returntype="Array"
	{
		var json_objs = read_json("data/speakers_data.js");
		
		if (json_objs == "")
			return json_objs;
		
		var result = [];
		
		var count = arrayLen(json_objs);
		for (var i = 1; i <= count; i++)
		{
			var json_obj = json_objs[i];
			var vo = new speaker_vo(); 
			vo.id = json_obj.id;
			vo.name = json_obj.name;
			vo.speaker_info = json_obj.speaker_info;
			vo.speaker_image = json_obj.speaker_image;
			vo.speaker_title = json_obj.title;
			vo.speaker_org = json_obj.organization;
			result.push(vo);
		}
		
		return result;
	}
	
	//returns array of session_vo. Filter argument is a session_filter CFC
	function getSessions (filter)
	{
		this.sessionMgr.getSessions(filter);
	}
	
	//returns array of speaker_vo.
	function get_speakers ()
	{
		return this.speakerMgr.getSpeakers();	
	}
	
	function get_speaker (name)
	{
		return this.speakerMgr.getSpeaker(name);		
	}
							
	function read_json (json_path)
	{
		var http_req = new XMLHttpRequest();
		http_req.open("GET",json_path,false); 
		http_req.send();
		
		return eval(http_req.responseText);
	} 
	
	function dropTables()
	{
		queryExecute("drop table if exists speakers",[],{"datasource":this.ds_name});
		queryExecute("drop table if exists sessions",[],{"datasource":this.ds_name});
		queryExecute("drop table if exists notifications",[],{"datasource":this.ds_name});
	}
	
	function syncDataFromServer()
	{
		this.sessionSyncMgr.syncSessionsFromServer();
	}
}