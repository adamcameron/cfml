/*
All of the code within the ZingChart software is developed and copyrighted by PINT, Inc., and may not be copied,
replicated, or used in any other software or application without prior permission from PINT. All usage must coincide with the
ZingChart End User License Agreement which can be requested by email at support@zingchart.com.

Build 0.120731
*/
ZC.QU.push("history");
ZC.LM.prototype.paintHistory=function(){var a=this,c;ZC.L.FA([a.P+"-history-path",a.P+"-history-back-path",a.P+"-history-forw-path",a.P+"-history-gradient",a.P+"-history-back-gradient",a.P+"-history-forw-gradient"]);if((c=a.o.history)!=null){a.FE=new ZC.D1(a);a.AR.load(a.FE.o,"loader.gui.history");a.FE.append(c);a.FE.parse();a.FE.V1=1;var i=new ZC.CY(a);a.AR.load(i.o,"loader.gui.history.item");i.append(c.item);i.parse();var h=new ZC.CY(a);a.AR.load(h.o,"loader.gui.history.item-off");h.append(c.item);
h.append(c["item-off"]);h.parse()}c="";if(a.FE){a.FE.P=a.P+"-history";a.FE.X=a.FE.BT=ZC.AN(a.P+"-static-c");a.FE.paint();var d=a.FE.iX+a.FE.ER,e=a.FE.iY+a.FE.GV,f=a.FE.G-a.FE.ER-a.FE.FL,g=a.FE.E-a.FE.GV-a.FE.I0,b=new ZC.CY(a);b.P=a.P+"-history-back";b.copy(i);b.CL=0;a.JH==0&&b.copy(h);b.C=[[d,e+g/2],[d+f/3,e],[d+f/3,e+g],[d,e+g/2]];b.GO=ZC.AN(a.A.P+"-text");b.X=b.BT=ZC.AN(a.P+"-static-c");b.parse();b.paint();if(a.JH>0){c+=ZC.L.DJ("rect")+'class="'+(a.P+"-history-area zc-history-area")+'" id="'+a.P+
"-history-back-area"+ZC._[32];c+=ZC._i_(d+ZC.MAPTX)+","+ZC._i_(e+ZC.MAPTX)+","+ZC._i_(d+f/3+ZC.MAPTX)+","+ZC._i_(e+g+ZC.MAPTX);c+='"/>'}b=new ZC.CY(a);b.P=a.P+"-history-forw";b.copy(i);b.CL=0;if(a.JH==a.KK.length-1||a.KK.length==0)b.copy(h);b.C=[[d+f,e+g/2],[d+2*f/3,e],[d+2*f/3,e+g],[d+f,e+g/2]];b.GO=ZC.AN(a.A.P+"-text");b.X=b.BT=ZC.AN(a.P+"-static-c");b.parse();b.paint();if(a.JH<a.KK.length-1){c+=ZC.L.DJ("rect")+'class="'+(a.P+"-history-area zc-history-area")+'" id="'+a.P+"-history-forw-area"+ZC._[32];
c+=ZC._i_(d+2*f/3+ZC.MAPTX)+","+ZC._i_(e+ZC.MAPTX)+","+ZC._i_(d+f+ZC.MAPTX)+","+ZC._i_(e+g+ZC.MAPTX);c+='"/>'}if(c!="")ZC.AN(a.P+"-map").innerHTML+=c;a.zc_loader_history=function(j){if(j.target.id==a.P+"-history-back-area")zingchart.exec(a.P,"goback");else j.target.id==a.P+"-history-forw-area"&&zingchart.exec(a.P,"goforward")};ZC.A3("."+a.P+"-history-area").bind("click",a.zc_loader_history)}};
