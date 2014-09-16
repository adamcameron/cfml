<?php
class Person
{
    private $firstName;
    private $lastName;

    public function __set($name, $value)
    {
        echo sprintf("%s() called with %s, %s<br>", __FUNCTION__, $name, $value);
        $this->$name = $value;
    }

    public function __get($name)
    {
        echo sprintf("%s() called with %s<br>", __FUNCTION__, $name);
        return $this->$name;
    }

    public function __isset($name)
    {
        echo sprintf("%s() called with %s<br>", __FUNCTION__, $name);
        return isset($this->$name);
    }

    public function __unset($name)
    {
        echo sprintf("%s() called with %s<br>", __FUNCTION__, $name);
        unset($this->$name);
    }

}
