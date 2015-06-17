// Article.cfc
component rest=true restPath="article" {

	remote struct function getById(required numeric id restargsource="path") httpmethod="get" restpath="{id}" produces="application/json" {
		var article = entityLoad("Article", id, true);
		sleep(5000);
		return {
			id		= article.id,
			date	= article.date,
			title	= article.title,
			body	= article.body
		};
	}

	remote array function getAll() httpmethod="get" restpath="" produces="application/json" {
		var articles = entityLoad("Article");
		return articles.reduce(function(articles,article){
			articles.append({
				id		= article.id,
				date	= article.date,
				title	= article.title,
				body	= article.body
			});
			return articles;
		},[]);
	}

	remote void function create(
		required string date	restargsource="form",
		required string title	restargsource="form",
		required string body	restargsource="form"
	) httpmethod="post" {
		var article = new app.Article();
		article.date	= date;
		article.title	= title;
		article.body	= body;
		entitySave(article);

		restSetResponse({
			status	= 201,
			content	= "",
			headers= {
				location="#CGI.HTTP_HOST##CGI.SCRIPT_NAME##CGI.PATH_INFO##article.id#"
			}
		});
	}

}