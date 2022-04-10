<script type="text/javascript">
	function onCompleteHandler(result){
		alert("Done");
	}

	function onErrorHandler(results){
		alert("BUNG");
		return true;
	}
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
	<title>&lt;cffileupload&gt; tests</title>
</head>
<body>
<cffileupload progressbar="false" url="./actUpload.cfm" extensionfilter="*.jpg" maxfileselect="1" maxuploadsize="1" onerror="onErrorHandler" stoponerror="true" wmode="opaque" >
<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas auctor tincidunt lobortis. Vestibulum urna nisl, ornare vitae dignissim ac, hendrerit vel metus. In consequat odio urna, quis convallis mauris. Aliquam nec odio arcu, in pharetra nulla. Etiam at nunc at justo vehicula molestie. Morbi tincidunt tristique tristique. Mauris feugiat, orci vel vestibulum dictum, ante ligula posuere erat, vitae egestas tellus libero in elit. Quisque id massa nec lectus sollicitudin euismod. Nunc at metus augue, sed sagittis est. Proin consectetur, arcu vitae pretium faucibus, ligula erat fermentum elit, id sollicitudin libero velit ac urna. Ut feugiat fringilla laoreet. Sed neque leo, consequat vel bibendum sed, pharetra in augue.
</p><p>
Nulla ac turpis orci, sodales auctor dui. Fusce viverra nisi et leo pharetra tempus. Mauris non lacus augue, vitae feugiat eros. Vestibulum nec nunc lorem. Maecenas condimentum libero non sapien tincidunt lacinia. Phasellus accumsan varius urna, in pretium dui sagittis ut. Integer laoreet orci consectetur augue gravida sodales. Suspendisse purus augue, blandit vel faucibus et, tempor ac tortor. Cras dui augue, luctus vel semper quis, ornare accumsan sem. Curabitur ac nunc lacus. Aliquam erat volutpat. Praesent viverra nibh quis dolor auctor ut aliquet arcu semper. Donec non eros et sapien sodales volutpat.
</p><p>
Vivamus neque nisi, scelerisque eget placerat non, porttitor eget nisi. Sed suscipit pellentesque est ut vulputate. Integer eget blandit lectus. Quisque feugiat facilisis tincidunt. Quisque ac velit magna. Donec scelerisque, ipsum commodo vulputate euismod, neque sem blandit nibh, fringilla dictum massa diam at tortor. Sed dolor purus, bibendum eu posuere sed, ornare eu justo. Integer metus lorem, vehicula a elementum sed, vulputate vel magna. Etiam convallis malesuada dui non imperdiet. In id dolor ipsum. Mauris vitae urna sit amet ligula fringilla molestie. Mauris leo nisl, rutrum non iaculis ut, ornare vel metus. Curabitur sollicitudin convallis justo quis consequat. Nullam ut nunc nunc, ut imperdiet dui. Quisque eros lectus, placerat vel convallis quis, malesuada et elit. Morbi nec quam eget felis pretium porttitor.
</p><p>
Vestibulum eros purus, placerat a auctor in, rhoncus quis augue. Morbi faucibus rhoncus nisi, sollicitudin lacinia sem porta id. Aliquam ut magna purus. Aenean vel viverra felis. Aliquam erat volutpat. Duis in odio mauris. Maecenas vestibulum est non risus eleifend faucibus. Ut rutrum enim ac ligula vestibulum eget fermentum justo gravida. Sed non aliquet elit. Sed blandit cursus condimentum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
</p><p>
Proin egestas suscipit sagittis. Vestibulum convallis eros velit. Mauris risus lacus, feugiat at tincidunt ut, consectetur id dolor. Donec sit amet eros ut dui sollicitudin tempor. Morbi porttitor nunc ac massa adipiscing eu lobortis mi fermentum. Donec pharetra tortor id enim imperdiet tristique auctor lectus facilisis. In ultricies congue accumsan. Integer tellus augue, ullamcorper at ornare ac, posuere ac lacus. Fusce id ligula lorem. Fusce eget est et tortor dictum dictum eget a odio. Ut adipiscing ullamcorper turpis in sollicitudin. Nullam purus mauris, vestibulum nec semper a, porta sed lorem. Donec egestas adipiscing tortor quis cursus. Donec nibh odio, tincidunt a pharetra vitae, cursus vel tortor. Vivamus imperdiet, massa eu vehicula dignissim, sapien enim facilisis justo, ut congue est tortor id ligula. Sed vel malesuada mi. Vestibulum auctor, ligula ut ornare consequat, nisi dui bibendum odio, quis ullamcorper orci erat quis orci. 
</p>


</body>
</html>
