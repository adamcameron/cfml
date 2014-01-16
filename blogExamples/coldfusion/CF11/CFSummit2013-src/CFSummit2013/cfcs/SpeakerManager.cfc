/**
	CFC to manager speaker data on the client side
**/
component client=true   
{
	this.ds_name = "";
	
	function init(dsName)
	{
		this.ds_name = dsName;	
	}

	function createSpeakerTable()
	{
		queryExecute("create table if not exists speakers (
				id integer,name text, speaker_info text, speaker_title text, 
					speaker_org text, speaker_image text)",[],
				{"datasource":this.ds_name});
	}
	
	function insertSpeaker (speaker_vo)
	{
		queryExecute("insert into speakers (id,name,speaker_info,speaker_image,speaker_title,speaker_org
				) values (?,?,?,?,?,?)",
			[speaker_vo.id,speaker_vo.name,speaker_vo.speaker_info,
				speaker_vo.speaker_image,speaker_vo.speaker_title, speaker_vo.speaker_org],
			{"datasource":this.ds_name}
		);
	}
	
	//returns array of speaker_vo.
	function getSpeakers ()
	{
		var sql = "select * from speakers order by name";	
		
		queryExecute(sql,[],{"datasource":this.ds_name, "name" : "sq"});
		
		return this.query2speaker_value_objs(sq);		
	}
	
	function getSpeaker (name)
	{
		if (name == undefined || name == '')
			return "";
			
		var sql = "select * from speakers where name like '%" + name + "%'";	
	
		queryExecute(sql,[],{"datasource":this.ds_name, "name":"sq"});
				
		var speakers = this.query2speaker_value_objs(sq);
		
		if (speakers.length > 0)
			return speakers[1];
		
		return "";		
	}
	
	//returns array of speaker_vo
	function query2speaker_value_objs (queryObj)
	{
		if (queryObj.length == 0)
			return [];
		
		var result = [];
		
		for (var i = 1; i <= queryObj.length; i++)
		{
			var vo = new speaker_vo();
			
			//vo.id = queryObj.id[i]; 
			vo.name = queryObj.name[i];
			vo.speaker_info = queryObj.speaker_info[i];
			vo.speaker_image = queryObj.speaker_image[i];
			vo.speaker_title = queryObj.speaker_title[i];
			vo.speaker_org = queryObj.speaker_org[i];
			
			arrayAppend(result,vo);
		}
		
		return result;
	}
	
}
