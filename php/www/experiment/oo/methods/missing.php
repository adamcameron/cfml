<?php
// missing.php

require "Missing.class.php";

$missing = new Missing();

$missing->nonExistent("first", ["second"]);
