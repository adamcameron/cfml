<cfobject component="test" name="cfctest" type="component">

<cfset test = structnew()>
<cfset test.secondarg = "mysecondarg">
<cfset test.thirdarg = "andthirdarg">

<cfset testarr = arraynew(1)>
<cfset testarr[1] = "first arr elem">

<cfdump var="#test#">

<cfinvoke method="func3" component="#cfctest#" argumentcollection="#test#" firstarg="myarg" secondarg="new second arg" fourtharg="#testarr#">
	<cfinvokeargument name="fiftharg" value="the fifth time">
</cfinvoke>

<cfdump var="#test#">
