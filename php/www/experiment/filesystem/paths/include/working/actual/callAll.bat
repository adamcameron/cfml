@echo off
rem callAll.bat
echo PHP
cd ..
php actual\callMe.php
cd actual
php callMe.php
echo ==============================
echo.

echo RUBY
cd ..
ruby actual\callMe.rb
cd actual
ruby callMe.rb
echo ==============================
echo.

echo PYTHON
cd ..
python actual\callMe.py
cd actual
python callMe.py
echo ==============================