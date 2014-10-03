@echo off
echo Calling: %1
echo Logging to: %2
php actual\%1 > %2
cd actual
php ./%1 >> %2
cd ..