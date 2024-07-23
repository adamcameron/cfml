import java.math.BigDecimal;

class JavaVersion {

	public static void main(String[] args){
		double x = 17.76;
		int y = 100;
		System.out.println(x*y);
		
		BigDecimal x2 = new BigDecimal(17.76);
		BigDecimal y2 = new BigDecimal(100);
		System.out.println(x2.multiply(y2));
		
	}
}