<?php
// square.php

require_once("app_autoload.php");

$square = new Square(7);

echo "Dimensions: " . $square->getDimensions() . "<br>";
echo "Perimeter (circumference): " . $circle->getPerimeter() . " (" . $circle->getCircumference() . ")<br>";
echo "Area: " . $circle->getArea() . "<br>";