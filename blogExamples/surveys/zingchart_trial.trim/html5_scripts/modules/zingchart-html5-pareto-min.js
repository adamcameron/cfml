/*
All of the code within the ZingChart software is developed and copyrighted by PINT, Inc., and may not be copied,
replicated, or used in any other software or application without prior permission from PINT. All usage must coincide with the
ZingChart End User License Agreement which can be requested by email at support@zingchart.com.

Build 0.120731
*/
zingchart.setModule("pareto");
(function(){var k=zingchart.dataparse;zingchart.dataparse=function(o,d){if(k!=null)d=k(o,d);for(var e=0,p=d[ZC._[18]].length;e<p;e++)if(d[ZC._[18]][e].type&&d[ZC._[18]][e].type.replace("3d","")=="pareto"){var f=d[ZC._[18]][e].type,a=d[ZC._[18]][e],c={};if(a.options)c=a.options[f]||a.options;ZC._todash_(c);a[ZC._[52]]=a[ZC._[52]]||{};a[ZC._[52]][ZC._[5]]=a[ZC._[52]][ZC._[5]]||[];a[ZC._[13]]=a[ZC._[13]]||[];a[ZC._[13]][0]=a[ZC._[13]][0]||{};a[ZC._[13]][0][ZC._[5]]=a[ZC._[13]][0][ZC._[5]]||[];a.type=
"mixed";var b=a[ZC._[13]];a[ZC._[52]][ZC._[5]].sort(function(g,h){var l=ZC.AH(a[ZC._[52]][ZC._[5]],g),m=ZC.AH(a[ZC._[52]][ZC._[5]],h);return b[0][ZC._[5]][l]!=null&&b[0][ZC._[5]][m]!=null?b[0][ZC._[5]][l]>b[0][ZC._[5]][m]?-1:1:0});b[0][ZC._[5]].sort(function(g,h){return g>h?-1:1});a["scale-y-2"]={"min-value":0,"max-value":100,step:20,format:"%v%",decimals:0};c["scale-y-2"]&&ZC._cp_(c["scale-y-2"],a["scale-y-2"]);b[0].type=f.indexOf("3d")!=-1?"bar3d":"bar";b.length<2&&b.push({});ZC._cp_({type:f.indexOf("3d")!=
-1?"line3d":"line",scales:"scale-x,scale-y-2","value-box":{text:"%v%"},tooltip:{text:"%v%"}},b[1]);c["line-plot"]&&ZC._cp_(c["line-plot"],b[1]);c=f=0;for(var i=b[0][ZC._[5]].length;c<i;c++)f+=b[0][ZC._[5]][c];b[1][ZC._[5]]=[];c=0;for(i=b[0][ZC._[5]].length;c<i;c++){for(var n=0,j=0;j<=c;j++)n+=b[0][ZC._[5]][j];b[1][ZC._[5]].push(parseFloat((100*n/f).toFixed(2)))}}return d}})();
