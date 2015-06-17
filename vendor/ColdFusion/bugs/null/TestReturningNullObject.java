public class TestReturningNullObject {

    public static void main(String[] args) {
    }

    public C conditionallyReturnObject(boolean returnAnObject) {
		if (returnAnObject){
			return new C();
		}
		return null;
    }
	
	class C{}

}