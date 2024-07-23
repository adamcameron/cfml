// blogBottom.js

// code annotations
$(document).ready(function(){
	$(".xr").each(function(){
		var el = $(this);
		var index = el.attr("data-index");
		el.on("mouseover", function(){
			$(".xr").removeClass("xrSelected");
			$(".xr[data-index=" + index + "]").addClass("xrSelected");
		});
	});

	$(document).tooltip({
		items	: ".xr.xrt",
		track	: true,
		content	: function(){
			var el = $(this);
			var index = el.attr("data-index");
			var xrd = $(".xr.xrd[data-index=" + index + "]");
			var text = xrd.text();
			return text;
		},
		position	: {
			my: "right top+50",
			at: "center top",
			using	: function(position,feedback){
				$( this ).css( position );
				$("<span>")
					.addClass(feedback.vertical)
					.addClass(feedback.horizontal)
					.addClass(".xrTooltip")
					.appendTo(this);
			}
		}
	});
});
