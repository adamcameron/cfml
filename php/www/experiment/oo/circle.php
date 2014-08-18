<?php
// circle.php

require_once("app_autoload.php");

$circle = new Circle(5);

echo "Dimensions: " . $circle->getDimensions() . "<br>";
echo "Circumference: " . $circle->getCircumference() . "<br>";
echo "Area: " . $circle->getArea() . "<br>";