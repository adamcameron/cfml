public class FpExample {
	
	public static void main(String[] args){
		Double num = 123.45;
		Double total;
		
		String strResult = "";
		
		for (int i=0; i <= 100; i++){
			total = i * num / 100;
			System.out.print(i + ": " + total + " ");;
			System.out.println(total.toString());;
		}
		
		System.out.println(strResult);
		
	}
	
}


/*

<cfset num = 123.45>

<cfoutput>
<cfloop index="i" from="0" to="100">
      <cfset total = i * num / 100 />
      
      #i#: #total# - #total.toString()#<br />
</cfloop>
</cfoutput>

*/