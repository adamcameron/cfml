<?php
// passingUnspecifiedArguments.php

function acceptsAdditionalArgs($arg1, $arg2){
	echo "Defined arguments:\r\n";
	var_dump(get_defined_vars());

	echo "\r\nAll arguments:\r\n";
	var_dump(func_get_args());
}

acceptsAdditionalArgs("arg1 value", "arg2 value", "arg3 value", "arg4 value");