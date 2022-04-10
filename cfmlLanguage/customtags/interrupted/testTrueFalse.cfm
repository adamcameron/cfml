<cfimport taglib="." prefix="rv">
<cfparam name="URL.condition" type="string" default="false">

<rv:if condition="#URL.condition#">
	<rv:true>
		It was true
	</rv:true>
	<rv:false>
		It was false
	</rv:false>
</rv:if>