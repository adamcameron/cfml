<?php

class Collection implements Iterator, Countable, ArrayAccess
{
    protected $collection;
    protected $index;

    public function __construct($array){
        $this->collection = $array;
    }

    public function getCollection(){
        return $this->collection;
    }

    public function current()
    {
        return $this->collection[$this->index];
    }

    public function key()
    {
        return $this->index;
    }

    public function next()
    {
        ++$this->index;
    }
    public function rewind()
    {
        $this->index = 0;
    }

    public function valid()
    {
        return array_key_exists($this->index, $this->collection);
    }

    public function count()
    {
        return count($this->collection);
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
        echo "offsetSet() called with [$index], [$value]<br>";
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


$numbers = ['tahi', 'rua', 'toru', 'wha'];
$numbersCollection = new Collection($numbers);
printf('Collection after initialisation: %s<br>', json_encode($numbersCollection->getCollection()));
echo '<hr>';

foreach ($numbersCollection as $number) {
   echo "$number<br>";
}
echo '<hr>';

$numbersCollection[4] = 'rima';
printf('Collection after setting [4]: %s<br>', json_encode($numbersCollection->getCollection()));

for ($i=0; $i < count($numbersCollection); $i++){
   printf('%s<br>', $numbersCollection[$i]);
}
echo '<hr>';

$numbersCollection[] = 'ono';
echo  $numbersCollection[5];
printf('Collection after setting []: %s<br>', json_encode($numbersCollection->getCollection()));
echo '<hr>';

$uppercaseNumbers = array_map(function($number){
    return strtoupper($number);
}, $numbersCollection);
printf('Collection used in array_map(): %s<br>', json_encode($uppercaseNumbers));
echo '<hr>';

$collectionAsArray = iterator_to_array($numbersCollection);
printf('Collection as array: %s<br>', json_encode($collectionAsArray));
echo '<hr>';


$uppercaseNumbers = array_map(function($number){
    return strtoupper($number);
}, $collectionAsArray);
printf('Collection (as array) used in array_map(): %s<br>', json_encode($uppercaseNumbers));
echo '<hr>';


$chunked = array_chunk($collectionAsArray, 2);
printf('Collection (as array) used in chunked(): %s<br>', json_encode($chunked));
echo '<hr>';


iterator_apply($numbersCollection, function($numbersCollection){
    printf('%s ', $numbersCollection->current());
    return true;
}, [$numbersCollection]);
echo '<hr>';
