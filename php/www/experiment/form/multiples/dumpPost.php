<?php
// dumpPost.php

require "../../../debug/dBug.php";


echo '<h3>$_POST</h3>';
new dBug($_POST);

echo '<h3>UDF</h3>';

function unpackPost()
{
    $post = array();
    foreach (explode('&', file_get_contents('php://input')) as $keyValuePair) {
        list($key, $value) = explode('=', $keyValuePair);

        if (!array_key_exists($key, $post)){
            $post[$key] = $value;
            continue;
        }
        if (is_array($post[$key])){
            $post[$key][] = $value;
            continue;
        }
        $temp = $post[$key];

        $post[$key] = array($temp, $value);
    }
    return $post;
}

$post = unpackPost();
new dBug($post);
