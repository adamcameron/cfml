<?php
class CTest extends PHPUnit_Framework_TestCase
{

    public function testG_actual()
    {
        $c = new \mockSuperMethods\C();
        $actual = $c->g();
        $this->assertEquals('From Grandparent updated by Child', $actual);
    }

    public function testG_mockedF()
    {
        $c = $this->getMockBuilder('mockSuperMethods\C')
                ->setMethods(['f'])
                ->getMock();
        $c->expects($this->any())
            ->method('f')
            ->willReturn('mocked');

        $actual = $c->g();
        $this->assertEquals('mocked updated by Child', $actual);

    }
}