<?php
$arr = ['0-3 months', '9-12 months', '3-6 months', '6-9 months', '12-18 months', '18-24 months'];
print_r($arr);
echo "\n\n\n";
usort($arr, function ($e1,$e2) {{
        preg_match('/^(\d+)-(\d+)/', $e1, $e1Keys);
        preg_match('/^(\d+)-(\d+)/', $e2, $e2Keys);

        if ($e1Keys[0] != $e2Keys[0]){
            return gmp_sign($e1Keys[1]-$e2Keys[1]);
        }
        return gmp_sign($e1Keys[0]-$e2Keys[0]);
    }});
print_r($arr);
