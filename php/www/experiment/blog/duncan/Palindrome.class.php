<?php
// Palindrome.class.php

class Palindrome
{
    public static function createPalindromeSequence($max=-1)
    {
        $n = 0;
        $reserveStack = [];
        while (true){
            $shortPalindrome = $n . substr(strrev($n),1);

            while (count($reserveStack) && $shortPalindrome > $reserveStack[0]){
                yield array_shift($reserveStack);
            }
            if ($max != -1 && $shortPalindrome > $max) return;
            yield $shortPalindrome;
            $n++;
            $reserveStack[] = $n . strrev($n);
        }
    }

    public static function isPalindrome($x)
    {
        return $x == strrev($x);
    }
}
