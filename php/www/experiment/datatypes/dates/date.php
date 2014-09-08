<?php
$masks = [
	"c"		=> "ISO"
	,"r" => "RFC 2822"
	,"l j F, Y" => ""
	,"jS" => ""
	,"t" => "days in month"
	,"L" => "Leap year?"
	,"H:i:s" => ""
	,"e" => "TZ"
	,"U" => "Seconds since Unix epoch"
	,"Z" => "TZ offset in seconds"
];
echo '<table border="1"><thead><tr><th>Label (Mask)</th><th>Result</th></tr></thead><tbody>';
foreach ($masks as $mask=>$label){
	$label = $label ==  "" ? $mask : $label;
	echo sprintf("<tr><td>%s (%s)</td><td>%s</tr>", $label, $mask, date($mask));
}
echo "</tbody></table>";

$ts = new DateTime();
echo  $ts->format("H:i:s.u");