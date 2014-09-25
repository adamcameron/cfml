<?php
// address.php

require_once "./app.php";

$address = new Address("221b Baker Street", "London", "England", new Phone("+44", "020", "12345678"));
new dBug([get_class($address), $address->get()]);

$serialisedAddress = serialize($address);


echo "<pre>$serialisedAddress</pre><hr>";

$deserialisedAddress = unserialize($serialisedAddress);

new dBug([get_class($deserialisedAddress), $deserialisedAddress->get()]);
