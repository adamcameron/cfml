/**
 * Library of methods to extract details from an Adobe bug report
 * @param {String} doc: an HTML doc containing bug details from the Adobe bugtracker
 */
function DetailExtractor(){
	_detailExtractor = this;
	this.notFoundMsg = "NOT FOUND";
	this.$doc;
}


/**
  
 * @param {string} doc: an HTML doc containing bug details from the Adobe bugtracker
 */
DetailExtractor.prototype.setDoc = function(doc){
	_detailExtractor.$doc = $(doc);
}


/**
  Extracts the headline from the doc, eg "ColdFusion 10.0  -  Bug 3318104"
 */
DetailExtractor.prototype.getHeadline = function(){
	var bugHeadline =  _detailExtractor.$doc.find("h1.title").text().trim();

	if (!bugHeadline.length){
		bugHeadline = _detailExtractor.notFoundMsg;
	}
	
	bugHeadline = bugHeadline.replace(/\s+/g, " ");
	
	return bugHeadline;
}


/**
  Extracts the date from the doc, eg "Created on Sunday, August 26, 2012"
 */
DetailExtractor.prototype.getDate = function(){
	var bugDate =  _detailExtractor.$doc.find("h1.title").next("div.actions").text().trim();

	if (!bugDate.length){
		bugDate = _detailExtractor.notFoundMsg;
	}
	return bugDate;
}


/**
  Extracts the tile from the doc, ie: the title of the bug entered when raising it
 */
DetailExtractor.prototype.getTitle = function(){
	var bugTitle =  _detailExtractor.$doc.find("div.content h2").filter(
		function(index){
			return $(this).text().trim() === "Title";
		}
	).next("p").text().trim();

	if (!bugTitle.length){
		bugTitle = _detailExtractor.notFoundMsg;
	}
	return bugTitle;
}


/**
  Extracts the description from the doc, ie: the description of the bug entered when raising it
 */
DetailExtractor.prototype.getDescription = function(){
	var bugDescription = _detailExtractor.$doc.find("div.content h2").filter(
		function(index){
			return $(this).text().trim() === "Description";
		}
	).next("p").html().trim();

	if (!bugDescription.length){
		bugDescription = _detailExtractor.notFoundMsg;
	}
	return bugDescription;
}


/**
  Extracts the reporter from the doc, ie: the person who raised the bug
 */
DetailExtractor.prototype.getReportedBy = function(){
	var reportedBy = _detailExtractor._justText(_detailExtractor.$doc.find("b").filter(
		function(index){
			return $(this).text().trim() === "Reported By";
		}
	).parent());

	if (!reportedBy.length){
		reportedBy = _detailExtractor.notFoundMsg;
	}
	return reportedBy;
}


/**
  Extracts the status from the doc, eg: "Open / ToTrack / PRNeedInfo"
 */
DetailExtractor.prototype.getStatus = function(){
	var state = _detailExtractor._justText(
		_detailExtractor.$doc.find("b").filter(
			function(index){
				return $(this).text().trim() === "State";
			}
		).parent()
	);
	if (!state.length){
		state = "-";
	}
	
	var status =_detailExtractor._justText(
		_detailExtractor.$doc.find("b").filter(
			function(index){
				return $(this).text().trim() === "Status";
			}
		).parent()
	);
	if (!status.length){
		status = "-";
	}
	
	var reason =_detailExtractor._justText(
		_detailExtractor.$doc.find("b").filter(
			function(index){
				return $(this).text().trim() === "Reason";
			}
		).parent()
	);
	if (!reason.length){
		reason = "-";
	}
	
	return state + " / " + status + " / " + reason;
}


/**
  Extracts the "found in build" value from the doc, eg: "Final"
 */
DetailExtractor.prototype.getFoundInBuild = function(){
	var foundInBuild = _detailExtractor.$doc.find("b").filter(
		function(index){
			return $(this).text().trim() === "Found In Build";
		}
	).parent().next().text().trim();
	if (!foundInBuild.length){
		foundInBuild = _detailExtractor.notFoundMsg;
	}
	
	return foundInBuild;
}


/**
  Extracts the "fixed in build" value from the doc, eg: "282573"
 */
DetailExtractor.prototype.getFixedInBuild = function(){
	var fixedInBuild = _detailExtractor.$doc.find("b").filter(
		function(index){
			return $(this).text().trim() === "Fixed In Build";
		}
	).parent().next().text().trim();
	if (!fixedInBuild.length){
		fixedInBuild = "-";
	}
	
	return fixedInBuild;
}


/**
  Extracts the votes from the doc as an array of objects, each object having name, date, comment
 */
DetailExtractor.prototype.getVotes = function(){
	var votes	= [];

	var $votes = $("#votes li div.row", _detailExtractor.$doc);

	var names = [];
	$("div p.gravatar", $votes).each(
		function(index,element){
			names.push($(element).text().trim());
		}
	);

	var comments = [];
	$("div:nth-child(2) p", $votes).each(
		function(index,element){
			comments.push($(element).text().trim());
		}
	);

	var dates = [];
	$("div p.gravatar", $votes).next().each(
		function(index,element){
			dates.push($(element).text().trim());
		}
	);
	
	for (var i=0; i < names.length; i++){
		votes.push({
			name	: names[i],
			date	: dates[i],
			comment	: comments[i]	
		});
	}

	return votes;
}


/**
  Extracts the comments from the doc as an array of objects, each object having name, date, comment
 */
DetailExtractor.prototype.getComments = function(){
	var comments = [];

	var $comments = $("#comment li div.row", _detailExtractor.$doc);

	var names = [];
	$("div p.gravatar", $comments).each(
		function(index,element){
			names.push($(element).text().trim());
		}
	);

	var message = [];
	$("div:nth-child(2) p", $comments).each(
		function(index,element){
			message.push($(element).text().trim());
		}
	);

	var dates = [];
	$("div p.gravatar", $comments).next().each(
		function(index,element){
			dates.push($(element).text().trim());
		}
	);
	
	for (var i=0; i < names.length; i++){
		comments.push({
			name	: names[i],
			date	: dates[i],
			comment	: message[i]	
		});
	}

	return comments;
}


/**
  Returns just the text node data from (ie: ignoring any child tag nodes)
 * @param {Object} $obj. A JQuery object to get just the text node data from
 */
DetailExtractor.prototype._justText = function ($obj){
	return $obj.clone().children().remove().end().text().trim();
}

