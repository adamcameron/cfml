<?php
$transliterator = Transliterator::createFromRules(':: NFD; :: [:Nonspacing Mark:] Remove; :: NFC;');
$input = 'àòùìéëü';

$output = $transliterator->transliterate($input);

echo $input;
echo '<br>';
echo $output;