<?php
class Language
{
    public $lang;
    public function __construct($lang)
    {
        $this->lang = $lang;
    }
}

class Languages
{
    public function all()
    {
        return [
            new Language("English"), new Language("Maori")
        ];
    }
}
$langs = new Languages();


$rules = [
    "type1"=>"rule 1",
    "type2"=>"rule 2",
    "type3"=>"rule 3",
    "type4"=>"rule 4"
];


function constructRules($rules, \Languages $langs)
{
    foreach ($rules as $fieldType => $rule) {
        foreach ($langs->all() as $lang) {
            //line below changes
            $langRules[$fieldType . '[' . $lang->lang . ']'] = $rule;
        }
    }
    return $langRules;
}

$result = constructRules($rules, $langs);

echo "<pre>";
var_dump($result);
echo "</pre><hr>";


function constructRulesUsingCallBack($rules, \Languages $langs, $task)
{
    foreach ($rules as $fieldType => $rule) {
        foreach ($langs->all() as $lang) {
            $task($langRules, $fieldType, $lang, $rule);
        }
    }
    return $langRules;
}

$result = constructRulesUsingCallBack($rules, $langs, function (&$langRules, $fieldType, $lang, $rule) {
    $langRules[$fieldType . '[' . $lang->lang . ']'] = $rule;
});
echo "<pre>";
var_dump($result);
echo "</pre><hr>";
