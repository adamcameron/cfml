<?php

namespace dac;

writeOutput("#getCurrentTemplatePath()# read<br>");

require_once __DIR__ . '/appConfig.php';

class BaseClass {

    function init(){
        writeOutput("#getCurrentTemplatePath()# constructor executed<br>");
    }


}
