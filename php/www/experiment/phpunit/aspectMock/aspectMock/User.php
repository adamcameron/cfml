<?php
class User
{
    private $name;

    public function __construct()
    {
        echo "User->__construct() called\n";
    }

    public function setName($name)
    {
        echo "User->setName() called\n";
        $this->name = $name;
    }

    public function getName()
    {
        echo "User->getName() called\n";
        return $this->name;
    }

    public function save()
    {
        echo "User->save() called\n";
    }
}
