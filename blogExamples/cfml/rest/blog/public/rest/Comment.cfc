// Comment.cfc
component rest=true restPath="comment" {

	remote struct function getById(required numeric id restargsource="path") httpmethod="get" restpath="{id}" produces="application/json" {
		var comment = entityLoad("Comment", id, true);
		return {
			id			= comment.id,
			articleId	= comment.articleId,
			date		= comment.date,
			author		= comment.author,
			body		= comment.body
		};
	}

	remote array function getByArticleId(required numeric articleId restargsource="path") httpmethod="get" restpath="articleId/{articleId}" produces="application/json" {
		var comments = entityLoad("Comment", {articleId=articleId});
		sleep(1000);
		return comments.reduce(function(comments,comment){
			comments.append({
				id		= comment.id,
				date	= comment.date,
				author	= comment.author,
				body	= comment.body
			});
			return comments;
		},[]);
	}

	remote array function getAll() httpmethod="get" restpath="" produces="application/json" {
		var comments = entityLoad("Comment");
		return comments.reduce(function(comments,comment){
			comments.append({
				id			= comment.id,
				articleId	= comment.articleId,
				date		= comment.date,
				author		= comment.author,
				body		= comment.body
			});
			return comments;
		},[]);
	}

	remote void function create(
		required string	articleId	restargsource="form",
		required string	date		restargsource="form",
		required string	author		restargsource="form",
		required string	body		restargsource="form"
	) httpmethod="post" {
		var comment = new app.Comment();
		comment.articleId	= articleId;
		comment.date		= date;
		comment.author		= author;
		comment.body		= body;
		entitySave(comment);

		restSetResponse({
			status	= 201,
			content	= "",
			headers= {
				location="#CGI.HTTP_HOST##CGI.SCRIPT_NAME##CGI.PATH_INFO##comment.id#"
			}
		});
	}
/*
*/
}