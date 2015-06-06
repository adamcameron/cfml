<cfscript>
public string function convertPhoneLetters(required string oldNumber) {
  /**
  *Converts the letters in a phone number (a,k,p) to their numeric keypad equivalent (2,5,7). Coded for American phones but easily changed.
  *@author Brian Swartzfager
  *@version 1, July 28, 2012
  */
  var newNumber= arguments.oldNumber;
  var regArray= [
    "[A-Ca-c]",
    "[D-Fd-f]",
    "[G-Ig-i]",
    "[J-Lj-l]",
    "[M-Om-o]",
    "[P-Sp-s]",
    "[T-Vt-v]",
    "[W-Zw-z]"
  ];
		
  var resultArray= [
    2,3,4,5,6,7,8,9
  ];
		
  for (var x=1; x <= ArrayLen(regArray); x++) {
    newNumber= ReReplace(newNumber,regArray[x],resultArray[x],"all");
  }
		
  return newNumber;
}	
	
testNums= ["1-800-TRY-FOGO","555-212-cfml"];

for(x=1; x <= ArrayLen(testNums); x++) {
  result= convertPhoneLetters(testNums[x]);
  writeOutput(testNums[x] & ": " & result & "<br />");
}
</cfscript>