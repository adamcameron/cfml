<?php

class Collection implements \ArrayAccess
{
    protected $collection;
    protected $index;

    public function __construct($array){
        $this->collection = $array;
    }

    public function getCollection(){
        return $this->collection;
    }


    public function offsetExists($index)
    {
        return array_key_exists($index, $this->collection);
    }
        
    public function offsetGet($index)
    {
        return $this->collection[$index];
    }
        
    public function offsetSet($index, $value)
    {
        echo "offsetSet() called with $index, $value<br>";
        if (is_null($index)) {
            $this->collection[] = $value;
        } else{
            $this->collection[$index] = $value;
        }
    }

    public function offsetUnset($index)
    {
        unset($this->collection[$index]);
    }
}


$numbers = ['a', 'b', 'c', 'd'];

// using collection
echo 'Collection:<br>';

$numbersCollection = new Collection($numbers);
echo 'After initialisation<br>';
var_dump($numbersCollection->getCollection());
echo '<hr>';

$numbersCollection[4] = 'e';
echo 'After setting [4]<br>';
var_dump($numbersCollection->getCollection());
echo '<hr>';


$numbersCollection[] = 'f';
echo 'After setting []<br>';
var_dump($numbersCollection->getCollection());
echo '<hr>';

echo '<br><br><br>';


// using array
echo 'Array:<br>';

echo 'After initialisation<br>';
var_dump($numbers);
echo '<hr>';

$numbers[4] = 'e';
echo 'After setting [4]<br>';
var_dump($numbers);
echo '<hr>';


$numbers[] = 'f';
echo 'After setting []<br>';
var_dump($numbers);
echo '<hr>';

