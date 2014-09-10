<?php
class Address
{
    use Serialisation, Logging {
        toXml       as private _toXml;
        toJson      as private;
        logToFile   as private;
        logToScreen as private;
    }

    protected $streetAddress;
    protected $postalCode;
    protected $country;

    public function __construct($streetAddress, $postalCode, $country)
    {
        $this->streetAddress= $streetAddress;
        $this->postalCode    = $postalCode;
        $this->country        = $country;

        $this->logToFile($this->toJson($this->toArray()));
    }

    private function toArray()
    {
        return [
            "streetAddress" => $this->streetAddress,
            "postalCode" => $this->postalCode,
            "country" => $this->country
        ];
    }

    public function toXml()
    {
        return $this->_toXml($this->toArray());
    }
}
