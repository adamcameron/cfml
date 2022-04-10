component {
	public Foo[] function getFoos() output="no" {
		var mycfc = createObject("component", "Foo");
		var result = [];
		result[1] = mycfc;
		return result;
	}
}