component {

	public boolean function matt(path) {
		var boolReturn = false;
		var local 			= {};
		local.isInRoot 		= (listLen( arguments.path, "\/") - listLen(ExpandPath('/'), "\/"));
		if (local.isInRoot GTE 0) {
			boolReturn = true;
		}
		return boolReturn;
	}
	
	boolean function dale(String path) {
        local.root = expandPath("/");
        local.root = left(local.root, len(local.root) -1);
       
        arguments.path = replace(arguments.path, "/", "\", "ALL");
        local.result = arguments.path contains local.root ? true : false;
       
        return local.result;
	}
	
	boolean function winston(required string fileSystemPath)
	{
	        if(!Len(Arguments.fileSystemPath))
	        {
	                return false;
	        }
	 
	        Local.web_root = ListToArray(ExpandPath('/'), '/\');
	        Local.path = ListToArray(Arguments.fileSystemPath, '/\');
	 
	        return Local.web_root.equals(Local.path.subList(0, ArrayLen(Local.web_root)));
	}

	public boolean function adam(required string fileSystemPath){
	 	var dirCurrent = createObject("java", "java.io.File").init(fileSystemPath).getCanonicalPath();
		var dirBase = createObject("java", "java.io.File").init(expandPath("/")).getCanonicalPath();

		return find(dirBase, dirCurrent);
	}


	public boolean function bruce(required string fileSystemPath){
		arguments.filesystempath=replace(arguments.filesystempath,"\","/","all");
		if(compare(left(expandpath("/"), len(arguments.filesystempath)), arguments.filesystempath) EQ 0){
			return true;
		}else{
			return false;
		}
	}
}