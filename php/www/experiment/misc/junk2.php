<?php
$rules = ["FT1"=>"R1", "FT2"=>"R2", "FT3"=>"R3", "FT4"=>"R4", "FT5"=>"R5"];
$langs = ["L1", "L2", "L3", "L4", "L5"];



function constructRules($rules, $langs)
{
    foreach ($rules as $fieldType => $rule) {
        foreach ($langs as $lang) {
            $langRules[$fieldType . '[' . $lang . ']'] = $rule;
        }
    }
    return $langRules;
}

$langRules = constructRules($rules, $langs);

echo "<pre>";
var_dump($langRules);
echo "</pre>";


function constructRulesUsingCallBack($rules, $langs, $task)
{
    $langRules = [];
    foreach ($rules as $fieldType => $rule) {
        foreach ($langs as $lang) {
            $task($langRules, $fieldType, $lang, $rule);
        }
    }
    return $langRules;
}


$langRules = constructRulesUsingCallBack($rules, $langs, function (&$langRules, $fieldType, $lang, $rule) {
    $langRules[$fieldType . '[' . $lang . ']'] = $rule;
});

echo "<hr><pre>";
var_dump($langRules);
echo "</pre>";
