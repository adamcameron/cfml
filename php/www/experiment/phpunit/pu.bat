@echo off
cls
rem phpunit --process-isolation --bootstrap test/autoload.php %1
phpunit --bootstrap test/autoload.php %1