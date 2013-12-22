// TestMakeStopwatch.cfc
component extends="testbox.system.testing.BaseSpec" {

	public void function beforeTests(){
		addAssertions({
			assertStructKeysCorrect	= function(required string keys, required struct struct, string message){
				var assertionArgs = {
					expected = listSort(keys, "textnocase"),
					actual	 = listSort(structKeyList(struct), "textnocase")
				};
				if (structKeyExists(arguments, "message")){
					assertionArgs.message = message;
				}
				$assert.isEqual(argumentCollection=assertionArgs);
			}
		});

		include "makeStopwatch.cfm";
	}

	public void function testBaseLine(){
		makeStopwatch();
	}

	public void function testReturnValues(){
		var stopwatch = makeStopwatch();
		$assert.isTrue(isStruct(stopwatch), "Returned value should be a struct");

		$assert.assertStructKeysCorrect(
			"start,lap,stop,getTimeline",
			stopwatch,
			"Incorrect methods return for Stopwatch"
		);

		$assert.isTrue(
			isClosure(stopwatch.start),
			"The returned start() value should be a function"
		);
		$assert.isTrue(
			isClosure(stopwatch.lap),
			"The returned lap() value should be a function"
		);
		$assert.isTrue(
			isClosure(stopwatch.stop),
			"The returned stop() value should be a function"
		);
		$assert.isTrue(
			isClosure(stopwatch.getTimeline),
			"The returned getTimeline() value should be a function"
		);
	}

	public void function testMethodSignatureOfStart(){
		testMethodSignature("start");
	}

	public void function testMethodSignatureOfLap(){
		testMethodSignature("lap");
	}
	public void function testMethodSignatureOfStop(){
		testMethodSignature("stop");
	}

	private void function testMethodSignatureOfGetTimeline(){
		var stopwatch = makeStopwatch();
		var result = stopwatch.getTimeLine();

		$assert.typeOf("array", result, "getTimeLine() should return an array");
	}

	public void function testCustomStartMessage(){
		testCustomMessage("start");
	}

	public void function testCustomLapMessage(){
		testCustomMessage("lap");
	}

	public void function testCustomStopMessage(){
		testCustomMessage("stop");
	}

	public void function testDefaultStartMessage(){
		testDefaultMessage("start");
	}

	public void function testDefaultLapMessage(){
		testDefaultMessage("lap");
	}

	public void function testDefaultStopMessage(){
		testDefaultMessage("stop");
	}

	public void function testGetTimelineRetunValueBeforeStart(){
		var stopwatch = makeStopwatch();
		var result = stopwatch.getTimeLine();
		$assert.isEqual([], result, "getTimeLine() should return an empty array");
	}

	public void function testStartInitalises(){
		var stopwatch = makeStopwatch();
		var result = stopwatch.start();

		$assert.closeTo(getTickCount(), result.currentClock, 16);
		$assert.isEqual(0, result.lapDuration, "lapDuration incorrect");
		$assert.isEqual(0, result.totalDuration, "lapDuration incorrect");
	}

	public void function testFirstLap(){
		var sleepDuration = 500;
		var stopwatch = makeStopwatch();
		var start = stopwatch.start();
		sleep(sleepDuration);
		var lap = stopwatch.lap();

		$assert.closeTo(getTickCount(), lap.currentClock, 16);
		$assert.closeTo(sleepDuration, lap.lapDuration, 16);
		$assert.closeTo(sleepDuration, lap.totalDuration, 16);
	}

	public void function testSecondLap(){
		var sleepDuration = 500;
		var stopwatch = makeStopwatch();
		var start = stopwatch.start();

		sleep(sleepDuration);
		stopwatch.lap();

		sleep(sleepDuration);
		var lap = stopwatch.lap();

		$assert.closeTo(getTickCount(), lap.currentClock, 16);
		$assert.closeTo(sleepDuration, lap.lapDuration, 16);
		$assert.closeTo(sleepDuration*2, lap.totalDuration, 16);
	}

	public void function testStop(){
		var sleepDuration = 500;
		var stopwatch = makeStopwatch();
		var start = stopwatch.start();
		sleep(sleepDuration);
		var stop = stopwatch.stop();

		$assert.closeTo(getTickCount(), stop.currentClock, 16);
		$assert.closeTo(sleepDuration, stop.lapDuration, 16);
		$assert.closeTo(sleepDuration, stop.totalDuration, 16);
	}

	private void function testMethodSignature(required string methodToTest){
		var stopwatch = makeStopwatch();
		var result = invoke(stopwatch, methodToTest);

		$assert.typeOf("struct", result, "#methodToTest#() should return a struct");
		$assert.assertStructKeysCorrect(
			"currentClock,lapDuration,totalDuration,message",
			result,
			"Incorrect keys returned by #methodToTest#()"
		);

		var md = getMetadata(stopwatch[methodToTest]);
		$assert.isEqual(
			{name="message", type="string", required=false},
			{name=md.parameters[1].name, type=md.parameters[1].type, required=md.parameters[1].required},
		 	"#methodToTest#() should take an optional string argument 'message'"
		 );
	}

	private void function testCustomMessage(required string methodToTest){
		var stopwatch = makeStopwatch();
		var message = "TEST_MESSAGE_#methodToTest#";
		var result = invoke(stopwatch, methodToTest, {message=message});

		$assert.isEqual(message, result.message, "Incorrect message used for #methodToTest#()");
	}

	private void function testDefaultMessage(required string methodToTest){
		var stopwatch = makeStopwatch();
		var result = invoke(stopwatch, methodToTest);

		$assert.isEqual(methodToTest, result.message, "Incorrect message used for #methodToTest#()");
	}

}