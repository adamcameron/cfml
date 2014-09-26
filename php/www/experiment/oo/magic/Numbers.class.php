<?php
// Numbers.class.php

class Numbers {

    use Message;

    private $numbers = [
        "one"=>"tahi",
        "two"=>"rua",
        "three"=>"toru",
        "four"=>"wha",
        "five"=>"rima"
    ];

    public  function __tostring(){
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        $result = '<table border="1"><thead><tr><th>English</th><th>Maori</th></tr></thead><tbody>';
        foreach($this->numbers as $english=>$maori){
            $result .= "<tr><td>$english</td><td>$maori</td></tr>";
        }
        $result .= '</tbody></table>';
        return $result;
    }

    public function __invoke(){
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        return [
            "numbers" => $this->numbers
        ];
    }

    public static function __set_state($properties){
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        $obj = new Numbers();
        $obj->numbers = $properties["numbers"];
        $obj->foo = "bar";
        return $obj;
    }


}