<?php
// circle.php

require_once("app_autoload.php");

$circle = new Circle(7);

echo "Dimensions: " . $circle->getDimensions() . "<br>";
echo "Perimeter (circumference): " . $circle->getPerimeter() . " (" . $circle->getCircumference() . ")<br>";
echo "Area: " . $circle->getArea() . "<br>";
