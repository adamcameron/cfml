<?php
// formBasic.php

$colours = array("whero", "karaka", "kowhai", "kakariki", "kikorangi", "tawatawa", "mawhero");
$numbers = array("tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau");
?>

<form method="post" action="dumpPost.php">
	Colours:<br>
	<?php foreach($colours as $colour){ ?>
		<input type="checkbox" name="colour" value="<?= $colour ?>"><?= $colour ?><br>
	<?php } ?>
	<hr>Number:<br>
	<?php foreach($numbers as $number){ ?>
		<input type="checkbox" name="number" value="<?= $number ?>"><?= $number ?><br>
	<?php } ?>
	<input type="submit" name="btnSubmit" value="Submit">
</form>
