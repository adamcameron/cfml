<?php
$rainbow	= [
	"red"=>"Whero",
	"orange"=>"Karaka",
	"yellow"=>"Kowhai",
	"green"=>"Kakariki",
	"blue"=>"Kikorangi",
	"indigo"=>"Poropango",
	"violet"=>"Papura"
];

array_reduce($rainbow, function($reduction, $current){
	echo "<pre>";
	var_dump(func_get_args());
	echo "</pre><hr>";

},[]);
