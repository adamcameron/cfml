<?php 
$raw  ="one [one] two [two] three [three] four [four]";
$mapping = [
	"[four]" => "wha",
	"[three]" => "toru",
	"[two]" => "rua",
	"[one]" => "tahi"
];


foreach ($mapping as $token=>$replacement){
	$raw = str_replace($token, $replacement, $raw);
}
echo $raw;