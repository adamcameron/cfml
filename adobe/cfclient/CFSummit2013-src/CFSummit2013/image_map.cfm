<!---
	Custom tag for creating dynamic image map
	Attributes : 
		image_areas - array of objects. Object should have left, top, right, bottom, url and callback fields
		image_id - id of the image lement
		image_width - original image width
		image_height - original image height
--->
<cfclient>
	<cfscript>
		if (thisTag.executionMode == "start")
		{
			variables.img = eval($("##"+attributes.image_id));
			
			if (variables.img.length > 0)
			{
				if (variables.img[0].complete == false)
				{
					variables.img[0].onload = onImageLoaded;
				} 
				else
				{
					variables.img.show();
					variables.img.on("resize",onImageLoaded);
					onImageLoaded();
				}
			}
			
		}
		
		function onImageLoaded()
		{
			$(variables.img).unbind("click").unbind("mousemove").unbind("mouseout");
			variables.img.click(onImageClick);
			variables.img.mousemove(onImageMouseMove);
			variables.img.mouseout(onImageMouseOut);
			resizeImage();
			
			window.removeEventListener("resize",resizeImage);
			window.addEventListener("resize",resizeImage);
		}
		
		function resizeImage ()
		{
			var windowWidth = window.innerWidth;
			var windowHeight = window.innerHeight;
			
			variables.img.width(windowWidth);
			var newWidth = variables.img.width();
			var newHeight = variables.img.height();
			
			variables.xRatio = attributes.image_width / newWidth;
			variables.yRatio = attributes.image_height / newHeight;
		}	
		
		function onImageMouseMove(e)
		{
			var area = getClickArea(e.offsetX, e.offsetY);
			if (area.url != "")
			{
				variables.img.css("cursor","pointer");
			} else
			{
				variables.img.css("cursor","default");
			}
		}	
		
		function onImageMouseOut()
		{
			variables.img.css("cursor","default");
		}	
		
		function onImageClick(e)
		{
			var area = getClickArea(e.offsetX, e.offsetY);
			if (area.url != "")
			{
				if (area.callback == "")
				{
					document.location.href = area.url;
				}
				else
				{
					eval(area.callback).call(window,area.url);
				}
			}
		}
		
		function getClickArea (x, y)
		{
			var realX = x * variables.xRatio;
			var realY = y * variables.yRatio;
			
			var i = 1;
			var url = "";
			var callback = "";
			
			for (;i <= attributes.image_areas.length; i++)
			{
				var area = attributes.image_areas[i];
				if (realX >= area.left && realX <= area.right &&
					realY >= area.top && realY <= area.bottom)
				{
					//found the area
					url = area.url;
					if (isDefined("area.callback"))
						callback = area.callback;
					break;
				}
			}
			return {'url':url, 'callback':callback};			
		}
		
	</cfscript>
</cfclient>