<cfxml variable="x">
	<aa>
		<bb id="1" />
		<bb id="2">
			<cc/>
		</bb>
		<bb id="3">
			<cc/>
			<dd/>
		</bb>
		<bb id="4"><!--- valid --->
			<cc/>
			<dd/>
			<ee/>
		</bb>
		<bb id="5">
			<dd/>
			<ff/>
		</bb>
		<bb id="6">
			<gg/>
			<hh/>
		</bb>
		<bb id="7"><!--- valid --->
			<ee/>
			<dd/>
			<cc/>
		</bb>
		<bb id="8"><!--- valid --->
			<cc/>
			<ii/>
			<dd/>
			<jj/>
			<ee/>
		</bb>
	</aa>
</cfxml>
<!--- <cfset a = xmlSearch(x, "/aa/bb/cc/parent::*/dd/parent::*/ee/parent::*")> --->
<cfset a = xmlSearch(x, "/aa/bb/cc/../dd/../ee/..")>
<cfdump var="#a#">