<?php
function squareIt($x): int {
    return $x ** 2;
}

$result = squareIt(42);
echo "squareIt(42): [$result]<br>";

$result = squareIt('hi');
echo "squareIt('hi'): [$result]<br>";
