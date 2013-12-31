<cfcomponent>

<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Computes the theoretical price of an equity option.
 * 
 * @param call_put_flag 	 The Call Put Flag. (Required)
 * @param S 	 The current asset price. (Required)
 * @param X 	 Exercise price. (Required)
 * @param T 	 Time to maturity. (Required)
 * @param r 	 Risk-free Interest rate. (Required)
 * @param v 	 Annualized volatility. (Required)
 * @return Returns a number. 
 * @author Alex (axs@arbornet.org) 
 * @version 1, May 9, 2003 
 */
function BlackScholes (call_put_flag,S,X,T,r,v) {
    var d1 = ( log(S / X) + (r + (v^2) / 2) * T ) / ( v * (T^0.5) );
    var d2 = d1 - v * (T^0.5);

    if (call_put_flag eq 'c')
        return S * CND(d1) - X * exp( -r * T ) * CND(d2);
    else
        return X * exp( -r * T ) * CND(-d2) - S * CND(-d1);
}
</cfscript>

<!---
 Calculate IRR.
 
 @param arrCashFlow 	 Array of cashflow. (Required)
 @return Returns a numeric value. 
 @author FALCONSEYE (falconseye@live.com) 
 @version 1, October 10, 2011 
--->
<cffunction name="calcIRR" output="false">
	<cfargument name="arrCashFlow" type="Array" required="yes" hint="array of cashflow">
	<cfscript>
		var guess = 0.1;
		var inc   = 0.00001;
		do {
			guess += inc;
			npv = 0; //net present value
			for (var i=1; i<=arrayLen(arguments.arrCashFlow); i++)	{
				npv += arguments.arrCashFlow[i] / ((1 + guess) ^ i);	
			}
			
		} while ( npv > 0 );
		
		guess =  guess * 100;
	</cfscript>
	<cfreturn guess>
</cffunction>

<cfscript>
/**
 * Calculate the compound interest after n years.
 * 
 * @param r 	 Interest rate (3% = 0.03). 
 * @param p 	 Principal 
 * @param t 	 Duration of the loan in years. 
 * @return Returns a numeric value. 
 * @author Stephan Scheele (stephan@stephan-t-scheele.de) 
 * @version 1, April 23, 2002 
 */
function compoundInterest(r, p, t){
  return (p* (1 + r)^t);
}
</cfscript>

<cfscript>
/**
 * Calculate the actual value of an amount by discounting the interest over n years.
 * 
 * @param p 	 Principal 
 * @param r 	 Interest rate (0.03 = 3%) 
 * @param t 	 Time in years. 
 * @return Returns a numeric value. 
 * @author Stephan Scheele (stephan@stephan-t-scheele.de) 
 * @version 1.0, April 23, 2002 
 */
function DiscountingInterest(r, p, t){
 return (p / (1 + r)^t);
}
</cfscript>

<cfscript>
/**
 * Returns the interest rate per period of an annuity.
 * 
 * @param nper 	 Total number of payment periods in an annuity. (Required)
 * @param pmt 	 The payment made each period and cannot change over the life of the annuity. (Required)
 * @param pv 	 The present value; the total amount that a series of future payments is worth now. (Required)
 * @param fv 	 The future value, or a cash balance you want to attain after the last payment is made. (Optional)
 * @param type 	 The number 0 or 1, indicating when payments are due. (Optional)
 * @param guess 	 The guess for what the rate will be. (Optional)
 * @return Returns a number. 
 * @author Bret Feddern (bret@bricecheddarn.com) 
 * @version 1, February 23, 2012 
 */
/**
 * Returns the interest rate per period of an annuity. 
 * RATE is calculated by iteration and can have zero or more solutions.
 * 
 * excelRate(nper,pmt,pv,fv,type,guess)
 * @param nper  |   
 * @param pmt  |   
 * @param pv  |   
 * @param fv  |    OPTIONAL 
 * @param type  |    OPTIONAL 
 * @param guess  |    OPTIONAL 
 * @return  |  A numeric value. 
 * @author  |  Bret Feddern (bret@bricecheddarn.com) 
 * @version 1 - February 19, 2012 
 */

