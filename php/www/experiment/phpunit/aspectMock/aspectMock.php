<?php
require "autoload.php";

use AspectMock\Test as test;

$actual = new User();
echo "Actual user created OK<br>";
printf("\$actual instanceof User: %b<br><br>", $actual instanceof User);

$user = test::double($actual, ['getName' => function(){return "MOCKED";}]);
echo "\$actual mocked as \$user<br><br>";
printf("\$user instanceof AspectMock\Proxy\InstanceProxy: %b<br>", $user instanceof AspectMock\Proxy\InstanceProxy);
printf("\$user1 === \$user2->getObject(): %b<br><br>", $actual === $user->getObject());

echo "calling actual getName() method<br>";
$name = $actual->getName();
$name = $actual->getName();
echo "[$name]<br><br>";


echo "calling mocked getName() method<br>";
$name = $user->getName();
echo "[$name]<br><br>";


echo "end<br>";

