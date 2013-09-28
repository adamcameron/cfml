<cfxml variable="x">
    <aaa>
        <bbb>ccc</bbb>
        <ddd eee="fff">ggg</ddd>
        <hhh />
    </aaa>
</cfxml>
<cfset children = x.aaa.xmlChildren>
<cfoutput>
    Data type of xmlChildren: #children.getClass().getName()#<br />
	isArray(children): #isArray(children)#<br />
    But can access them as an array:<br />
    <cfdump var="#children[2]#" label="Second child"><br />
    And use array functions:<br />
    Number of children: #arrayLen(children)#<br />
    Delete the second child using arrayDeleteAt():<br />
    <cfset arrayDeleteAt(children, 2)><!--- ddd --->
    <cfdump var="#x#" label="&lt;ddd&gt; is gone">
</cfoutput>