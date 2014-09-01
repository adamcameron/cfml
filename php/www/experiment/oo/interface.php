<?php
// interface.php

require_once("app_autoload.php");

$circle = new Circle(7);

echo $circle->serialise();