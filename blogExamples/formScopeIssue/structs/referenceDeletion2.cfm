<cfscript>
	test1.mainStruct = {
		topKey = "top value",
		middleStruct = {
			middleKey = "middle value",
			innerStruct = {
				innerKey = "inner value"
			}
		}
	};

	test1.refToMiddleStruct	= test1.mainStruct.middleStruct;
	test1.refToMiddleStructSpare	= test1.mainStruct.middleStruct;
	test1.refToInnerStruct		= test1.refToMiddleStruct.innerStruct;

	test2 = duplicate(test1);	// just to save us having to do the whole lot again

	writeOutput("<h2>Initial state</h2>");
	writeDump(test1);

	structClear(test1.refToMiddleStruct);
	writeOutput("<h2>After structClear(test1.refToMiddleStruct)</h2>");
	writeDump(test1);

	structDelete(test2, "refToMiddleStruct");
	writeOutput("<h2>After structDelete(test2, ""refToMiddleStruct"")</h2>");
	writeDump(test2);
</cfscript>