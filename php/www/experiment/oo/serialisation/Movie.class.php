<?php
// Movie.class.php

class Movie
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
