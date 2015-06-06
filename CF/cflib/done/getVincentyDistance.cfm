<cfscript>
numeric function getVincentyDistance(required numeric lat1, required numeric lon1, required numeric lat2, required numeric lon2, string units="m" ) {
	// WGS-84 ellipsoid params
	var a = 6378137;
	var b = 6356752.314245;
	var f = 1 / 298.257223563;

	var L = ( lon2 - lon1 ) * pi() / 180;
	var U1 = atn( ( 1 - f ) * tan( lat1 * pi() / 180 ) );
	var U2 = atn( ( 1 - f ) * tan( lat2 * pi() / 180 ) );
	var sinU1 = sin( U1 );
	var cosU1 = cos( U1 );
	var sinU2 = sin( U2 );
	var cosU2 = cos( U2 );
	var lambda = L;
	var lambdaP = '';
	var iterLimit = 100;
	var sinLambda = '';
	var cosLambda = '';
	var sinSigma = '';
	var cosSigma = '';
	var sigma = '';
	var sinAlpha = '';
	var cosSqAlpha = '';
	var cos2SigmaM = '';
	var C = '';
	var uSq = '';
	var AA = '';
	var BB = '';
	var deltaSigma = '';
	var s = '';
	var Math = createObject( 'java', 'java.lang.Math' );

	if ( lat1 > 90 || lat1 < -90 || lon1 > 180 || lon1 < -180 || lat2 > 90 || lat2 < -90 || lon2 > 180 || lon2 < -180 ) {
		throw(
			type	= "InvalidCoordinatesException",
			message	= "Invalid coordinates",
			detail	= "Latitude must be between 0deg and +/-90deg. (south latitude is negative). Longitude mast be between 0deg and +/-180deg. (west longitude is negative)"
		);
	};

	if ( not structKeyExists( arguments, 'units' ) or not listFindNoCase( 'm,km,sm,nm,yd,ft,in,cm,mm', arguments.units ) ) {
		arguments.units = 'sm'; // default to statute miles
	};

	do {
		sinLambda = sin( lambda );
		cosLambda = cos( lambda );
		sinSigma = sqr( ( cosU2 * sinLambda ) * ( cosU2 * sinLambda ) + ( cosU1 * sinU2 - sinU1 * cosU2 * cosLambda ) * ( cosU1 * sinU2 - sinU1 * cosU2 * cosLambda ) );
		if ( sinSigma == 0 ) { return 0; };  // co-incident points
		cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda;
		sigma = Math.ATan2( JavaCast( 'double', sinSigma ), javaCast( 'double', cosSigma ) ); // CFML doesn't have a native ATan2() method avail.
		sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma;
		cosSqAlpha = 1 - sinAlpha * sinAlpha;
		cos2SigmaM = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha;
		if ( not IsNumeric( cos2SigmaM ) ) { cos2SigmaM = 0; }; // equatorial line: cosSqAlpha=0 (§6)
		C = f / 16 * cosSqAlpha * ( 4 + f * ( 4 - 3 * cosSqAlpha ) );
		lambdaP = lambda;
		lambda = L + ( 1 - C ) * f * sinAlpha * ( sigma + C * sinSigma * ( cos2SigmaM + C * cosSigma * ( -1 + 2 * cos2SigmaM * cos2SigmaM ) ) );
	} while ( abs( lambda - lambdaP ) > 0.000000000001 and --iterLimit > 0 );

	if ( iterLimit == 0 ) {
		throw(
			type	= "FormulaFailureException",
			message	= "Formula failed to converge",
			detail	= "Nearly-antipodal points may fail to give a solution"
		);
	};

	uSq = cosSqAlpha * ( a * a - b * b ) / ( b * b );
	AA = 1 + uSq / 16384 * ( 4096 + uSq * ( -768 + uSq * ( 320 - 175 * uSq ) ) );
	BB = uSq / 1024 * ( 256 + uSq * ( -128 + uSq * ( 74 - 47 * uSq ) ) );
	deltaSigma = BB * sinSigma * ( cos2SigmaM + BB / 4 * ( cosSigma * ( -1 + 2 * cos2SigmaM * cos2SigmaM ) - BB / 6 * cos2SigmaM * ( -3 + 4 * sinSigma * sinSigma ) * ( -3 + 4 * cos2SigmaM * cos2SigmaM ) ) );
	s = b * AA * ( sigma - deltaSigma );
	s = NumberFormat( s, .999 ); // round to 1mm precision
	
	switch( arguments.units ) {
		case 'm' : // meters 
			break;
		case 'km' : s = s * 0.001; // kilometers
			break;
		case 'nm' : s = s * 0.000539956803; // nautical miles
			break;
		case 'yd' : s = s * 1.0936133; // yards
			break;
		case 'ft' : s = s * 3.2808399; // feet
			break;
		case 'in' : s = s * 39.3700787; // inches
			break;
		case 'cm' : s = s * 100; // centimeters
			break;
		case 'mm' : s = s * 1000; // millimeters
			break;
		default : s = s * 0.000621371192; // statute miles
	};

	return s;
};	


d =	getVincentyDistance(
	lat1 = 41.4994954,
	lon1 = -81.6954088,
	lat2 = 41.8781136,
	lon2 = -87.6297982
); 

writeOutput(d & "<br />");


d =	getVincentyDistance(
	lat1 = 51.59405029909825,
	lon1 = 0.03005844356266607,
	lat2 = -51.59405029909825,
	lon2 = -179.96994155643733,
	units = 'm'
); 
writeOutput(d & "<br />");
</cfscript>