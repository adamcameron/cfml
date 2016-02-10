# HostelBookers Static Files

The intention of this library is to act as a store of static files to be used in conjunction with the [hostelbookers application](https://stash.corp.hostelworld.com/projects/VAN/repos/hostelbookers/).

## Getting set up

There is currently no actual code in this repository, virtually all the files contained in it are images, so all you have to do to make changes is use git to clone this repository to an appropriate location on your machine and work away as normal.

You can use the git client of your choice, but using git bash, cd into an appropriate directory on your machine, click on the "Clone" button in stash. Copy the highlighted text, and from your "code" directory on your local machine do this:

`git clone <copied highlighted text>` (will be something like ssh://git@stash.corp.hostelworld.com:7999/van/hb-static-files.git)

After this command has been run, the cloned hb-static-files repo should be now be present on your local machine. 

## Hero Images

Hero images are the large banner images that appear at the top of each page in the app. On property pages the hero images are supplied by the properties themselves but there are two other types of hero image, location based and page based, for use on non-property pages.

The location based hero images appear on static location pages (e.g. www.hostelbookers.com/hostels/england/london) while the page based hero images appear on all other pages - e.g. http://www.hostelbookers.com/content/about/, http://www.hostelbookers.com/content/workwithus/ etc.

Within this repository we can store any number of hero images per page and the application will randomly pick one of them to display on each request.

**N.B.** There are no language specific hero images.

### Location based hero images

The main idea of the location based hero images is for us to be able to present a geographically relevant hero image when a user requests a location based page. So, e.g. if a user requests www.hostelbookers.com/hostels/england/london we can show them a hero image of Big Ben, The London Eye etc.

You can store location based images in folders as shown below. Essentially the folder structure should mimic the url structure of the static location pages in English.

<dl>
<dt>Worldwide:</dt>
<dd>`/hero/location/worldwide/`</dd>

<dt>Continents:</dt>
<dd>`/hero/location/continent/`*continent-name*`/`</dd>

<dt>Countries:</dt>
<dd>`/hero/location/country/`*country-name*`/`</dd>

<dt>Areas (aka States in some situations):</dt>
<dd>`/hero/location/area/`*country-name*`/`*area-name*`/`</dd>

<dt>Cities:</dt>
<dd>`/hero/location/city/`*country-name*`/`*city-name*`/`</dd>

<dt>Districts:</dt>
<dd>`/hero/location/district/`*country-name*`/`*city-name*`/`*district-name*`/`</dd>
</dl>

An important point to note with regards location based hero images is that there is a fallback mechanism in place, so that if e.g. a location based hero image does not exist in this repository then the application will fall back to requesting the hero image of the parent location until an image is found.

The fallback sequence is as follows:

1. district
2.
  1. city (\*)
  2. area (\*\*)
3. country
4. continent
5. worldwide

So e.g. a request for the hero image for Camden, London would check in turn for hero images for Camden (district), London(city), England(country), Europe (continent) and finally worldwide until a hero image is found.

(\*) note that `city` heroes fall back to the parent `country` hero, not an `area` one. For example if there is no Galway City hero image, the Ireland one would be shown, not the Co. Galway one.

(\*\*) if there is no `area` hero, then it will fallback as per the city ones: `country`, thence to `continent`, `worldwide`.

### Page based hero images

Stored in `/hero/`*route-bind*. For example the 'About Us' page has a bind parameter in the /src/wri/hostelbookers/routes/contentPages/AboutUsRoute.php of `aboutUs`. Hero images for the 'About Us' page should therefore be stored in `/hero/aboutUs/`. If the directory doesn't exist then it should be created.

### Default global hero image
Ultimately if all attempts to retrieve a hero image fail, then the application will fall back to requesting the file stored at `hero/home/hero-homepage.jpg`. To that end we should always make sure there is an image stored using that file path.
