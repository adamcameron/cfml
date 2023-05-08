<?php
$f = function ($a) {
	$s = $a;
	sort($s);
	
	$breakOnBoolean = function($b){
		return function($a, $f) use ($b){
			$r = !$b;
			foreach ($a as $i=>$v) {
				$r = $f($v, $i);
				if ($r == $b) return $r;
			}
			return $r;
		};
	};
	$some = $breakOnBoolean(1);
	$every = $breakOnBoolean(0);
	
	$equals = function($a1, $a2) use ($every) {
		return $every($a1, function($v, $i) use ($a2) {
			return $v == $a2[$i];
		});
	};
	
	if ($equals($a, $s)) return 1;
	
	$swp = function($a, $i, $j) {
		$t = $a[$i];
		$a[$i] = $a[$j];
		$a[$j] = $t;
		
		return $a;
	};
	
	return $some($a, function($_, $i) use ($a, $some, $swp, $equals, $s) {
		$r = array_slice($a, $i+1);

		return $some($r, function($_, $j) use ($i, $swp, $a, $equals, $s) {
			return $equals($s, $swp($a, $i, $i+$j+1));
		});
	});
};

require __DIR__ . "\Tester.php";
Tester::runTests($f);
