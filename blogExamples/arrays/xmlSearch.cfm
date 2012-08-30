<cfxml variable="x">
    <aaa>
        <bbb>ccc</bbb>
        <ddd eee="fff">ggg</ddd>
        <hhh />
        <iii>
            <hhh jjj="kkk">lll</hhh>
        </iii>
    </aaa>
</cfxml>
Initial state of XML:<br />
<cfdump var="#x#">
<hr />
&lt;hhh&gt; nodes:<br />
<cfset hhh = xmlSearch(x, "//hhh")>
<cfdump var="#hhh#">
<hr />

Adjust one of the nodes via the array, not the XML doc<br />
<cfset hhh[1].xmlText = "mmm">
Note that the previously empty &lt;hhh/&gt; node now has xmlText:<br />
<cfdump var="#x#">