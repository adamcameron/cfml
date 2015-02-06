<?php
require_once '../../../vendor/autoload.php';

$loader = new Twig_Loader_Filesystem('.');

$twig = new Twig_Environment($loader);

$template = $twig->loadTemplate('gdayWorld.html.twig');

echo $template->render([
	'greeting'	=> "G'day",
	'name'		=> 'Zachary'
]);