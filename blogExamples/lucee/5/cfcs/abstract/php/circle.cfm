<cfscript>
// circle.cfm

circle = new Circle(7)

echo("Dimensions: #circle.getDimensions()#<br>")
echo("Perimeter (circumference): #circle.getPerimeter()# (#circle.getCircumference()#)<br>")
echo("Area: #circle.getArea()#<br>")
</cfscript>