<cfoutput>
<h2>Native array</h2>
<cfset array = [1,2,3,4]>
javaClass: #array.getClass().getName()#<br />
isArray: #isArray(array)#<br />
<hr />

<h2>Query</h2>
<cfset query = queryNew("col", "integer", [[1],[2],[3],[4]])>
javaClass: #query.getClass().getName()#<br />
isArray: #isArray(query['col'])#<br />
<hr />

<h2>xmlChildren</h2>
<cfset xml = xmlParse("<aaa><bbb/></aaa>")>
<cfset children = xml.aaa.xmlChildren>
javaClass: #children.getClass().getName()#<br />
isArray: #isArray(children)#<br />
<hr />

<h2>Java ArrayList</h2>
<cfset javaArrayList = createObject("java", "java.util.ArrayList").init([1,2,3,4])>
javaClass: #javaArrayList.getClass().getName()#<br />
isArray: #isArray(javaArrayList)#<br />
<hr />

<h2>Java Vector</h2>
<cfset javaVector = createObject("java", "java.util.Vector").init([1,2,3,4])>
javaClass: #javaVector.getClass().getName()#<br />
isArray: #isArray(javaVector)#<br />
<hr />

<h2>Function arguments</h2>
<cfscript>
f = function(){
	return {
		isArray		= isArray(arguments),
		javaClass	= arguments.getClass().getName()
	};
};
arguments = f(1,2,3,4);
</cfscript>
javaClass: #arguments.javaClass#<br />
isArray: #arguments.isArray#<br />
<hr />
</cfoutput>