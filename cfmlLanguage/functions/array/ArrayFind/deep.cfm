<cfset a1 = ["red","green","blue"]>
<cfdump var="#a1#">
<cfoutput>arrayFind(a1, "green"): #arrayFind(a1, "green")#<br /></cfoutput>

<cfset a2 = [["red"], ["green"], ["blue"]]>
<cfdump var="#a2#">
<cfoutput>arrayFind(a2, "green"): #arrayFind(a2, "green")#<br /></cfoutput>

<cfset a3 = [{colour="red"}, {colour="green"}, {colour="blue"}]>
<cfdump var="#a3#">
<cfoutput>arrayFind(a3, "green"): #arrayFind(a3, "green")#<br /></cfoutput>


<cfset a4= [{colour=["red"]}, {colour=["green"]}, {colour=["blue"]}]>
<cfdump var="#a4#">
<cfoutput>arrayFind(a4, "green"): #arrayFind(a4, "green")#<br /></cfoutput>