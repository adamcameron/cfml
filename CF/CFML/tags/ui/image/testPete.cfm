<cfimage	action="resize"
			height="100"
			source="#replace('http://www.advantagemembers.com/fms/image_library/images large/poollarge.jpg', ' ', '%20', 'all')#"
			width="100"
			name="sTempImage"
			overwrite="yes"
>
<cfdump var="#sTempImage#">