<?php
// missing.php

require "Missing.class.php";

$missing = new Missing();

$missing->nonExistent("first", ["second"]);
echo "<hr>";

Missing::nonExistent("tuatahi", ["tuarua"]);
