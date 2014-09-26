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

}