function excelRate(nper, pmt, pv) {

	var financialPrecision = 1.0e-08;
	var maxIterations = 128;
	var fv = 0.0;
	var type = 0; 
	var guess = 0.1;
	var rate = '';
	var f = '';
	var i = '';
	var y = '';
	var y0 = '';
	var y1 = '';
	var x0 = '';
	var x1 = '';
	
	if (ArrayLen(arguments) GT 3) {
		fv = arguments[4];
	}
	
	if (ArrayLen(arguments) GT 4) {
		type = arguments[5];
	}
	
	if (ArrayLen(arguments) GT 5) {
		guess = arguments[6];
	}
	
	rate = guess;
		
	if (abs(rate) lt financialPrecision) {
		y = arguments.pv * (1 + arguments.nper * rate) + arguments.pmt * (1 + rate * type) * arguments.nper + fv;
	} else {
		f = exp(arguments.nper * log(1 + rate));
		y = arguments.pv * f + arguments.pmt * (1 / rate + type) * (f - 1) + fv;
	}
	
	y0 = arguments.pv + arguments.pmt * arguments.nper + fv;
	y1 = arguments.pv * f + arguments.pmt * (1 / rate + type) * (f - 1) + fv;
	
	i = 0.0;
	x0 = 0.0;
	x1 = rate;
	
	while ((abs(y0 - y1) GT financialPrecision) AND (i LT maxIterations)) {
        rate = (y1 * x0 - y0 * x1) / (y1 - y0);
		x0 = x1;
		x1 = rate;
  
		if (abs(rate) LT financialPrecision) {
			y = arguments.pv * (1 + arguments.nper * rate) + arguments.pmt * (1 + rate * type) * arguments.nper + fv;
		} else {
			f = exp(arguments.nper * log(1 + rate));
			y = arguments.pv * f + arguments.pmt * (1 / rate + type) * (f - 1) + fv;
		}
		 
		y0 = y1;
		y1 = y;  
        i = i++;
     }
	
	return(rate);
}
</cfscript>

<cfscript>
/**
 * Calculate the future value of investment with regular deposits.
 * 
 * @param IT 	 Interest rate per year (8% = 0.08) 
 * @param PMT 	 Number of payments. 
 * @param PV 	 Present value. 
 * @param NP 	 Number of periods. 
 * @return Returns a numeric value. 
 * @author Raymond Thompson (rayt@qsystems.net) 
 * @version 1, April 23, 2002 
 */
function FutureValue(IR,PMT,PV,NP) {
  var tpv = abs(pv);
  var tnp = abs(np);
  var fv = pv;
  var tpmt = -abs(pmt);
  var tir = abs(ir) / 12;
  var scale=0;

  if(ArrayLen(Arguments) gt 4) {
    scale = 10^abs(Arguments[4]);
  }
  if (ir eq 0) {
    fv = tpv + abs(tpmt * tnp);
  } else {
    q = (1 + tir)^tnp;
    fv = (-pmt + q * pmt + tir * q * tpv) / tir;
  }
  if (scale NEQ 0) {
    fv = int(fv * scale + 0.5) / scale;
  }
  return(-fv);
}
</cfscript>

<!---
 This function outputs the current value of an item based on straight line depreciation.
 
 @param acq_cost 	 Cost of item. (Required)
 @param act_date 	 Date item acquired. (Required)
 @param numberOfYears 	 Number of years to depreciate the item. (Required)
 @return Returns a number. 
 @author Steve Walker (sneakyllama@gmail.com) 
 @version 1, June 4, 2008 
