/**
@hint A very basic implementation of a circularly-doubly-LinkedList. Elements all have a reference to their next and previous elements; the last element's next element is the first element, and the first element's previous element is the last element. The current element's data, id and nextElement and prevElement are exposed to the calling code via the THIS scope. Note: as the object exposes self-reerential data in the this scope, it is not advised to CFDUMP the object, as CFDUMP will choke on the recursion.
*/
component extends="LinkedList" {

	/**
	@hint Initialises and returns a linked list. The initial element will have itself as its next and previous elements.
	@data Data for first element of the list
	*/
	public CircularlyDoublyLinkedList function init(required any data){
		return super.init(data=data);
	} 


	/**
	@hint Appends an element to the list, makes it the current element and returns the list. The new element's next element will be the list's first element.
	*/
	public CircularlyDoublyLinkedList function append(required any data){
		var lastElement		= variables.firstElement.prevElement;	// ie: we append the element after the last element
		var newElement		= createElement(data, variables.firstElement, lastElement);	// the new element goes at the end of the list, so its "next" is the first element, and its "prev" is the former last element

		// now make the old last element have the new one as its next; and make the first element have the new one as its prev
		lastElement.nextElement				= newElement;
		variables.firstElement.prevElement	= newElement;
		
		// set the new one to be the current one
		variables.currentElement	= newElement;
		expose();
		return this;
	}


	/**
	@hint Prepends an element to the list, makes it the current element and returns the list. The new element's previous element will be the list's last element.
	*/
	public CircularlyDoublyLinkedList function prepend(required any data){
		var firstElement	= variables.firstElement;
		var lastElement		= variables.firstElement.prevElement;
		var newElement		= createElement(data, firstElement, lastElement);	// the new element goes at the beginning of the list, so its "next" is the old first element, and its "prev" is the last element

		// now make the last element have the new one as its next; and make the old first element have the new one as its prev
		lastElement.nextElement		= newElement;
		firstElement.prevElement	= newElement;
		
		// set the new one to be the current one
		variables.currentElement		= newElement;
		// and it's now the first one
		variables.firstElement	= newElement;

		expose();
		return this;
	}


	/**
	@hint Inserts an element into the list before the current element, makes it the current element and returns the list.
	*/
	public CircularlyDoublyLinkedList function insertBefore(required any data){
		var prevElement		= variables.currentElement.prevElement;
		var newElement		= createElement(data, variables.currentElement, prevElement);	// the new element goes before the current one, and after the current one's previous one

		// now make the previous element's next point to the new one; and the current element's prev point to the new one
		prevElement.nextElement			= newElement;
		variables.currentElement.prevElement	= newElement;
		
		// set the new one to be the current one
		variables.currentElement	= newElement;
		expose();
		return this;
	}


	/**
	@hint Inserts an element into the list after the current element, makes it the current element and returns the list.
	*/
	public CircularlyDoublyLinkedList function insertAfter(required any data){
		var nextElement		= variables.currentElement.nextElement;
		var newElement		= createElement(data, nextElement, variables.currentElement);	// the new element goes after the current one, and before the current one's next one

		// now make the next element's prev point to the new one; and the current element's next point to the new one
		nextElement.prevElement			= newElement;
		variables.currentElement.nextElement	= newElement;
		
		// set the new one to be the current one
		variables.currentElement	= newElement;
		expose();
		return this;
	}


	/**
	@hint Deletes the current element, makes the following element the current element and returns the list.
	*/
	public CircularlyDoublyLinkedList function delete(){
		var nextElement		= variables.currentElement.nextElement;
		var prevElement		= variables.currentElement.prevElement;

		// connect the two elements either side up with each other
		prevElement.nextElement = nextElement;
		nextElement.prevElement = prevElement;
		
		// get rid of this one
		structClear(variables.currentElement);
		variables.size--;
		
		// make the next one the current one
		variables.currentElement = nextElement;
		expose();

		return this;
	}
	
	
	/**
	@hint Points the current element to the previous element in the list.
	*/
	public CircularlyDoublyLinkedList function previous(){
		variables.currentElement = variables.currentElement.prevElement;
		expose();
		return this;
	}
	
	
	/**
	@hint Points the current element to the before the first element in the list.  A subsequent next() call will set the first element to be the current one.
	*/
	public CircularlyDoublyLinkedList function beforeFirst(){
		variables.currentElement = variables.firstElement.prevElement;
		expose();
		return this;
	}
	
	
	/**
	@hint Points the current element to the after the last element in the list.  A subsequent prev() call will set the last element to be the current one.
	*/
	public CircularlyDoublyLinkedList function afterLast(){
		variables.currentElement = variables.firstElement;
		expose();
		return this;
	}
	
	
	/**
	@hint Points the current element to the last element of the list.
	*/
	public CircularlyDoublyLinkedList function last(){
		variables.currentElement = variables.firstElement.prevElement;
		expose();
		return this;
	}
	
	
	/**
	@hint Returns true if the current element is the last element of the list, otherwise false.
	*/
	public boolean function isEndOfList(){
		return currentElement.nextElement.id == variables.firstElement.id;
	}


	// PRIVATE METHODS
	
	/**
	@hint Creates a new element with the specified data, next and previous values.  If no next or previous arguments are passed, uses the element itself as those values.
	*/
	private struct function createElement(required any data, struct nextElement, struct prevElement){
		var element = super.createElement(argumentCollection=arguments);

		if (!structKeyExists(arguments, "nextElement")){
			element.nextElement = element;
		}
		if (structKeyExists(arguments, "prevElement")){
			element.prevElement = arguments.prevElement;
		}else{
			element.prevElement = element;
		}

		return element;
	}


	/**
	@hint Exposes the current node to the calling code via the this scope (exposed as data, id, nextElement, prevElement).
	*/	
	private void function expose(){
		super.expose();
		this.prevElement= variables.currentElement.prevElement;
	}
	

}