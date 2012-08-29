/**
@hint A very basic implementation of a LinkedList. Elements all have a reference to their next element; the last element's next element is null. The current element's data, id and nextElement are exposed to the calling code via the THIS scope.
*/
component {

	/**
	@hint Initialises and returns a linked list.
	@data Data for first element of the list
	*/
	public LinkedList function init(required any data){
		variables.size				= 0;
		variables.firstElement		= createElement(data);
		variables.currentElement	= variables.firstElement;
		expose();
		return this;
	} 

	
	/**
	@hint Returns the current element.
	*/
	public struct function getCurrent(){
		return variables.currentElement;
	}

	
	/**
	@hint Returns size of the list
	*/
	public numeric function getSize(){
		return variables.size;
	}


	/**
	@hint Appends an element to the list, makes it the current element and returns the list. The new element's next element will be the list's first element.
	*/
	public LinkedList function append(required any data){
		// go back to the beginning of the list, and traverse to the end
		var element = variables.firstElement;
		for (var i=1; i < variables.size; i++){
			element = element.nextElement;
		}
		// we're at the end
		var newElement = createElement(data);
		
		// point the last element to this new element to add it to the list
		element.nextElement = newElement;

		variables.currentElement	= newElement;
		expose();
		return this;
	}


	/**
	@hint Prepends an element to the list, makes it the current element and returns the list. The new element's next element will be the list's previous first element.
	*/
	public LinkedList function prepend(required any data){
		var newElement = createElement(data);
		
		// point the last element to this new element to add it to the list
		newElement.nextElement 	= variables.firstElement;

		variables.currentElement= newElement;
		variables.firstElement	= newElement;
		expose();
		return this;
	}


	/**
	@hint Inserts an element into the list before the current element, makes it the current element and returns the list.
	*/
	public LinkedList function insertBefore(required any data){
		if (!isStartOfList()){
			var nextElement		= variables.currentElement.nextElement;
			var thisElement		= variables.currentElement;

			goToPrevious(thisElement.id);

			var prevElement		= variables.currentElement;
	
			var newElement		= createElement(data, thisElement);	// the new element goes before the current one, so the current one is its next
	
			// now make the previous element's next point to the new one; and the current element's prev point to the new one
			prevElement.nextElement		= newElement;
	
			// set the new one to be the current one
			variables.currentElement	= newElement;

			expose();
			return this;
		}else{
			return prepend(data);
		}
	}


	/**
	@hint Inserts an element into the list after the current element, makes it the current element and returns the list.
	*/
	public LinkedList function insertAfter(required any data){
		var nextElement			= variables.currentElement.nextElement;
		var thisElement			= variables.currentElement;
		var element				= variables.firstElement;

		var newElement			= createElement(data, nextElement);	// the new element goes before the current one, so the current one is its next

		// now make the previous element's next point to the new one; and the current element's prev point to the new one
		thisElement.nextElement	= newElement;
		
		// set the new one to be the current one
		variables.currentElement= newElement;
		expose();
		return this;
	}


	/**
	@hint Deletes the current element, makes the following element the current element and returns the list.
	*/
	public LinkedList function delete(){
		var nextElement		= variables.currentElement.nextElement;
		var thisElement		= variables.currentElement;
		var element			= variables.firstElement;

		goToPrevious(thisElement.id);
		var prevElement		= variables.currentElement;

		// connect the previous element to the next element
		prevElement.nextElement = nextElement;
		
		// get rid of this one
		structClear(thisElement);
		variables.size--;
		
		// make the next one the current one
		if (structCount(nextElement)){
			variables.currentElement = nextElement;
		}else{
			last();
		}
		expose();

		return this;
	}
	
	
	/**
	@hint Points the current element to the first element of the list.
	*/
	public LinkedList function first(){
		variables.currentElement = variables.firstElement;
		expose();
		return this;
	}
	
	
	/**
	@hint Points the current element to the last element of the list.
	*/
	public LinkedList function last(){
		// go back to the beginning of the list, and traverse to the end
		var element = variables.firstElement;
		for (var i=1; i < variables.size; i++){
			element = element.nextElement;
		}
		variables.currentElement = element;
		expose();
		return this;
	}
	
	
	/**
	@hint Points the current element to the next element in the list. Throws an ElementOutOfBoundsException if there is no next element
	*/
	public LinkedList function next(){
		if (!structCount(variables.currentElement)){
			throw(type="ElementOutOfBoundsException", message="No more elements", detail="The call to next() has moved past the end of the list");
		}
		variables.currentElement = variables.currentElement.nextElement;
		expose();
		return this;
	}
	
	
	/**
	@hint Points the current element to the previous element in the list. Throws an ElementOutOfBoundsException if there is no previous element
	*/
	public LinkedList function previous(){
		goToPrevious(variables.currentElement.id);
		return this;
	}
	
	
	/**
	@hint Returns true if the current element is the first element of the list, otherwise false.
	*/
	public boolean function isStartOfList(){
		return currentElement.id == variables.firstElement.id;
	}
	
	
	/**
	@hint Returns true if the current element is the last element of the list, otherwise false.
	*/
	public boolean function isEndOfList(){
		return !structCount(currentElement.nextElement);
	}


	public array function listToArray(){
		var array = [];
		var element = variables.firstElement;

		arrayAppend(array, element.data);
		while (structCount(element.nextElement)) {
			element = element.nextElement;
			arrayAppend(array, element.data);
		}

		return array;
	}
	
	
	public boolean function hasMoreElements(){
		return structCount(currentElement.nextElement);
	}
	
	
	public boolean function afterEnd(){
		return !structKeyExists(currentElement, "nextElement");
	}


	// PRIVATE METHODS
	
	/**
	@hint Creates a new element with the specified data, and next.  If no next argument is passed, next will be an empty struct, indicating it being the last element of the list
	*/
	private struct function createElement(required any data, struct nextElement){
		var element = {
			id		= createUuid(),
			data	= data
		};
		if (structKeyExists(arguments, "nextElement")){
			element.nextElement = arguments.nextElement;
		}else{
			element.nextElement = {};
		}
		variables.size++;
		return element;
	}


	/**
	@hint Exposes the current node to the calling code via the this scope (exposed as data, id, nextElement, prevElement).
	*/	
	private void function expose(){
		if (structKeyExists(variables.currentElement, "data")){
			this.data		= variables.currentElement.data;
			this.nextElement= variables.currentElement.nextElement;
			this.id			= variables.currentElement.id;
		}else{
			this.data		= javaCast("null", "");
			this.nextElement= javaCast("null", "");
			this.id			= javaCast("null", "");
		}
	}
	
	
	/**
	@hint Traverses the list from the beginning to the element previous to the specified one. Throws an ElementOutOfBoundsException if the entire list is traversed without finding a match
	*/
	private void function goToPrevious(id){
		var element = variables.firstElement;

		 while (structCount(element.nextElement) && element.nextElement.id != id) {
			element = element.nextElement;
		};
		if (!structCount(element.nextElement)){
			throw(type="ElementOutOfBoundsException", message="No more elements", detail="The call to previous() has moved past the beginning of the list");
		}
		variables.currentElement = element;
		expose();
	}


}