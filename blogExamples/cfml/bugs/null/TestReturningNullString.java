public class TestReturningNullString {

    public static void main(String[] args) {
    }

    public static String conditionallyReturnString(boolean returnAString) {
		if (returnAString){
			return "";
		}
		return null;
    }

}