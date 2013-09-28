<?php
$rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];

foreach ($rainbow as &$v) {
	$v = strtoupper($v);
}
echo json_encode($rainbow);
?>
