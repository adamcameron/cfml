<?php
// Serialisation.trait.php
trait Serialisation
{
    public static function toJson($object)
    {
        return json_encode($object);
    }

    public static function toXml($object)
    {
        $xml = new DOMDocument("1.0");

        $xmlObject = $xml->createElement("object");
        foreach ($object as $key=>$value){
            $xmlElement = $xml->createElement($key, $value);
            $xmlObject->appendChild($xmlElement);
        }
        $xml->appendChild($xmlObject);
        return $xml->saveXML();
    }
}
