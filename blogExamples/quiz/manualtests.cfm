<cfscript>
	functions = new functions();
	f = functions.matt;
	
	dirs.this = expandPath("./");
	dirs.parent = dirs.this & "../";
	dirs.grandparent = dirs.parent & "../";
	dirs.ggp = dirs.grandparent & "../";
	dirs.gggp = dirs.ggp & "../";
	dirs.ggggp = dirs.gggp & "../";
	dirs.fake	= "C:/fake/fake/fake/fake/fake/fake";
	dirs.hack	= "C:\windows\#expandPath('/')#";
	
	canonical = {
		this = createObject("java", "java.io.File").init(dirs.this).getCanonicalPath(),
		parent = createObject("java", "java.io.File").init(dirs.parent).getCanonicalPath(),
		grandparent = createObject("java", "java.io.File").init(dirs.grandparent).getCanonicalPath(),
		ggp = createObject("java", "java.io.File").init(dirs.ggp).getCanonicalPath(),
		gggp = createObject("java", "java.io.File").init(dirs.gggp).getCanonicalPath(),
		ggggp = createObject("java", "java.io.File").init(dirs.ggggp).getCanonicalPath(),
		fake = createObject("java", "java.io.File").init(dirs.fake).getCanonicalPath(),
		hack = "ERROR"
	};

	resultsDirs = {
		this = f(dirs.this),
		parent = f(dirs.parent),
		grandparent = f(dirs.grandparent),
		ggp = f(dirs.ggp),
		gggp = f(dirs.gggp),
		ggggp = f(dirs.ggggp),
		fake = f(dirs.fake),
		hack = f(dirs.hack)
	};
	resultsCanonical = {
		this = f(canonical.this),
		parent = f(canonical.parent),
		grandparent = f(canonical.grandparent),
		ggp = f(canonical.ggp),
		gggp = f(canonical.gggp),
		ggggp = f(canonical.ggggp),
		fake = f(canonical.fake),
		hack = "ERROR"
	};

	writeDump({
		func = getMetadata(f).name,
		dirs = dirs,
		canonical = canonical,
		results = {
			dirs = resultsDirs,
			canonical = resultsCanonical
		}
	});
</cfscript>