// CacheDemo.cfc
component {
	function getTime(String name, Numeric age) cachedwithin=createTimespan(0,0,0,10) {
		return Now() & " " & arguments.name & " " & arguments.age;
	}
}