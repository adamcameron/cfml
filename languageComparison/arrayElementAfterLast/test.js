requestedIndex = process.argv[2];
numbers = ["tahi", "rua", "toru", "wha"];

elementIsUndefined = numbers[requestedIndex] == undefined;
console.log("The requested element is undefined: " + elementIsUndefined);

requestedElement = numbers[requestedIndex];
console.log("The element requested is: " + requestedElement);
