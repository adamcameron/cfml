class ByRef {

	public static void uc(String s){
		s = s.toUpperCase();
	}

	public static String change(String s){
		uc(s);
		return s;
	}

}