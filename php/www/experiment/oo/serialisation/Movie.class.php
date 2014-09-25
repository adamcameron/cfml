<?php
// Movie.class.php

require_once "Person.class.php";

class Movie /*implements Serializable */ {
    private $title;
    private $year;
    private $director;

    public function __construct($title, $year, $director)
    {
        $this->title = $title;
        $this->year = $year;
        $this->director = $director;
    }

    public function serialize()
    {
        $arrayToSerialise = $this->get();
        return json_encode($arrayToSerialise);
    }

    public function unserialize($serialized)
    {
        $deserialisedArray = json_decode($serialized);

        $this->title = $deserialisedArray->title;
        $this->year = $deserialisedArray->year;

        $director = Person::unpackFullName($deserialisedArray->director);
        $this->director = new Person($director->firstName, $director->lastName);
    }

    public function __sleep()
    {
        SELF::message(__FUNCTION__, func_get_args());
        return ["title", "year", "director"];
    }

    public function __wakeup()
    {
        SELF::message(__FUNCTION__, func_get_args());
    }

    public function get()
    {
        return [
            "title" => $this->title,
            "year"  => $this->year,
            "director" => $this->director->getFullName()
        ];
    }

    private static function message($function, $args)
    {
        echo sprintf("%s() called with arguments:<br>%s<br><br>", $function, json_encode($args));
    }

}
