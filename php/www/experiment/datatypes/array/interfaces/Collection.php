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

echo '<h3>initialise</h3>';
$numbers = ['tahi', 'rua', 'toru', 'wha'];
$numbersCollection = new Collection($numbers);
printf('Collection after initialisation: %s<br>', json_encode($numbersCollection->getCollection()));
echo '<hr>';

echo '<h3>foreach()</h3>';
foreach ($numbersCollection as $number) {
   echo "$number<br>";
}
echo '<hr>';

echo '<h3>set</h3>';
$numbersCollection[4] = 'rima';
printf('Collection after setting [4]: %s<br>', json_encode($numbersCollection->getCollection()));

for ($i=0; $i < count($numbersCollection); $i++){
   printf('%s<br>', $numbersCollection[$i]);
}
echo '<hr>';

echo '<h3>append</h3>';
$numbersCollection[] = 'ono';
echo  $numbersCollection[5];
printf('Collection after setting []: %s<br>', json_encode($numbersCollection->getCollection()));
echo '<hr>';

echo '<h3>array_map()</h3>';
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


echo '<h3>array_chunk()</h3>';
$chunked = array_chunk($collectionAsArray, 2);
printf('Collection (as array) used in chunked(): %s<br>', json_encode($chunked));
echo '<hr>';

echo '<h3>iterator_apply()</h3>';
iterator_apply($numbersCollection, function($numbersCollection){
    printf('%s ', $numbersCollection->current());
    return true;
}, [$numbersCollection]);
echo '<hr>';

echo '<h3>unset()</h3>';
unset($numbersCollection[2]);
printf('Collection after unset(): %s<br>', json_encode($numbersCollection->getCollection()));
unset($numbers[2]);
printf('Array after unset(): %s<br>', json_encode($numbers));
echo '<hr>';


