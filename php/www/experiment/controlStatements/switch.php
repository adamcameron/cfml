<?php
if (isset($_GET["colour"])){
    switch ($_GET["colour"]){
        case "whero":
        case "kura": {
            echo "red";
            break;
        }
        case "Kakariki": {
            echo "green";
            break;
        }
        case "kikorangi":
            echo "blue";
        break;

        default: {
            echo "My Maori ain't that good";
        }
    }
} else{
    echo "Give me a colour";
}
