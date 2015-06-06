1. Copy folder "realestate" to your web root
2. Choose your database type: MS SQL, MySql, Access (with Unicode)
3. If database type is MS SQL or MySql, run SQL script corresponding to your db type that you will find in "database" folder 
4. Open ColdFusion Administrator
5. Create a data source called "realestate" of the chosen type. If type is Access (with Unicode), browse for mdb file called realEstate.mdb in "database" folder
6. Browse http://localhost/realestate or http://localhost:8500/realestate if running the built-in web server

Note: 
-Part 1 of tutorial has the same file and folder names, so they will get overwritten with these. 
If you changed anything there that you'd wish to keep, please make a copy of them, rename the folder or rename this new folder. If you rename the folder, will have to change the component path in Application.cfc.
-If you wish to change data source name or component path, open Application.cfc and change settings there.
-This application will only run on ColdFusion MX 7.01 (ColdFusion MX 7 Updater 1)
-Only tested on MySql 4.1