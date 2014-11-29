<?php
$raw = $argv[1];

$localeFromUser = array_key_exists(2, $argv) ? $argv[2] : "en-GB";
$locale = setlocale(LC_TIME, $localeFromUser);


echo "Raw: $raw\n";
echo "locale: $localeFromUser -> $locale\n";


$date = strtotime($raw);
echo "date: $date\n";


function dateToString($date){
	return strftime("%A %#d %B, %Y", $date);
}


$formattedDate = dateToString($date);
echo "Formatted date: $formattedDate\n";


$futureDate = strtotime('+1 year +1 month +1 week +1 day +1 hour', $date);
printf("Future date: %d / %s\n", $futureDate, dateToString($futureDate));


$secondsUntilNow = $futureDate - time();
$daysUntilNow = (int) ($secondsUntilNow / (24 * 60 * 60));
printf("Difference from now (days): %s\n", $daysUntilNow);