/*
This time I have used the new syntax for creating components.  Isn't it cool?
*/
component persistent="true"
{
/*
I have used "increment" generator here as only this generator works for Derby.  We are figuring out why "native" or "identity" doesn't work
*/
	property name="artid" generator="increment";

/*
All other properties are mapped here
*/
	property name="artname";
	property name="price";
	property name="largeimage";
	property name="mediaid";
	property name="issold";  

}
