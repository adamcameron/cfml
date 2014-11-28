<?php
$raw = $_GET["date"];
$localeFromUser = array_key_exists("locale", $_GET) ? $_GET["locale"] : "en-GB";
$locale = setlocale(LC_TIME, $localeFromUser);


echo "Raw: $raw<br>";
echo "Locale: $localeFromUser -> $locale<br>";

$date = DateTime::createFromFormat("d/m/Y", $raw);
printf("date: %s<br>", $date->format(DateTime::RFC822));

function dateToString($date, $locale) {
	$dateFormatter = new IntlDateFormatter($locale, IntlDateFormatter::LONG, IntlDateFormatter::NONE,null,null,"EEEE d LLLL, yyyy"); // %A %#d %B, %Y
	return $dateFormatter->format($date);
}

$formattedDate = dateToString($date, $localeFromUser);
echo "Formatted date: $formattedDate<br>";

$oneDay = new DateInterval("P1D");
$followingDay = $date->add($oneDay);
printf("Following day: %s<br>", dateToString($followingDay, $localeFromUser));

$daysUntilNow = $date->diff(new DateTime());
printf("Days until now: %s<br>", $daysUntilNow.format("d"));