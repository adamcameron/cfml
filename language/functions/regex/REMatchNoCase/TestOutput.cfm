<cfsavecontent variable="s">
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in neque eget libero tempor interdum in vel eros. Duis vitae lacus et ipsum luctus laoreet. Aenean accumsan blandit enim id consectetur. Aliquam dui metus, lacinia id tempor id, condimentum ac velit. Nam et quam eget erat consequat dictum id congue ligula. Integer eu tortor tristique est hendrerit consequat non eget ante. Maecenas vestibulum lacinia sapien in pretium. Suspendisse potenti. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean sed odio leo. Proin adipiscing ipsum eu urna venenatis vitae aliquam arcu condimentum. In quis dolor nec massa consequat porta et venenatis mauris.
Aliquam eleifend ullamcorper lorem, sit amet fringilla nunc ornare in. Donec sit amet felis nisl, commodo tempus nulla. Proin interdum pharetra ligula, sed aliquet ligula molestie sed. Donec ac purus vitae ipsum aliquet laoreet in eget mi. Cras quis leo leo, id pharetra lectus. Pellentesque scelerisque nisi in diam varius malesuada. Donec purus nunc, euismod vitae placerat ut, euismod ut metus. Pellentesque ultricies turpis vel ligula consectetur adipiscing. Vivamus a nunc ac mi blandit fringilla non nec neque. Vestibulum porttitor, nisi eu accumsan consectetur, neque sapien tristique risus, non vehicula orci urna eu est. Suspendisse a nunc vel ipsum euismod aliquet. Proin vitae aliquet sapien. Curabitur vestibulum consequat nisl et tincidunt. Phasellus feugiat elit et sem tempor non pellentesque augue fermentum. Morbi at tellus non diam tincidunt placerat. Quisque felis nibh, sollicitudin eget tristique at, sagittis nec augue.
Sed massa orci, sollicitudin at malesuada ut, hendrerit ut mauris. Sed faucibus, felis ut iaculis accumsan, sem orci imperdiet est, in varius lorem enim sit amet enim. Aenean nisi tortor, tristique a iaculis in, varius et erat. Proin aliquet fermentum arcu et accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Cras iaculis, dui quis facilisis molestie, urna turpis molestie magna, ac vestibulum nibh nunc eu ipsum. Nam imperdiet diam sit amet mauris sollicitudin at rhoncus augue tempus. Donec at dolor nulla, nec facilisis velit. Nam nisi mi, lacinia ut commodo nec, ultricies vitae justo. Fusce tincidunt est vitae eros gravida scelerisque vitae nec tellus. Nam laoreet mattis sodales. Nullam consequat dui at felis faucibus ornare. Maecenas sit amet elit mollis ipsum consectetur pharetra a nec neque.
Ut tincidunt dolor a risus convallis dignissim ac a risus. Nullam luctus aliquam pellentesque. Aenean nec ipsum et erat suscipit porttitor. Vestibulum nisi nunc, ornare vel vestibulum non, tincidunt quis purus. Nam ullamcorper nunc ut nisl mattis convallis. Aliquam cursus eleifend pulvinar. Aliquam sed ligula nec nisi accumsan tincidunt. Proin ac mi ac mauris convallis vestibulum. Suspendisse adipiscing, tortor eu volutpat consectetur, ante turpis iaculis ante, nec accumsan massa enim in lorem. Pellentesque vitae nibh eu arcu auctor tempor. Morbi ultrices malesuada orci, tempor vestibulum leo pharetra at. Praesent sed sapien lectus.
Donec risus quam, tincidunt non rutrum eget, malesuada gravida metus. Nunc dignissim nisi euismod magna adipiscing egestas posuere lectus lacinia. Nam consequat congue sem, eu dictum leo sagittis et. Phasellus est velit, aliquam ut interdum non, pellentesque a nulla. Aliquam dolor orci, tempus non congue quis, rhoncus vitae felis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris in mi vel nisi viverra lacinia ac quis dui. Nam erat est, ullamcorper sit amet hendrerit in, vestibulum vitae orci. Praesent imperdiet magna a nisl suscipit nec mollis diam dictum. Proin rhoncus blandit turpis sit amet varius. 
</cfsavecontent>
<cfset sRegex = "(in|ipsum)">

<cfset a = reMatchNoCase(sRegex, s)>
<cfdump var="#a#">
