<?php
$rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
echo json_encode($rainbow) . "\n";

$newRainbow = array_map(
	function($v) {
		return strtoupper($v);
	},
	$rainbow
);
echo json_encode($newRainbow);
?>
