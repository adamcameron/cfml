<?php
require_once '../../../vendor/autoload.php';

$loader = new Twig_Loader_Array(
    ['index' => "G'day {{ name }}!"]
);
$twig = new Twig_Environment($loader);

$template = $twig->loadTemplate('gdayWorld.html.twig');
echo$template->render('index', [
	'greeting'	=> 'G\'day',
	'name'		=> 'Zachary'
]);