<?php
$socialMediaIconData = array(
    'facebook'  => array (
        'url'       => 'FACEBOOKURL',
        'alt_text'  => 'FACEBOOKALTTEXT',
        'image'     => ''
    ),
    'twitter'  => array (
        'url'       => 'TWITTERURL',
        'alt_text'  => 'TWITTERALTTEXT',
        'image'     => ''
    ),
    'pinterest'  => array (
        'url'       => 'PINTERESTURL',
        'alt_text'  => 'PINTERESTALTTEXT',
        'image'     => ''
    ),
    'youtube'  => array (
        'url'       => 'YOUTUBEURL',
        'alt_text'  => 'YOUTUBEALTTEXT',
        'image'     => ''
    ),
    'google_plus'  => array (
        'url'       => 'GOOGLEPLUSURL',
        'alt_text'  => 'GOOGLEPLUSALTTEXT',
        'image'     => ''
    ),
    'stumble_upon'  => array (
        'url'       => 'STUMBLEUPONURL',
        'alt_text'  => 'STUMBLEUPONALTTEXT',
        'image'     => ''
    ),
);
$icons = ["facebook", "pinterest", "google_plus"];


$selected = array_intersect_key($socialMediaIconData, array_flip($icons));

echo "<pre>";
var_dump($selected);
echo "</pre><hr>";

echo "<pre>";
var_dump($socialMediaIconData);
echo "</pre><hr>";

