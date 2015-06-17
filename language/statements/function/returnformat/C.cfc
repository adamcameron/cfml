<cfcomponent output="false">
	<cfprocessingdirective pageencoding="utf-8">

	<cffunction name="control" returntype="struct" access="remote" output="false">
		<cfreturn {one="tahi", two="rua", three="toru", four="wha"}>
	</cffunction>

	<cffunction name="viaTags" returnformat="JSON" returntype="struct" access="remote">
		<cfreturn {one="tahi", two="rua", three="toru", four="wha"}>
	</cffunction>

	<cfscript>
		remote struct function viaAttribute() returnformat="JSON" {
			return {black="mangu", white="ma", red="whero"};
		}

		/**
		@returnformat JSON
		*/
		remote struct function viaAnnotation() {
			return {Monday="Rāhina", Tuesday="Rātū", Wednesday="Rāapa", Thursday="Rāpare", Friday="Rāmere", Saturday="Rāhoroi", Sunday="Rātapu"};
		}
	</cfscript>

</cfcomponent>


