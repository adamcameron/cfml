/*
All of the code within the ZingChart software is developed and copyrighted by PINT, Inc., and may not be copied,
replicated, or used in any other software or application without prior permission from PINT. All usage must coincide with the
ZingChart End User License Agreement which can be requested by email at support@zingchart.com.

Build 0.120731
*/
ZC.QU.push("scatter");ZC.XG=ZC.KU.B6({$i:function(a){this.b(a);this.AC="scatter";this.B0=new ZC.WB(this);this.AQ[ZC._[25]]=1;this.AQ[ZC._[58]]=1}});ZC.WB=ZC.J7.B6({A26:function(){return new ZC.MM(this)}});
ZC.MM=ZC.OH.B6({$i:function(a){this.b(a);this.AC="scatter"},OD:function(){return new ZC.VE(this)},parse:function(){this.AZ=this.JB();this.BM=this.AZ[0];this.Y=this.AZ[1];this.A8=this.AZ[1];this.AT=this.AZ[2];this.BQ=this.AZ[2];this.loadXPalette();this.b();this.B3=this.D.B2(this.BB("k")[0]);this.D6=this.D.B2(this.BB("v")[0])},paint:function(){this.b();this.H2=this.BE("bl",0);this.JP(true)}});
ZC.VE=ZC.GN.B6({setup:function(){var a=this.A.B3,b=this.A.D6,c=[a.W,a.A0,b.W,b.A0];if(this.FB!=c){this.iX=a.B8(this.CO);this.iY=b.B8(this.A9);this.FB=c}if(!this.FO){this.copy(this.A);this.DK=this.A.DK;this.C4()&&this.parse(false);this.FO=1}},paint:function(){this.b();var a=this.A.B3;this.setup();ZC.DQ(this.iX,a.iX,a.iX+a.G)&&ZC.DQ(this.iY,a.iY,a.iY+a.E)&&this.KB(false,true)},A2F:function(a){ZC.move||this.MO(a)}});
