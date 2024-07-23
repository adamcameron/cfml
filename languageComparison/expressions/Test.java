// Test.java
public class Test {
	public static void main(String[] args){
		boolean a = true;
		boolean b = false;
		if (a=b){
			System.out.println("yup");
		}else{
			System.out.println("nup");
		}
		System.out.println(String.format("%b %b", a, b));
	}
}