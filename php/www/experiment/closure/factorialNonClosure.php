<?php
// factorialNonClosure.php

function f($x){
	return $x > 1 ? $x * f($x-1) : 1;
};


echo f(4);