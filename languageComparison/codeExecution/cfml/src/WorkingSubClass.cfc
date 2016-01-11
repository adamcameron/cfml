<?php
namespace dac;

writeOutput("#getCurrentTemplatePath()# read<br>");

class WorkingSubClass extends BaseClass {

	function init(){
        writeOutput("#getCurrentTemplatePath()# constructor executed<br>");
		require_once DEPENDENCY_DIR . '/Dependency.php';
	}

}
