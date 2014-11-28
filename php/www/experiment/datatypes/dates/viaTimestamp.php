<?php
$raw = $_GET["date"];
$localeFromUser = array_key_exists("locale", $_GET) ? $_GET["locale"] : "en-GB";
$locale = setlocale(LC_TIME, $localeFromUser);

echo "Raw: $raw<br>";
echo "locale: $localeFromUser -> $locale<br>";

$date = strtotime($raw);
echo "date: $date<br>";

function dateToString($date){
	return strftime("%A %#d %B, %Y", $date);
}

$formattedDate = dateToString($date);
echo "Formatted date: $formattedDate<br>";

$followingDay = strtotime('+1 day', $date);
printf("Following day: %d / %s<br>", $followingDay, dateToString($followingDay));

