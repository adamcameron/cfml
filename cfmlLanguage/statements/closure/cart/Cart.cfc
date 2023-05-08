component {

	
	variables.stPrices.BUTTER	= 1.00;
	variables.stPrices.MILK		= 3.00;
	variables.stPrices.EGGS		= 6.95;

	variables.stProducts = {};

	
	public void function add(string product, numeric quantity){
		variables.stProducts[arguments.product] = arguments.quantity;
	}

	
	public numeric function getQuantity(string product){
		if (structKeyExists(variables.stProducts, product)){
			return variables.stProducts[product];
		}else{
			return 0;
		}
	}

	
	public numeric function getTotal(numeric tax){
		var st		= {
			fTotal	= 0.00
		};
		var fTax	= arguments.tax;
		
		structWalk(
			variables.stProducts,
			closure(numeric quantity, string product){
				var fPricePerItem	= 0;
				if (structKeyExists(variables.stPrices, arguments.product)){
					fPricePerItem = variables.stPrices[arguments.product];
					st.fTotal += (fPricePerItem * arguments.quantity) * (fTax + 1);
				}
			}
		);
		return decimalFormat(st.fTotal);
	}

	
	private void function structWalk(struct st, closure c){
		var sKey = "";
		for (sKey in arguments.st){
			arguments.st[sKey] = arguments.c(quantity=arguments.st[sKey], product=sKey);
		}
	}

	
}