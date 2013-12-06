/*
All of the code within the ZingChart software is developed and copyrighted by PINT, Inc., and may not be copied,
replicated, or used in any other software or application without prior permission from PINT. All usage must coincide with the
ZingChart End User License Agreement which can be requested by email at support@zingchart.com.

Build 0.120731
*/
ZC.QU.push("bubble");ZC.Y5=ZC.KU.B6({$i:function(a){this.b(a);this.AC="bubble";this.B0=new ZC.WP(this);this.AQ[ZC._[25]]=1;this.AQ[ZC._[58]]=1}});ZC.WP=ZC.J7.B6({A26:function(){return new ZC.NH(this)}});
ZC.NH=ZC.OH.B6({$i:function(a){this.b(a);this.AC="bubble";this.IP=1},OD:function(){return new ZC.W8(this)},parse:function(){this.AZ=this.JB();this.BM=this.AZ[0];this.Y=this.AZ[2];this.A8=this.AZ[1];this.AT=this.AZ[2];this.BQ=this.AZ[2];this.loadXPalette();this.b();this.Q4_a([["size-factor","IP","f"]]);this.B3=this.D.B2(this.BB("k")[0]);this.D6=this.D.B2(this.BB("v")[0])},paint:function(){this.b();this.H2=this.BE("bl",0);this.JP(true)}});
ZC.W8=ZC.GN.B6({$i:function(a){this.b(a);this.U2=null},parse:function(){this.b();if(this.o[ZC._[11]]instanceof Array&&this.o[ZC._[11]][2]!=null)this.U2=ZC._f_(this.o[ZC._[11]][2])},KJ:function(a,b){this.DN=[["%v0",this.CO],["%v1",this.A9],["%v2",this.U2]];return a=this.b(a,b)},setup:function(){var a=this.A.B3,b=this.A.D6,c=[a.W,a.A0,b.W,b.A0];if(this.FB!=c){this.iX=a.B8(this.CO);this.iY=b.B8(this.A9);this.FB=c}if(!this.FO){this.copy(this.A);this.DK=this.A.DK;this.C4()&&this.parse(false);this.FO=1}},
paint:function(){this.b();var a=this.A.B3,b=this.A.D6;this.setup();this.I["marker.size"]=ZC.BR(2.02,this.U2*this.A.IP*((b.E-b.A2-b.CK)/(b.C3-b.BG))/2);ZC.DQ(this.iX,a.iX,a.iX+a.G)&&ZC.DQ(this.iY,a.iY,a.iY+a.E)&&this.KB(false,true)},A2F:function(a){ZC.move||this.MO(a)}});
