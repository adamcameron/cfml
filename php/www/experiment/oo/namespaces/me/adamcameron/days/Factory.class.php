<?php
// Factory.class.php

namespace me\adamcameron\days {

    class Factory
    {
        private static $days = ["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"];

        private $day;

        public function __construct()
        {
            $this->day = self::$days[rand(0, count(self::$days)-1)];
        }

        public function get()
        {
            return $this->day;
        }
    }
}
