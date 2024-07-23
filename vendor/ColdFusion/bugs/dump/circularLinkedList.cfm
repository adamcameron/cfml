<cfscript>
linkedList = {
	id = 1
};

linkedList.next = {
	id = 2	
};
linkedList.next.next = {
	id = 3	
};
linkedList.next.next.next = linkedList;

writeDump(linkedList);
</cfscript>