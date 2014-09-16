// Test.cfc
component {
    property numeric score;

    public function getPropertyMetadata(){
        return getMetadata().properties;
    }

}