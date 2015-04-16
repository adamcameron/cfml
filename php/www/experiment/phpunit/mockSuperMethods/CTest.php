<?php
class CTest extends PHPUnit_Framework_TestCase
{

    public function testG_actual()
    {
        $c = new \mockSuperMethods\C();
        $actual = $c->g();
        $this-assert('From Grandparent updated by Child', $actual);
    }
}