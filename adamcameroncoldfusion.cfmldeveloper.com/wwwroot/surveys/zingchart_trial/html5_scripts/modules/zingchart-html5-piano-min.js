/*
All of the code within the ZingChart software is developed and copyrighted by PINT, Inc., and may not be copied,
replicated, or used in any other software or application without prior permission from PINT. All usage must coincide with the
ZingChart End User License Agreement which can be requested by email at support@zingchart.com.

Build 0.120731
*/
ZC.QU.push("piano");ZC.ZF=ZC.KU.B6({$i:function(a){this.b(a);this.AC="piano";this.B0=new ZC.XH(this);this.AQ[ZC._[57]]=0},A0M:function(a){if(a=="v"){a=[];for(var b=0;b<this.o[ZC._[13]].length;b++)a.push("Metric "+(b+1));return a}},II:function(a){switch(a){case "x":a=new ZC.SC(this);a.CV=1;return a;case "y":a=new ZC.SB(this);a.CV=1;return a}}});ZC.XH=ZC.J7.B6({A26:function(){return new ZC.PO(this)}});
ZC.PO=ZC.OH.B6({$i:function(a){this.b(a);this.AC="piano";this.CJ="alpha";this.WK="plot-max"},OD:function(){return new ZC.WN(this)},parse:function(){this.AZ=this.JB();this.BM=this.AZ[0];this.AT=this.AZ[1];this.BQ=this.AZ[1];this.Y=this.AZ[2];this.A8=this.AZ[1];this.loadXPalette();this.b();this.Q4_a([["reference","WK",""]]);this.B3=this.D.B2(this.BB("k")[0]);this.D6=this.D.B2(this.BB("v")[0])},paint:function(){this.b();this.H2=this.BE("bl",0);this.V2=this.TW=-ZC.MAX;this.Q5=this.P5=ZC.MAX;for(var a=
this.VP=this.V8=0,b=this.A.AA.length;a<b;a++)for(var c=this.A.AA[a],d=0,f=c.Q.length;d<f;d++)if(c.Q[d]!=null){var e=ZC._f_(c.Q[d].A9);if(c.J==this.J){this.V2=ZC.BR(this.V2,e);this.Q5=ZC.CT(this.Q5,e);this.VP+=e}this.TW=ZC.BR(this.TW,e);this.P5=ZC.CT(this.P5,e);this.V8+=e}this.JP(true)}});
ZC.WN=ZC.GN.B6({setup:function(){var a=this.A.B3,b=this.A.D6,c=[a.W,a.A0,b.W,b.A0];if(this.FB!=c){this.iX=a.AF?a.iX+a.G-a.A2-(this.J+1)*a.V:a.iX+a.A2+this.J*a.V;this.iY=b.AF?b.iY+b.A2+this.A.J*b.V:b.iY+b.E-b.A2-(this.A.J+1)*b.V;this.FB=c}if(!this.FO){this.copy(this.A);this.DK=this.A.DK;this.C4()&&this.parse(false);this.FO=1}},A1N:function(a){var b="over";this.D.B2(this.A.BB("v")[0]);if(a.o[ZC._[9]]!=null)b=a.o[ZC._[9]];var c=this.iX+this.G/2-a.D8/2,d=this.iY+this.E/2-a.CG/2;switch(b){case "top":d-=
this.E/2+a.CG/2+2;break;case "left":c-=this.G/2+a.D8/2+2;break;case "bottom":d+=this.E/2+a.CG/2+2;break;case "right":c+=this.G/2+a.D8/2+2}return[c,d]},PA:function(){return{color:"#000"}},getFormatValue:function(){return this.D0},KJ:function(a,b){var c=this.A.D6,d=c.AF?c.Z.length-this.A.J-1:this.A.J;this.DN=[["%y",c.BK[d]!=null?c.BK[d]:c.Z[d]]];return a=this.b(a,b)},paint:function(){this.b();var a=this.A.B3,b=this.A.D6;this.setup();var c;switch(this.A.WK){case "plot-max":c=(ZC._f_(this.A9)-this.A.Q5)/
(this.A.V2-this.A.Q5);break;case "plot-total":c=(ZC._f_(this.A9)-this.A.Q5)/(this.A.VP-this.A.Q5);break;case "chart-max":c=(ZC._f_(this.A9)-this.A.P5)/(this.A.TW-this.A.P5);break;case "chart-total":c=(ZC._f_(this.A9)-this.A.P5)/(this.A.V8-this.A.P5)}this.G=a.V;this.E=b.V;switch(this.A.CJ){case "alpha":case "brightness":this.AB=0.25+c*0.75;break;case "horizontal":this.G=a.V/4+3*c*a.V/4;if(a.AF)this.iX=this.iX+a.V-this.G;break;case "vertical":this.E=b.V/4+3*c*b.V/4;if(!b.AF)this.iY=this.iY+b.V-this.E;
break;case "size":this.G=a.V/4+3*c*a.V/4;this.E=b.V/4+3*c*b.V/4;this.iX+=(a.V-this.G)/2;this.iY+=(b.V-this.E)/2}if(this.AM){a=new ZC.G4(this.A);a.P=this.P;a.copy(this);a.iX=this.iX;a.iY=this.iY;a.G=this.G;a.E=this.E;a.X=this.A.BE("bl",1);a.BT=this.A.BE("bl",0);a.paint();a=this.D.P+ZC._[36]+this.D.P+ZC._[37]+this.A.J+ZC._[6];this.A.A.FZ.push(ZC.L.DJ("rect")+'class="'+a+'" id="'+this.P+ZC._[32]+ZC._i_(this.iX+ZC.MAPTX)+","+ZC._i_(this.iY+ZC.MAPTX)+","+ZC._i_(this.iX+this.G+ZC.MAPTX)+","+ZC._i_(this.iY+
this.E+ZC.MAPTX)+'"/>')}this.A.U!=null&&this.G9()},A2F:function(a){var b=this;ZC.move||b.HT({layer:a,type:"box",initcb:function(){this.AT=b.A.AZ[1];this.BQ=b.A.AZ[1];this.Y=b.A.AZ[2];this.A8=b.A.AZ[3]},setupcb:function(){this.iX=b.iX;this.iY=b.iY;this.G=b.G;this.E=b.E}})}});
