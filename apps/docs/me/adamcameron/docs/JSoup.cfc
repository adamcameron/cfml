component {

	public JSoup function init(){

		var javaLoader = createObject("javaloader.JavaLoader").init([expandPath("/jsoup/jsoup-1.7.2.jar")]);
		variables.jsoup = javaLoader.create("org.jsoup.Jsoup");

		return this;
	}

	public any function getJSoup(){
		return variables.jsoup;
	}

}