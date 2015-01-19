// Reference.cfc
component rest=true restPath="reference" {

	remote struct function getById(required numeric id restargsource="path") httpmethod="get" restpath="{id}" produces="application/json" {
		var reference = entityLoad("Reference", id, true);
		sleep(5000);
		return {
			id			= reference.id,
			articleId	= reference.articleId,
			title		= reference.title,
			link		= reference.link
		};
	}

	remote array function getByArticleId(required numeric articleId restargsource="path") httpmethod="get" restpath="articleId/{articleId}" produces="application/json" {
		var references = entityLoad("Reference", {articleId=articleId});
		sleep(5000);
		return references.reduce(function(references,reference){
			references.append({
				id		= reference.id,
				title	= reference.title,
				link	= reference.link
			});
			return references;
		},[]);
	}

	remote array function getAll() httpmethod="get" restpath="" produces="application/json" {
		var references = entityLoad("Reference");
		return references.reduce(function(references,reference){
			references.append({
				id			= reference.id,
				articleId	= reference.articleId,
				title		= reference.title,
				link		= reference.link
			});
			return references;
		},[]);
	}

	remote void function create(
		required string	articleId	restargsource="form",
		required string	title		restargsource="form",
		required string	link		restargsource="form"
	) httpmethod="post" {
		var reference = new app.Reference();
		reference.articleId	= articleId;
		reference.title		= title;
		reference.link		= link;
		entitySave(reference);

		restSetResponse({
			status	= 201,
			content	= "",
			headers= {
				location="#CGI.HTTP_HOST##CGI.SCRIPT_NAME##CGI.PATH_INFO##reference.id#"
			}
		});
	}

}