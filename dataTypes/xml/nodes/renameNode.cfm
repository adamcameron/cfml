<cfxml variable="x">
	<shado_object>
		<properties>
			<property name="prop1"><othernode/></property>
			<property name="status"><signoff>100%</signoff><other>more</other></property>
			<property name="prop3">some stuff</property>
		</properties>
	</shado_object>
</cfxml>
<cfdump var="#x#" label="Before">

<!--- which property node is it? --->
<cfset aProp = xmlSearch(x, "/shado_object/properties/property[@name='status']")>
<cfset nProp = aProp[1]>

<!--- which child within the status property is the signoff node? --->
<cfset iStatus = xmlChildPos(nProp, "signoff", 1)>

<!--- grab the value of it --->
<cfset sValue = nProp.xmlChildren[iStatus].xmltext>

<!--- delete the signoff node --->
<cfset arrayDeleteAt(nProp.xmlChildren, iStatus)>
<cfdump var="#x#" label="After Delete" expand="false">

<!--- add the new signoffvalue node --->
<cfset nProp.xmlChildren[arrayLen(nProp.xmlChildren)+1] = xmlElemNew(x, "signoffvalue")>

<!--- add the value back in --->
<cfset nProp.xmlChildren[arrayLen(nProp.xmlChildren)].xmlText = sValue>
<cfdump var="#x#" label="After Add">
