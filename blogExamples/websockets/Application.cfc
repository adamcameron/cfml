<<<<<<< HEAD
// Application.cfc
component {
	this.name		= "chatApp01";
	this.wsChannels	= [
		{name="chatChannel", cfclistener="ChatChannelListener"}
	];
=======
component {

	this.name		= "chatApp01";
	this.wsChannels = [
		{name="chatChannel", cfcListener="ChatChannelListener"}
	]; 

>>>>>>> df0c64506eb5f9981d72192e5f84fda45f1aeb68
}