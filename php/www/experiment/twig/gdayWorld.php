<?php
require_once '../../../vendor/autoload.php';

$loader = new Twig_Loader_Array(
    ['index' => "G'day {{ name }}!"]
);
$twig = new Twig_Environment($loader);

echo $twig->render('index', ['name' => 'Zachary']);