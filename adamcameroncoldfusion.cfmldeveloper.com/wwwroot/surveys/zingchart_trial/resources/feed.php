<?php
$min = isset($_GET['min'])?intval($_GET['min']):0;
$max = isset($_GET['max'])?intval($_GET['max']):50;
$plots = isset($_GET['plots'])?intval($_GET['plots']):1;
?>
[
	{
		<?php
		for ($plot=0;$plot<$plots;$plot++) {
		?>
		"plot<?php echo $plot; ?>" : <?php echo rand($min, $max); ?>,
		<?php
		}
		?>
		"scale-x" : "<?php echo date('H:i:s'); ?>"
	}
]