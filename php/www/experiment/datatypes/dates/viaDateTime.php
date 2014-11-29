<?php
$raw = $argv[1];

$localeFromUser = array_key_exists(2, $argv) ? $argv[2] : "en-GB";
$locale = setlocale(LC_TIME, $localeFromUser);


echo "Raw: $raw\n";
echo "Locale: $localeFromUser -> $locale\n";


$date = DateTime::createFromFormat("d/m/Y", $raw);
printf("date: %s\n", $date->format(DateTime::RFC822));


function dateToString($date, $locale) {
	$dateFormatter = new IntlDateFormatter($locale, IntlDateFormatter::LONG, IntlDateFormatter::NONE,null,null,"EEEE d LLLL, yyyy"); // %A %#d %B, %Y
	return $dateFormatter->format($date);
}


$formattedDate = dateToString($date, $localeFromUser);
echo "Formatted date: $formattedDate\n";

$oneYearOneMonthOneWeekOneDayOneHour = new DateInterval("P1Y1M8DT1H");
$date->add($oneYearOneMonthOneWeekOneDayOneHour);
printf("Future date: %s\n", dateToString($date, $localeFromUser));


$daysUntilNow = $date->diff(new DateTime());
printf("Var type of date difference: %s\n", get_class($daysUntilNow));
printf("Difference from now (days): %s\n", $daysUntilNow->format("%R%a"));