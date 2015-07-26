import static java.lang.System.out;

public class Multiple {

	public static void main(String[] args){
		int a = 17;
		int b = 19;
		int c = 23;

		a += (b += c);

		out.println(a);
		out.println(b);
		out.println(c);
	}
}