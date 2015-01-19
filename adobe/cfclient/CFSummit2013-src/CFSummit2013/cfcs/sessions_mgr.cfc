/**
	CFC to manager session data on the client side
**/
component client="true"
{
	this.ds_name = "";
	
	function init(dsName)
	{
		this.ds_name = dsName;	
	}
	
	function createSessionTable()
	{
		queryExecute("create table if not exists sessions (
				id integer, name text, session_info text, session_type text, speaker_name text,
				start_time integer, end_time integer,
				room text, session_day text, my_session integer, survey_submitted integer)		
			",[],{"datasource":this.ds_name});
	}
	
	function insertSession (session_vo)
	{
		queryExecute("insert into sessions (id,name,session_info,session_type,
			speaker_name,start_time,end_time,room,session_day) values (?,?,?,?,?," + 
			"time('" + session_vo.start_time + "')," + 
			"time('" + session_vo.end_time + "')," + 
			"?,?)",
			[
				session_vo.id,session_vo.name,session_vo.session_info,
				session_vo.session_type,session_vo.speaker_name,
				session_vo.room,
				session_vo.day
			],
			{"datasource":this.ds_name});
	}
	
	function setMySession (session_vo, set_session)
	{
		if (set_session)
		{
			//first unset sessions in this timeslot
			var filter1 = new session_filter();
			filter1.day = session_vo.day;
			filter1.start_time_from = session_vo.start_time;
			filter1.end_time_to = session_vo.end_time;
			
			var sessions = getSessions(filter1);
			if (sessions != "" && sessions.length > 0)
			{
				var cond = "";
				var i = 0;
				var count = sessions.length;
				for (i = 1; i < count; i++)
				{
					if (i > 1)
						cond += ",";
					cond += sessions[i].id;
				}
				
				queryExecute("update sessions set my_session = 0	where id in (" + cond + ")",
					[],	{"datasource":this.ds_name});
			}
		}
		
		var value = set_session ? 1 : 0;
		
		queryExecute("update sessions set my_session = " +
			value + " where id = " + session_vo.id,
			[],{"datasource":this.ds_name});
		
		session_vo.my_session = set_session ? 1 : 0;
		
		return session_vo;
	}

	//returns array of session_vo. Filter argument is a session_filter
	function getSessions (filter)
	{
		var sqlTxt = "select * from sessions ";	
		if (filter != undefined && filter != null)
		{
			var conds = [];
			if (filter.id != '')
				arrayAppend(conds,"id = " + filter.id );
			if (filter.name != '')
				arrayAppend(conds,"name like '%" + filter.name + "%'");
			if (filter.start_time_from != '')
				arrayAppend(conds," start_time >= time('" + filter.start_time_from + "')");
			if (filter.start_time_to != '')
				arrayAppend(conds," start_time <= time('" + filter.start_time_to + "')");
			if (filter.end_time_from != '')
				arrayAppend(conds," end_time >= time('" + filter.end_time_from + "')");
			if (filter.end_time_to != '')
				arrayAppend(conds," end_time <= time('" + filter.end_time_to + "')");
			if (filter.day != '')
				arrayAppend(conds," session_day = '" + filter.day + "'");
			if (filter.speaker != '')
				arrayAppend(conds," speaker_name = '" + filter.speaker + "'");
			if (filter.survey_submitted != '')
				arrayAppend(conds," survey_submitted = " + filter.survey_submitted);
				
			
			var count = arrayLen(conds);
			if (count > 0)
			{
				for (var i = 1; i <= count; i++)
				{
					if (i == 1)
						sqlTxt += " where ";
					else
						sqlTxt += " and ";
					sqlTxt += " " + conds[i];
				}
			}
		}
		
		sqlTxt += " order by session_day,start_time,name"; 
		
		var localDSName = this.ds_name; //working around a bug
		
		queryExecute(sqlTxt,[],{"datasource":this.ds_name, "name":"sq"});
		
		return this.query2SessionVO(sq);		
	}
	
	function setSurveySubmitted (id, surveySubmitted)
	{
		var sql = "update sessions set survey_submitted = " + surveySubmitted 
			+ " where id = " + id;
			
		queryExecute(sql,[],{"datasource":this.ds_name});
	}
	
	//returns array of session_vo
	function query2SessionVO (queryObj)
	{
		if (queryObj.length == 0)
			return [];
		
		var result = [];
		
		for (var i = 1; i <= queryObj.length; i++)
		{
			var vo = new session_vo(); 
	
			vo.id = queryObj.id[i]; 
			vo.name = queryObj.name[i]; 
			vo.session_info = queryObj.session_info[i];
			vo.session_info = queryObj.session_info[i];
			vo.session_type = queryObj.session_type[i];
			vo.speaker_name = queryObj.speaker_name[i];
			vo.start_time = queryObj.start_time[i];
			vo.end_time = queryObj.end_time[i];
			vo.room = queryObj.room[i];
			vo.day = queryObj.session_day[i];
			vo.my_session = queryObj.my_session[i];
			vo.survey_submitted = queryObj.survey_submitted[i];
					
			if (vo.my_session == null)
				vo.my_session = 0;
			
			arrayAppend(result,vo);
		}
		
		return result;
	}
		
}