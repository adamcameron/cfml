<?php
namespace dac;

writeOutput("#getCurrentTemplatePath()# read<br>");

require_once DEPENDENCY_DIR . '/Dependency.php';

class BrokenSubClass extends BaseClass {

	function init(){
        writeOutput("#getCurrentTemplatePath()# constructor executed<br>");
	}

}
