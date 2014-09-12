<?php
// Factories.class.php

namespace me\adamcameron\numbers\maori {

    class Factory
    {
        private static $numbers =  ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];

        private $number;

        public function __construct()
        {
            $this->number = self::$numbers[rand(0, count(self::$numbers)-1)];
        }

        public function get()
        {
            return $this->number;
        }
    }
}

namespace me\adamcameron\numbers\english {

    class Factory
    {
        private static $numbers =  ["one","two","three","four","five","six","seven","eight","nine","ten"];

        private $number;

        public function __construct()
        {
            $this->number = self::$numbers[rand(0, count(self::$numbers)-1)];
        }

        public function get()
        {
            return $this->number;
        }
    }
}