--->
<cffunction name="getDepreciatedValue" output="no" returntype="numeric" hint="Calculates the current straight line depreciated value">
	<cfargument name="acq_cost" required="yes" type="numeric" hint="The acquistion cost or value of an item">
	<cfargument name="acq_date" type="date" required="yes" hint="the acquisition date of the item">
	<cfargument name="numberofYears" type="numeric" default="5" required="yes" hint="the number of years to depreciate the item.">
	<cfset var DV = "">
	<cfset var cost = arguments.acq_cost>
	<cfset var days = arguments.numberofYears * 365>
	<cfset var age = dateDiff('d', DateFormat(arguments.acq_date,'mm/dd/yyyy'), DateFormat(Now(),'mm/dd/yyyy'))>
	
	<cfif age gte days>
		<cfset age = days>
	</cfif>
	
	<cfset DV = (cost*((age/days)-1)*-1)>
	
	<cfreturn DV>
</cffunction>

<cfscript>
/**
 * Check if a string is a well formed italian Fiscal Code.
 * 
 * @param codFisc 	 Financial code. (Required)
 * @return Returns a boolean. 
 * @author Giampaolo Bellavite (giampaolo@bellavite.com) 
 * @version 1, April 12, 2004 
 */
function IsCodFisc(codFisc) {
	return ReFind("^[A-Z]{6}\d{2}[A-Z]\d{2}[A-Z]\d{3}[A-Z]$", trim(codFisc));
}
</cfscript>

<cfscript>
/**
 * Calculate payment on loan.
 * 
 * @param IR 	 Interest rate per year (8.5% = 0.085) 
 * @param PV 	 Present Value 
 * @param FV 	 Future Value (Generally zero for calculating payments. Non zero for pay down to ammount.) 
 * @param NP 	 Number of periods. 
 * @return Returns a numeric value. 
 * @author Raymond Thompson (rayt@qsystems.net) 
 * @version 1, August 2, 2001 
 */
function Payment(IR,PV,FV,NP) {
  var tir = abs(ir) / 12;
  var tfv = abs(fv);
  var tpv = abs(pv);
  var scale = 0;
  var pmt=0;
  var q = (1 + tir)^ abs(np);

  if(ArrayLen(Arguments) gt 4) {
    scale = 10^abs(Arguments[5]);
  }
  pmt = (tir * (tfv + q * tpv)) / (-1 + q);
  if (scale NEQ 0)
    pmt = int(pmt * scale + 0.5) / scale;
  return(-pmt);
}
</cfscript>

<cfscript>
/**
 * Calculate the number of payments for a loan.
 * 
 * @param IR 	 Interest rate per year (8% = 0.08) 
 * @param PV 	 Present Value 
 * @param FV 	 Future Value 
 * @param PMT 	 Payment Amount 
 * @return Returns a numeric value. 
 * @author Raymond Thompson (rayt@qsystems.net) 
 * @version 1, August 2, 2001 
 */
function Periods(IR,PV,FV,PMT) {
  var tir = ir / 12;
  var scale = 0;
  var np=0;
  var tpv = -abs(pv);
  var tfv = -abs(fv);
  var tpmt = abs(pmt);

  if(ArrayLen(Arguments) gt 4) {
    scale = 10^abs(Arguments[5]);
  }
  np = log((-tfv * tir + tpmt) / (tpmt + tir * tpv)) / log(1 + tir);
  if (scale NEQ 0)
    np = int(np * scale + 0.5) / scale;
  return(np);
}
</cfscript>

<cfscript>
/**
 * Translates a Cryptic Futures symbol into a descriptive structure.
 * 
 * @param Future 	 The futures symbol. 
 * @return Returns a structure. 
 * @author Mark Kruger (Mkruger@cfwebtools.com) 
 * @version 1, January 29, 2002 
 */
