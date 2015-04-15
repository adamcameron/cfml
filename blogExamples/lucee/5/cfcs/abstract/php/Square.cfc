// Square.cfc
component extends=TwoDimensionalShape {

    private this.sideLength;

    function init(sideLength){
        this.sideLength = arguments.sideLength
    }

    function getPerimeter(){
        return sideLength * 4
    }

}