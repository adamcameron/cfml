<?php
class Book
{
    use Message;

    private $title;
    private $author;

    public function __construct($title, $author)
    {
        $this->title = $title;
        $this->author = $author;
    }

    public function __sleep()
    {
        return ["title"];
    }
}
