# CFSummit2016-MVC
Presentation and demonstration app for my _Bringing Order to the Chaos: Take the MVC Plunge_ ColdFusion Summit 2016 session.

##DISCLAIMER:
This code is simplified to clearly demonstrate an application written as both procedural code and MVC code.  It does not necessarily represent best practices, does not include security measures, and does not include user input validation/sanitation.

##Installation
The database needs to be set up first. The presentation was designed for use with SQL Server (any edition will work including Express). Create an empty database named BeerTracker. Open the included `SQLServerDBSetup.sql` file in SQL Server Management Studio and run it to build all of the required tables.

The fastest way to get the app running is to use CommandBox. CommandBox can be downloaded from here: [][].  Once it is installed, launch `Box.exe`.

Navigate to the folder where you downloaded this project. Change into the FW/1 and ColdBox demo folders, and run `install` in each of them to install the depedencies for each app.

```bash
cd MVCAp
install
cd ../MVCApp-ColdBox
install
```

Then back up to the parent folder again and type `server start`.  The first time this is run, CommandBox will download the ColdFusion 2016 .war file and place it in it's local repository, unpack it, start up ColdFusion server, and launch your default web browser to the app home page.  From that point on, `server start` will just start the server.  The included _server.json_ file provides the required settings for CommandBox to run ColdFusion.

```bash
cd ../
start
```

##Notes
There is an issue with generating SES-friendly URLs in this app because the MVC version of the app is in a subfolder off of the webroot.  FW/1 writes SES-friendly URL paths as if the application runs directly from the web root, so the generated URLs are incorrect.  To work around that, the FW/1 config setting `baseURL : "useRequestURI"` has been used; however, this prevents the FW/1 `buildURL()` function from writing the URLs entirely in SES-friendly format.

[]: https://www.ortussolutions.com/products/commandbox
