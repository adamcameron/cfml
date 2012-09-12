/*
All of the code within the ZingChart software is developed and copyrighted by PINT, Inc., and may not be copied,
replicated, or used in any other software or application without prior permission from PINT. All usage must coincide with the
ZingChart End User License Agreement which can be requested by email at support@zingchart.com.

Build 0.120731
*/
ZC.QU.push("errorbars");
ZC.GN.prototype.I8=function(h,g){if(typeof g==ZC._[33])g=0;if(g){if(typeof this.I.pointserror!=ZC._[33]){b=new ZC.E5(this);b.copy(this.A.FR);b.parse();b.P=this.P+"--error-hover";ZC.BW.paint(h,b,this.I.pointserror)}}else{b=this.A.D6;var a=this.A.B3;if(this.A.O4.length!=0){var c=null,e=null,f=1;if(this.A.O4.length<=2){if(this.A.O4[0]!=null&&this.A.O4[0]instanceof Array)f=0;if(this.A.O4[1]!=null&&this.A.O4[1]instanceof Array)f=0}else f=0;if(f){c=this.A.O4[0];e=this.A.O4[1]}else if((QG=this.A.O4[this.J])!=
null)if(QG instanceof Array){c=e=QG[0];if(QG.length==2)e=QG[1]}this.I["node-error-plus"]=c;this.I["node-error-minus"]=e;if((c+"").indexOf("%")!=-1){c=ZC.ND(c);if(c<=1)c*=this.A9}if((e+"").indexOf("%")!=-1){e=ZC.ND(e);if(e<=1)e*=this.A9}f=[];var d=ZC.ND(this.A.FR.o[ZC._[23]]);if(d<=1)d=this.D.AC=="vbar"?ZC._i_(d*this.G):this.D.AC=="hbar"?ZC._i_(d*this.E):ZC._i_(d*a.V);a=0;if(this.D.AC=="vbar")a=this.G;else if(this.D.AC=="hbar")a=this.E;if(c!=null){c=b.B8(this.C8+c);this.D.AC=="hbar"?f.push([c,this.iY+
a/2-d/2],[c,this.iY+a/2+d/2],null,[c,this.iY+a/2],[this.iX,this.iY+a/2]):f.push([this.iX+a/2-d/2,c],[this.iX+a/2+d/2,c],null,[this.iX+a/2,c],[this.iX+a/2,this.iY])}if(e!=null){b=b.B8(this.C8-e);this.D.AC=="hbar"?f.push(null,[b,this.iY+a/2-d/2],[b,this.iY+a/2+d/2],null,[b,this.iY+a/2],[this.iX,this.iY+a/2]):f.push(null,[this.iX+a/2-d/2,b],[this.iX+a/2+d/2,b],null,[this.iX+a/2,b],[this.iX+a/2,this.iY])}var b=new ZC.E5(this);b.copy(this.A.FR);b.parse();b.P=this.P+"--error";ZC.BW.paint(h,b,f);this.I.pointserror=
f}}};
