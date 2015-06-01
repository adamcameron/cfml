<?php

$patterns = [
    '/^\/users\/[^\/]+\/idfromemail\//',
    '/^\/users\/[0-9]+\/bookings\/[0-9]+\/resend-confirmation\//',
    '/^\/suggestions\//',
    '/^\/properties\/[0-9]+\/alternatives/',
    '/^\/countries\/[0-9]+\/properties\/top\/\?/',
    '/^\/countries\/[0-9]+\/areas\//',
    '/^\/areas\/[0-9]+\/properties\/top\/\?/',
    '/^\/properties\/[0-9]+\/bookingPrompt/',
    '/^\/properties\/top-rated\/\?/',
    '/^\/cities\/\?/',
    '/^\/cities\/top\//',
    '/^\/cities\/mappings\//',
    '/^\/cities\/[0-9]+\/static\/properties\/\?/',
    '/^\/cities\/[0-9]+\/properties\//',
    '/^\/users\/newsletter\/signup\//',
    '/^\/users\/password\//',
    '/^\/users\/passwordreset\/[^\/]+\//',
    '/^\/customerservice\//',
    '/^\/users\/[0-9]+\/bookings\/[0-9]+\//',
    '/^\/users\/[0-9]+\/bookings\//',
    '/^\/users\/[0-9]+\/password\//',
    '/^\/users\/[0-9]+\/preferences\//',
    '/^\/users\/[0-9]+\/password\//',
    '/^\/users\/[0-9]+\/payment-methods\/[0-9a-zA-Z]+\//',
    '/^\/users\/[0-9]+\/payment-methods\//',
    '/^\/users\/[0-9]+\//',
    '/^\/users\//',
    '/^\/cities\/[0-9]+\/reviews\//',
    '/^\/users\/[0-9]+\/reviews\//',
    '/^\/reviews\/[-0-9a-f]+\//',
];

foreach($patterns as $pattern){
	$result = preg_match($pattern, $_GET['string']);
	echo sprintf('%s: %b<br>', $pattern, $result);
	$result && die;	

}