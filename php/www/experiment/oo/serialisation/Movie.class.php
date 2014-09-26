<?php
// Movie.class.php

class Movie implements Serializable
{
    use Message;

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
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        $arrayToSerialise = $this->get();
        return json_encode($arrayToSerialise);
    }

    public function unserialize($serialized)
    {
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        $deserialisedArray = json_decode($serialized);

        $this->title = $deserialisedArray->title;
        $this->year = $deserialisedArray->year;

        $director = Person::unpackFullName($deserialisedArray->director);
        $this->director = new Person($director["firstName"], $director["lastName"]);
    }

    public function get()
    {
        return [
            "title" => $this->title,
            "year"  => $this->year,
            "director" => $this->director->getFullName()
        ];
    }

    public function __sleep()
    {
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
        return ["title", "year", "director"];
    }

    public function __wakeup()
    {
        SELF::message(__CLASS__, __FUNCTION__, func_get_args());
    }

}
