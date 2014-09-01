<?php
// testCheck.php

require_once("app_autoload.php");

$circle = new Circle(7);

echo sprintf("A circle is a Circle: %b<br>", $circle instanceof Circle);
echo sprintf("A circle is a TwoDimensionalShape: %b<br>", $circle instanceof TwoDimensionalShape);
echo sprintf("A circle is a Shape: %b<br>", $circle instanceof Shape);
echo sprintf("A circle is Serialisable: %b<br>", $circle instanceof Serialisable);
echo "<br>";
echo sprintf("A circle is a Square: %b<br>", $circle instanceof Square);