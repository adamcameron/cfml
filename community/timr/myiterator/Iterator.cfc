<cfcomponent name="Iterator" output="no">
	
	
	<cfset instance = structNew()>
	<cfset instance.index = 0>
	
	
	<cffunction name="init" access="public" returntype="void" output="no"
			hint="Initializes the iterator component. This method must be overridden by components that extend the Iterator component.">
		
		<cfthrow message="The init() function must be overridden by components extending Iterator component.">
		
	</cffunction>
	
	
	<cffunction name="size" access="public" returntype="numeric" output="no"
			hint="Returns the size of the collection. This method must be overridden by components that extend the Iterator component.">
		
		<cfthrow message="The size() method must be overridden by components extending the Iterator component.">
		
	</cffunction>
	
	
	<cffunction name="index" access="public" returntype="numeric" output="no"
			hint="Returns the current position of the iterator in the collection. Will return 0 if the iterator has not been initialized or the collection has no size.">
		
		<!--- Check to see if the index exceeds the size of the collection (i.e
		  --- elements have been removed from the collection). --->
		
		<cfif instance.index gt size()>
			
			<cfset instance.index = size()>
			
		</cfif>
		
		<cfreturn instance.index>
		
	</cffunction>
	
	
	<!--- Methods which allow the caller to scroll forward through the
	  --- collection. --->
	
	
	<cffunction name="hasNext" access="public" returntype="boolean" output="no"
			hint="Returns true if the collection has size and the iterator is not currently at the end of the collection.">
		
		<cfif nextIndex()>
			
			<cfreturn true>
			
		<cfelse>
			
			<cfreturn false>
			
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="nextIndex" access="public" returntype="numeric" output="no"
			hint="Returns the index value of the next element in the collection. Returns 0 if the next index is out of range.">
		
		<cfset var nextIndex = index() + 1>
		
		<cfif nextIndex lte size()>
			
			<cfreturn nextIndex>
			
		<cfelse>
			
			<cfreturn 0>
			
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="next" access="public" returntype="boolean" output="no"
			hint="Moves the iterator to the next element in the collection. Returns true if the operation completes successfully or false if the iterator is already at the end of the collection or the collection has no size.">
		
		<cfif hasNext()>
			
			<cfset moveTo(nextIndex())>
			
			<cfreturn true>
			
		<cfelse>
			
			<cfreturn false>
			
		</cfif>
		
	</cffunction>
	
	
	<!--- Methods which allow the caller to scroll backwards through the
	  --- collection. --->
	
	
	<cffunction name="hasPrevious" access="public" returntype="boolean" output="no"
			hint="Returns true if the collection has size and the iterator is not currently at the first position.">
		
		<cfif previousIndex()>
			
			<cfreturn true>
			
		<cfelse>
			
			<cfreturn false>
			
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="previousIndex" access="public" returntype="numeric" output="no"
			hint="Returns the index value of the previous element in the collection. Returns 0 if the previous index is out of range.">
		
		<cfset var previousIndex = index() - 1>
		
		<cfif previousIndex gte 1>
			
			<cfreturn previousIndex>
			
		<cfelse>
			
			<cfreturn 0>
			
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="previous" access="public" returntype="boolean" output="no"
			hint="Moves the iterator to the previous element in the collection. Returns true if the operation completes successfully or false if the iterator is already at the beginging of the collection or the collection has no size.">
		
		<cfif hasPrevious()>
			
			<cfset moveTo(previousIndex())>
			
			<cfreturn true>
			
		<cfelse>
			
			<cfreturn false>
			
		</cfif>
		
	</cffunction>
	
	
	<!--- Methods which allow us to jump to specific indexes in the underlying
	  --- collection. --->
	
	
	<cffunction name="first" access="public" returntype="boolean" output="no"
			hint="Moves the iterator to the begining of the collection. Returns true if the operation completes successfully or false if the collection has no size.">
		
		<!--- Check to make sure our collection has size. --->
		
		<cfif not variables.isEmpty()>
			
			<cfset moveTo(1)>
			
			<cfreturn true>
			
		<cfelse>
			
			<cfreturn false>
			
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="last" access="public" returntype="boolean" output="no"
			hint="Moves the iterator to the end of the collection. Returns true if the operation completes successfully or false if the collection has no size.">
		
		<!--- Check to make sure our collection has size. --->
		
		<cfif not variables.isEmpty()>
			
			<cfset moveTo(size())>
			
			<cfreturn true>
			
		<cfelse>
			
			<cfreturn false>
			
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="moveTo" access="public" returntype="void" output="no"
			hint="Moves the iterator to the specified position in the collection. Throws an error if the index value is out of range or the collection has no size.">
		
		<cfargument name="index" required="yes" type="numeric">
		
		<!--- Check to make sure the specified index is not out of range. --->
		
		<cfif arguments.index lte 0>
			
			<cfthrow message="The index value passed to the iterator moveTo() function must be a positive integer value.">
			
		<cfelseif arguments.index gt size()>
			
			<cfthrow message="The index value passed to the iterator moveTo() function is greater than the collection size.">
			
		</cfif>
		
		<cfset instance.index = arguments.index>
		
	</cffunction>
	
	
	<!--- Miscellaneous decision methods. --->
	
	
	<cffunction name="isFirst" access="public" returntype="boolean" output="no"
			hint="Returns true if the collection has size and the iterator is at the beginning of the collection. Returns false otherwise.">
		
		<cfif index() eq 1>
			
			<cfreturn true>
			
		<cfelse>
			
			<cfreturn false>
			
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="isLast" access="public" returntype="boolean" output="no"
			hint="Returns true if the collection has size and the iterator is at the end of the collection. Returns false otherwise.">
		
		<cfif not variables.isEmpty() and index() eq size()>
			
			<cfreturn true>
			
		<cfelse>
			
			<cfreturn false>
			
		</cfif>
		
	</cffunction>
	
	
	<cffunction name="isEmpty" access="public" returntype="boolean" output="no"
			hint="Returns false if the collection has size. Returns true if the collection has no size.">
		
		<cfif size()>
			
			<cfreturn false>
			
		<cfelse>
			
			<cfreturn true>
			
		</cfif>
		
	</cffunction>
	
	
	<!--- Debug methods. --->
	
	
	<cffunction name="state" access="public" returntype="struct" output="no"
			hint="Returns a structure of values returned from the iterator's decision functions.">
		
		<cfset var state = structNew()>
		
		<cfset structInsert(state, "index", index())>
		
		<cfset structInsert(state, "size", size())>
		
		<cfset structInsert(state, "hasNext", hasNext())>
		
		<cfset structInsert(state, "hasPrevious", hasPrevious())>
		
		<cfset structInsert(state, "isFirst", isFirst())>
		
		<cfset structInsert(state, "isLast", isLast())>
		
		<cfset structInsert(state, "isEmpty", variables.isEmpty())>
		
		<cfreturn state>
	
	</cffunction>
	
	
</cfcomponent>