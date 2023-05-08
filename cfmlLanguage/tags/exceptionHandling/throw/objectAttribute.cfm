<!---<cfset oE = createObject("java", "java.lang.StringIndexOutOfBoundsException").init(javaCast("int", 42))>
--->
<cfobject name="oE" type="java" class="java.lang.StringIndexOutOfBoundsException">

<h2>Java Exception Object</h2>
<cftry>
    <cfset oE.init(javaCast("int", 42))>
    <cfthrow object="#oE#"><!--- using an exception object --->
    <cfcatch type="java.lang.StringIndexOutOfBoundsException">
        <cfdump var="#cfcatch#" label="java.lang.StringIndexOutOfBoundsException">
    </cfcatch>
    <cfcatch>
        <cfdump var="#cfcatch#" label='<h3 style="color:red;">NOT CAUGHT</h3>'>
    </cfcatch>
</cftry>

<h2>The value of the cfobject tag name attribute</h2>
<cftry>
    <cfthrow object="oE"><!--- the value of the cfobject tag name attribute, as per docs --->
    <cfcatch type="java.lang.StringIndexOutOfBoundsException">
        <cfdump var="#cfcatch#" label="java.lang.StringIndexOutOfBoundsException">
    </cfcatch>
    <cfcatch>
        <cfdump var="#cfcatch#" label='<h3 style="color:red;">NOT CAUGHT</h3>'>
    </cfcatch>
</cftry>
