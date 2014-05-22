<cfscript>
st = {};
o = new C();

cfcInstance = createObject("java", "coldfusion.runtime.TemplateProxy");
structInstance = createObject("java", "coldfusion.runtime.Struct");
MapInterface = createObject("java", "java.util.Map");
</cfscript>

<cfoutput>
<h3>Is it a struct?</h3>
An actual struct: #structInstance.getClass().isInstance(st)#<br>
A CFC instance: #structInstance.getClass().isInstance(o)#<br>
<hr>
<h3>Is it a CFC instance?</h3>
An actual CFC instance: #cfcInstance.getClass().isInstance(o)#<br>
A struct: #cfcInstance.getClass().isInstance(st)#<br>
<hr>
<h3>Is it a Map?</h3>
An CFC instance: #MapInterface.getClass().isInstance(o)#<br>
A struct: #MapInterface.getClass().isInstance(st)#<br>
<hr>
</cfoutput>