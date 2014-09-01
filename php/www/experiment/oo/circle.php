<?php
// circle.php

require_once("app_autoload.php");

$circle = new Circle(7);

echo "Dimensions: " . $circle->getDimensions() . "<br>";
echo "Circumference: " . $circle->getCircumference() . "<br>";
echo "Circumference (perimeter): " . $circle->getCircumference() . " (" . $circle->getPerimeter() . ")<br>";
echo "Area: " . $circle->getArea() . "<br>";