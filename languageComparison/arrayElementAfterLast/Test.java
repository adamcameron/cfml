 class Test {
	 public static void main(String[] args){
		int requestedIndex = Integer.parseInt(args[0]);
		String[] numbers = {"tahi", "rua", "toru", "wha"};

		Boolean elementIsUndefined = numbers[requestedIndex] == null;
		System.out.println("The requested element is undefined: " + elementIsUndefined.toString());
		
		String requestedElement = numbers[requestedIndex];
		System.out.println("The element requested is: " + requestedElement);
	 }
 }
 
 
 



