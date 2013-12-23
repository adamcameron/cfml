/*
All of the code within the ZingChart software is developed and copyrighted by PINT, Inc., and may not be copied,
replicated, or used in any other software or application without prior permission from PINT. All usage must coincide with the
ZingChart End User License Agreement which can be requested by email at support@zingchart.com.

Build 0.120731
*/
ZC.QU.push("vbar3d");ZC.Y9=ZC.TB.B6({$i:function(a){this.b(a);this.AC="vbar3d";this.B0=new ZC.WG(this);this.BZ=new ZC.P4;this.AQ["3d"]=1;this.AQ[ZC._[58]]=0;this.AQ[ZC._[57]]=0},clear:function(){this.b();this.BZ.clear()},paint:function(){this.b();this.SA();this.IA()}});ZC.WG=ZC.RM.B6({A26:function(){return new ZC.NF(this)}});
ZC.NF=ZC.L8.B6({$i:function(a){this.b(a);this.AC="vbar3d"},OD:function(){return new ZC.W2(this)},parse:function(){this.b();if(this.o["border-color"]==null)this.BQ=this.AZ[0];if(this.o["line-color"]==null)this.AT=this.AZ[0]}});
ZC.W2=ZC.GN.B6({setup:function(){this.Q0()},A1N:function(a){var r="top-out",x=this.D.B2(this.A.BB("v")[0]);x=this.A9>=x.EE&&!x.AF||this.A9<x.EE&&x.AF?1:-1;if(a.o[ZC._[9]]!=null)r=a.o[ZC._[9]];var t=this.iX+this.G/2-a.D8/2,d=this.iY-a.CG/2;switch(r){case "top-out":case "top":d-=x*(a.CG/2+5);break;case "top-in":d+=x*(a.CG/2+5);break;case "middle":d+=x*(this.E/2);break;case "bottom-in":d+=x*(this.E-a.CG/2-5);break;case "bottom-out":case "bottom":d+=x*(this.E+a.CG/2+5)}return(new ZC.C0(this.D,t-ZC.AK.DZ,
d-ZC.AK.DY,ZC.AK.FS/2)).DD},paint:function(){var a=this;if(a.A9!=0){a.b();var r=a.D.BZ,x=a.A.B3,t=a.A.D6;a.setup();var d=t.B8(t.EE);d=ZC._l_(d,t.iY,t.iY+t.E);var l=a.A.NQ(),c=l.V,o=l.EO,g=l.CD,e=l.CI,u=l.EG,n=l.C1,f=l.E7;if(a.A.C2){var h=0;l=a.A.A.HC[o];for(var j=0;j<l.length;j++){var m=a.A.A.AA[l[j]].Q[a.J];if(m)h+=m.A9}}l=m=1;if(a.A.C2){if(a.C8!=a.A9)m=(h-a.C8+a.A9)/h;l=(h-a.C8)/h}if(t.AF){j=m;m=l;l=j}o=a.iX-c/2+g+o*(n+u)-o*f;o=ZC._l_(o,a.iX-c/2+g,a.iX+c/2-e);if(a.A.C1>0){c=n;n=a.A.C1;if(n<=1)n*=
c;o+=(c-n)/2}c=n;n=a.iY;if(a.A.C2){j=a.D.MV=="100%"?t.B8(100*(a.C8-a.A9)/a.A.A.H0[a.J]["%total"]):t.B8(a.C8-a.A9);j=ZC._l_(j,t.iY,t.iY+t.E);if(n<=j)j=j-a.iY;else{n=j;j=a.iY-j}}else if(n<=d)j=d-a.iY;else{n=d;j=a.iY-d}if(g+e==0){o-=0.5;c+=1}a.G=c;a.E=j;a.iX=o;a.I.iX=o;a.I.iY=n;a.I.DH=d;d=o-ZC.AK.DZ;g=n-ZC.AK.DY;e=0;c=ZC.AK.FS;if(a.D.AC=="mixed3d"||a.D.AC=="mixed"){u=1;j=0;for(e=a.A.A.AA.length;j<e;j++)a.A.A.AA[j].AC!="vbar3d"&&u++;e=(u-1)*(ZC.AK.FS/u);c=ZC._i_(0.9*c/u)}if(a.AM){j=a.A.FG(a,a.S);var O=
a.D.P+ZC._[36]+a.D.P+ZC._[37]+a.A.J+ZC._[6];u=ZC.L.DJ("poly")+'class="'+O+'" id="'+a.P;var v=a.D.DM.true3d;f=a.G/2;h=c/2;var C=m*f,p=l*f,y=l*h,D=m*h;if(t.AF&&!a.A.C2)var w=a.A9>=0?0:a.E,q=a.A9>=0?a.E:0;else{w=a.A9>=0?a.E:0;q=a.A9>=0?0:a.E}var H=a.A.A.FZ,i=ZC.CT(h,f),I=a.D.DM[ZC._[30]],s=a.D.DM.angle,z=ZC.D4(s)*h,A=ZC.CP(s)*h;v||(i=ZC.CT(2*z,f));s=function(E){var B=0,F=a.A.J,G=a.J,P=a.A.A.AA.length,J=a.A.Q.length;switch((a.A.C2?"s":"")+(x.AF?"k":"")+(t.AF?"v":"")){case "":B=10*F+G*1E4+E;break;case "v":B=
10*F+G*1E4+E;break;case "sv":B=10*(P-F)+G*1E4+E;break;case "k":B=10*F+(J-G)*1E4+E;break;case "skv":B=10*(P-F)+(J-G)*1E4+E;break;case "kv":B=10*F+(J-G)*1E4+E;break;case "s":B=10*F+G*1E4+E;break;case "sk":B=10*F+(J-G)*1E4+E}return B};for(var K=ZC.MAX,L=-ZC.MAX,Q=ZC.MAX,R=-ZC.MAX,M=ZC.MAX,N=-ZC.MAX,S=ZC.MAX,T=-ZC.MAX,b=0;b<=360;b+=1){var k=new ZC.C0(a.D,d+ZC.CP(b)*i+f,g,e+ZC.D4(b)*i+h);if(k.DD[0]<Q){Q=k.DD[0];K=b}if(k.DD[0]>R){R=k.DD[0];L=b}k=new ZC.C0(a.D,d+ZC.CP(b)*i+f,g+a.E,e+ZC.D4(b)*i+h);if(k.DD[0]<
S){S=k.DD[0];M=b}if(k.DD[0]>T){T=k.DD[0];N=b}}switch(a.A.CJ){default:b=ZC.DC.DR(j,a.D,d+0.1,d+a.G-0.1,g+a.E-0.1,g+a.E-0.1,e+0.1,e+c-0.1,"x");b.DL=s(1);r.add(b);p=ZC.DC.DR(j,a.D,d+0.1,d+a.G-0.1,g+0.1,g+0.1,e+0.1,e+c-0.1,"x");p.DL=s(3);r.add(p);o=ZC.DC.DR(j,a.D,d+0.1,d+0.1,g+0.1,g+a.E-0.1,e+0.1,e+c-0.1,"z");o.DL=s(2);r.add(o);n=ZC.DC.DR(j,a.D,d+a.G-0.1,d+a.G-0.1,g+0.1,g+a.E-0.1,e+0.1,e+c-0.1,"z");n.DL=s(4);r.add(n);m=ZC.DC.DR(j,a.D,d+0.1,d+a.G-0.1,g+0.1,g+a.E-0.1,e+0.1,e+0.1,"y");m.DL=s(5);r.add(m);
if(a.A.H4){l==1&&H.push(ZC.L.DJ("poly")+'class="'+O+'" id="'+a.P+"--top"+ZC._[32]+p.DF()+'"/>');H.push(u+"--left"+ZC._[32]+o.DF()+'"/>',u+"--right"+ZC._[32]+n.DF()+'"/>',u+"--front"+ZC._[32]+m.DF()+'"/>')}break;case "pyramid":b=ZC.DC.DR(j,a.D,d+f-C,d+f+C,g+w,g+w,e+h-D,e+h+D,"x");b.DL=s(t.AF&&!a.A.C2?6:1);r.add(b);c=[[d+f-C,g+w,e+h-D],[d+f+C,g+w,e+h-D]];a.A.C2&&l!=0?c.push([d+f+p,g+q,e+h-y],[d+f-p,g+q,e+h-y]):c.push([d+f,g+q,e+h]);m=ZC.DC.DV(j,a.D,c);m.DL=s(3);r.add(m);c=[[d+f-C,g+w,e+h-D],[d+f-C,
g+w,e+h+D]];a.A.C2&&l!=0?c.push([d+f-p,g+q,e+h+y],[d+f-p,g+q,e+h-y]):c.push([d+f,g+q,e+h]);o=ZC.DC.DV(j,a.D,c);o.DL=s(2);r.add(o);c=[[d+f+C,g+w,e+h-D],[d+f+C,g+w,e+h+D]];a.A.C2&&l!=0?c.push([d+f+p,g+q,e+h+y],[d+f+p,g+q,e+h-y]):c.push([d+f,g+q,e+h]);n=ZC.DC.DV(j,a.D,c);n.DL=s(4);r.add(n);if(a.A.C2&&l!=0){c=[[d+f-p,g+q,e+h-y],[d+f-p,g+q,e+h+y],[d+f+p,g+q,e+h+y],[d+f+p,g+q,e+h-y]];p=ZC.DC.DV(j,a.D,c);p.DL=s(5);r.add(p)}a.A.H4&&H.push(u+"--left"+ZC._[32]+o.DF()+'"/>',u+"--right"+ZC._[32]+n.DF()+'"/>',
u+"--front"+ZC._[32]+m.DF()+'"/>');break;case "cylinder":c=[];if(v)for(b=0;b<=360;b+=5)c.push([d+ZC.CP(b)*i+f,g+a.E,e+ZC.D4(b)*i+h]);else for(b=0;b<=360;b+=5){k=new ZC.C0(a.D,0,0,0);k.DD=[o+ZC.D4(b)*i+f+z,n+a.E+ZC.CP(b)*(i/2)-A];c.push(k)}b=ZC.DC.DV(j,a.D,c,!v);b.DL=s(1);r.add(b);c=[];if(v)for(b=0;b<=360;b+=5)c.push([d+ZC.CP(b)*i+f,g,e+ZC.D4(b)*i+h]);else for(b=0;b<=360;b+=5){k=new ZC.C0(a.D,0,0,0);k.DD=[o+ZC.D4(b)*i+f+z,n+ZC.CP(b)*(i/2)-A];c.push(k)}p=ZC.DC.DV(j,a.D,c,!v);r.add(p);p.DL=s(3);c=[];
if(v){for(b=ZC.CT(K,L);b<=ZC.BR(K,L);b+=1)c.push([d+ZC.CP(b)*i+f,g,e+ZC.D4(b)*i+h]);c.push([d+ZC.CP(b)*i+f,g+a.E,e+ZC.D4(b)*i+h]);for(b=ZC.BR(M,N);b>=ZC.CT(M,N);b-=1)c.push([d+ZC.CP(b)*i+f,g+a.E,e+ZC.D4(b)*i+h])}else{for(b=0;b<=180;b+=5){k=new ZC.C0(a.D,0,0,0);k.DD=[o+ZC.D4(b)*i+f+z,n+a.E+ZC.CP(b)*(i/2)-A];c.push(k)}for(b=180;b>=0;b-=5){k=new ZC.C0(a.D,0,0,0);k.DD=[o+ZC.D4(b)*i+f+z,n+ZC.CP(b)*(i/2)-A];c.push(k)}}m=ZC.DC.DV(j,a.D,c,!v);m.DL=s(2);r.add(m);a.A.H4&&H.push(u+"--front"+ZC._[32]+m.DF()+
'"/>',u+"--top"+ZC._[32]+p.DF()+'"/>');break;case "cone":c=[];if(v)for(b=0;b<=360;b+=5)c.push([d+ZC.CP(b)*i*m+f,g+w,e+ZC.D4(b)*i*m+h]);else for(b=0;b<=360;b+=5){k=new ZC.C0(a.D,0,0,0);k.DD=[o+ZC.D4(b)*i*m+f+z,n+w+ZC.CP(b)*(i/2)*m-A];c.push(k)}b=ZC.DC.DV(j,a.D,c,!v);b.DL=s(1);r.add(b);c=[];if(v){for(b=90+I;b<=270+I;b+=5)c.push([d+ZC.CP(b)*i*m+f,g+w,e+ZC.D4(b)*i*m+h]);if(a.A.C2&&l!=0)for(b=270+I;b>=90+I;b-=5)c.push([d+ZC.CP(b)*i*l+f,g+q,e+ZC.D4(b)*i*l+h]);else c.push([d+f,g+q,e+h])}else{for(b=0;b<=
180;b+=5){k=new ZC.C0(a.D,0,0,0);k.DD=[o+ZC.D4(b)*i*m+f+z,n+w+ZC.CP(b)*(i/2)*m-A];c.push(k)}if(a.A.C2&&l!=0)for(b=180;b>=0;b-=5){k=new ZC.C0(a.D,0,0,0);k.DD=[o+ZC.D4(b)*i*l+f+z,n+q+ZC.CP(b)*(i/2)*l-A];c.push(k)}else{k=new ZC.C0(a.D,0,0,0);k.DD=[o+f+z,n+q-A];c.push(k)}}m=ZC.DC.DV(j,a.D,c,!v);m.DL=s(2);r.add(m);if(a.A.C2&&l!=0){c=[];if(v)for(b=0;b<=360;b+=5)c.push([d+ZC.CP(b)*i*l+f,g+q,e+ZC.D4(b)*i*l+h]);else for(b=0;b<=360;b+=5){k=new ZC.C0(a.D,0,0,0);k.DD=[o+ZC.D4(b)*i*l+f+z,n+q+ZC.CP(b)*(i/2)*l-
A];c.push(k)}p=ZC.DC.DV(j,a.D,c,!v);r.add(p);p.DL=s(3)}a.A.H4&&H.push(u+"--front"+ZC._[32]+m.DF()+'"/>')}a.A.U!=null&&a.G9()}}}});