function TranslateFuture(Symbol) {
	var	TheYear				=	'';
	var	TheMonth			=	'';
	var SymbolStruct		=	StructNew();
	
	if(Symbol IS NOT '') {
		Symbol				=	replace(Symbol,'0','');
		TheYear				=	'200' &  val(Reverse(Symbol));
		Symbol				=	Replace(symbol,val(reverse(symbol)),'');
		TheMonth			=	right(symbol,1);
		switch(TheMonth)
		{
			case 'F':	{	TheMonth	=	'January';		break;		}
			case 'G':	{	TheMonth	=	'February';		break;		}
			case 'H':	{	TheMonth	=	'March';		break;		}
			case 'J':	{	TheMonth	=	'April';		break;		}
			case 'K':	{	TheMonth	=	'May';			break;		}
			case 'M':	{	TheMonth	=	'June';			break;		}
			case 'N':	{	TheMonth	=	'July';			break;		}
			case 'Q':	{	TheMonth	=	'August';		break;		}
			case 'U':	{	TheMonth	=	'September';	break;		}
			case 'V':	{	TheMonth	=	'October';		break;		}
			case 'X':	{	TheMonth	=	'November';		break;		}
			case 'Z':	{	TheMonth	=	'December';		break;		}				
		}
		
		
		Symbol				=	left(symbol,len(symbol)-1);
		SymbolStruct.Year	=	TheYear;
		SymbolStruct.Root	=	Symbol;
		SymbolStruct.Month	=	TheMonth;
	}
	else {
		SymbolStruct		=	structnew();	
		SymbolStruct.Year	=	'';
		SymbolStruct.Root	=	'';
		SymbolStruct.Month	=	'';
	}
	return(symbolStruct);
}
</cfscript>

<cfscript>
/**
 * Handles commodity month translation tasks.
 * Removed duplicate My case - rcamden
 * 
 * @param monthcode 	 Month, or month code, to translate. 
 * @return Returns a string. 
 * @author Mark Kruger (Mkruger@cfwebtools.com) 
 * @version 1.1, April 11, 2002 
 */
function TranslateFutureMonth(monthcode) {
	var TheMonth =	'';
	switch(Monthcode)
	{
		// Translate the letter code into the month code
		case 'F':	{	TheMonth	=	'January';		break;		}
		case 'G':	{	TheMonth	=	'February';		break;		}
		case 'H':	{	TheMonth	=	'March';		break;		}
		case 'J':	{	TheMonth	=	'April';		break;		}
		case 'K':	{	TheMonth	=	'May';			break;		}
		case 'M':	{	TheMonth	=	'June';			break;		}
		case 'N':	{	TheMonth	=	'July';			break;		}
		case 'Q':	{	TheMonth	=	'August';		break;		}
		case 'U':	{	TheMonth	=	'September';	break;		}
		case 'V':	{	TheMonth	=	'October';		break;		}
		case 'X':	{	TheMonth	=	'November';		break;		}
		case 'Z':	{	TheMonth	=	'December';		break;		}
		// Translate the month description into the letter code
		case 'January':		{	TheMonth	=	'F';	break;		}
		case 'February':	{	TheMonth	=	'G';	break;		}
		case 'March':		{	TheMonth	=	'H';	break;		}
		case 'April':		{	TheMonth	=	'J';	break;		}
		case 'June':		{	TheMonth	=	'M';	break;		}
		case 'July':		{	TheMonth	=	'N';	break;		}
		case 'August':		{	TheMonth	=	'Q';	break;		}
		case 'September':	{	TheMonth	=	'U';	break;		}
		case 'October':		{	TheMonth	=	'V';	break;		}
		case 'November':	{	TheMonth	=	'X';	break;		}
		case 'December':	{	TheMonth	=	'Z';	break;		}
		// Translate 3 letter month code into letter code
		case 'Jan':			{	TheMonth	=	'F';	break;		}
		case 'Feb':			{	TheMonth	=	'G';	break;		}
		case 'Mar':			{	TheMonth	=	'H';	break;		}
		case 'Apr':			{	TheMonth	=	'J';	break;		}
		case 'May':			{	TheMonth	=	'K';	break;		}
		case 'Jun':			{	TheMonth	=	'M';	break;		}
		case 'Jul':			{	TheMonth	=	'N';	break;		}
		case 'Aug':			{	TheMonth	=	'Q';	break;		}
		case 'Sep':			{	TheMonth	=	'U';	break;		}
		case 'Oct':			{	TheMonth	=	'V';	break;		}
		case 'Nov':			{	TheMonth	=	'X';	break;		}
		case 'Dec':			{	TheMonth	=	'Z';	break;		}
	}
	
	return(TheMonth);		
}
</cfscript>








</cfcomponent>