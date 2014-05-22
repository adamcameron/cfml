<cfscript>
safe(function(){
	var s = "123"
	echo("value: #s#<br>")
	echo("len(): ")
	echo(s.len())
})

safe(function(){
	var b = true
	echo("value: #b#<br>")
	echo("len(): ")
	echo(b.len())
})

safe(function(){
	var d = now()
	echo("value: #d#<br>")
	echo("len(): ")
	echo(d.len())
})

safe(function(){
	var i = 123
	echo("value: #i#<br>")
	echo("len(): ")
	echo(i.len())
})

safe(function(){
	var f = 1.23
	echo("value: #f#<br>")
	echo("len(): ")
	echo(f.len())
})

safe(function(){
	var fileHandle = fileOpen(getCurrentTemplatePath(), "read")
	dump(var=fileHandle, label="value")
	echo("len(): ")
	echo(fileHandle.len() & "<br>")
	echo(fileHandle.getClass().getName() & "<br>")
})

safe(function(){
	var binary = fileReadBinary(expandPath("./server-railo.png"))
	dump(var=binary, label="value")
	echo("len(): ")
	echo(binary.len() & "<br>")
	echo(binary.getClass().getName() & "<br>")
})

safe(function(){
	var image = imageNew(expandPath("./server-railo.png"))
	dump(var=image, label="value")
	echo("len(): ")
	echo(image.len() & "<br>")
	echo(image.getClass().getName() & "<br>")
})

safe(function(){
	var a = [1,2,3]
	dump(var=a, label="value")
	echo("len(): ")
	echo(a.len())
})

safe(function(){
	var st = {1=1,2=2,3=3}
	dump(var=st, label="value")
	echo("len(): ")
	echo(st.len())
})

safe(function(){
	xml variable="local.x" {
		echo("
			<aaa>
				<bbb>ccc</bbb>
				<ddd>eee</ddd>
			</aaa>
		")
	}
	dump(var=x, label="value")
	echo("len(): ")
	echo(x.len())
})

safe(function(){
	var q = queryNew("id,value", "integer,varchar",[[1,"1"],[2,"2"],[3,"3"]])
	dump(var=q, label="value")
	echo("len(): ")
	echo(q.len())
})

safe(function(){
	var l = "1,2,3"
	dump(var=l, label="value")
	echo("len(): ")
	echo(l.len() & "<br>")
	echo("listLen(): ")
	echo(l.listLen() & "<br>")
})

safe(function(){
	var f = function(){}
	dump(var=f, label="value")
	echo("len(): ")
	echo(f.len() & "<br>")
	echo(f.getClass().getName() & "<br>")
})

safe(function(){
	document name="local.doc" format="pdf" {
		echo("doc content")
	}
	dump(var=doc, label="value")
	echo("len(): ")
	echo(doc.len() & "<br>")
	echo(doc.getClass().getName() & "<br>")
})

safe(function(){
	ftp action="open" server="localhost" username="anonymous" password="null@example.com" connection="local.ftpConn" result="local.ftpResult";
	dump(var=local.ftpResult, label="cfftp result")
	
	ftp action="listdir" connection="local.ftpConn" directory="/" name="files";
	dump(var=files, label="FTP file listing result")
	dump(var=local, label="All Local vars")
	echo(local.ftpConn.getClass().getName() & "<br>")

	dump(var=local.ftpConn, label="ftpConn value")
	echo("len(): ")
	echo(local.ftpConn.len() & "<br>")
})

	zip action="readbinary" file=expandPath("./test.zip") variable="local.zip";
	echo(local.zip.getClass().getName() & "<br>")
	dump(var=local.zip, label="ftpConn value")
	echo("len(): ")
	echo(local.zip.len() & "<br>")
safe(function(){
})


function safe(f){
	try {
		f()
	}catch (any e){
		echo("#e.type#: #e.message# (#e.detail#)<br>")		
	}finally{
		echo("<hr>")
	}
}
</cfscript>