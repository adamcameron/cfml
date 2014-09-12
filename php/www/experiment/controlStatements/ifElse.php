<?php
if (isset($_GET["location"])){
    if ($_GET["location"] == "here" ){
        echo "We're here";
    }elseif ($_GET["location"] == "there" ){
        echo "We're there";
    }else{
        echo "We're neither here nor there";
    }
} else{
    echo "Dunno what yer on about";
}
