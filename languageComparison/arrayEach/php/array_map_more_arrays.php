<?php
$maoriNumbers = ["Tahi","Rua","Toru","Wha","Rima","Ono","Whitu","Waru","Iwa","Tekau"];
$russianNumbers = ["один","два","три","четыре","пять","шесть","семь","восемь","девять","десять"];
$digits = [1,2,3,4,5,6,7,8,9,10];

function translation($ma, $i, $ru){
	return "$ma ($i) in Russian is $ru<br>";
}

$translation = array_map("translation", $maoriNumbers, $digits, $russianNumbers);

foreach($translation as $number) {
	echo $number;
}
?>