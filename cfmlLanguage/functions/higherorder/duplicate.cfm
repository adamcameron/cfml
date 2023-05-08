<cfscript>
try {
	st1 = {value="initial"};
	st2 = st1.duplicate();
	st2.value = "updated";
	writeDump({st1=st1, st2=st2});
} catch(any e){
	writeDump([e.message]);
}

try {
	v = {value="initial"};
	a1 = [v];
	a2 = a1.duplicate();
	v.value = "updated";
	writeDump({a1=a1, a2=a2});
} catch(any e){
	writeDump([e.message]);
}

try {
	q1 = queryNew("value", "varchar", ["initial"]);
	q2 = q1.duplicate();
	q2.value[1] = "updated";
	writeDump({q1=q1, q2=q2});
} catch(any e){
	writeDump([e.message]);
}

try {
	s1 = "initial";
	s2 = s1.duplicate();
	s2 = "updated";
	writeDump({s1=s1, s2=s2});
} catch(any e){
	writeDump([e.message]);
}

try {
	d1 = 17 * 19;
	d2 = d1.duplicate();
	d2 = 23 * 29;
	writeDump({d1=d1, d2=d2});
} catch(any e){
	writeDump([e.message, e.detail, d1.getClass().getName()]);
}

try {
	ts1 = now();
	ts2 = ts1.duplicate();
	ts3 = ts2.add("yyyy", 1);
	writeDump({ts1=ts1, ts2=ts2, ts3=ts3});
} catch(any e){
	writeDump([e.message, e.detail, ts1.getClass().getName()]);
}

try {
	b1 = !!true;
	b2 = b1.duplicate();
	b2 = !true;
	writeDump({b1=b1, b2=b2});
} catch(any e){
	writeDump([e.message, e.detail, b1.getClass().getName()]);
}

try {
	x1 = xmlParse("<value>initial</value>");
	x2 = x1.duplicate();
	x2["value"][1]["xmlText"] = "updated";
	writeDump({x1=x1, x2=x2});
} catch(any e){
	writeDump([e.message]);
}

</cfscript>