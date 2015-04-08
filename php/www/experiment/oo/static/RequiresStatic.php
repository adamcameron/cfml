<?php
interface RequiresStatic {
	public static function f($x, $y);
};

class Implementation implements RequiresStatic {
	public static function f($x, $y){

	}
}


$o = new Implementation();