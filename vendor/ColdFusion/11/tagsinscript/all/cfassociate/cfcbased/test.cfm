<!--- test.cfm --->
<cfimport taglib="." prefix="tags">

<tags:outer id="o1">
	<tags:middle id="o1/m1">
		<tags:inner id="o1/m1/i1">
			o1/m1/i1/content
		</tags:inner>
		<tags:inner id="o1/m1/i2">
			o1/m1/i2/content
		</tags:inner>
	</tags:middle>	
	<tags:middle id="o1/m2">
		<tags:inner id="o1/m2/i1">
			o1/m2/i1/content
		</tags:inner>
		<tags:inner id="o1/m2/i2">
			o/m2/i2/content
		</tags:inner>
	</tags:middle>	
</tags:outer>