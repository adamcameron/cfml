$(document).ready(
	function(){
		app.modules.test.controlSet1 = new app.modules.test.Controls("set1", "display");
		app.modules.test.controlSet2 = new app.modules.test.Controls("set2", "display");

		app.modules.test.display = new app.modules.test.Display("display");
	}
)