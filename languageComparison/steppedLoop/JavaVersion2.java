import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Stream;
import java.util.function.Predicate;
import java.util.function.Function;
import java.util.function.Consumer;

public class JavaVersion2 {
	
	private static int i=0;
	
	public static void main(String[] args){
		Number[] numbersArray = getNumbersArray();

		new ArrayList<Number>(Arrays.asList(numbersArray))
			.stream()
			.map((number) -> new IndexedNumber(++i, number))
			.filter((indexedNumber) -> indexedNumber.index % 2 != 0)
			.map((indexedNumber) -> indexedNumber.number)
			.forEach((number) -> System.out.println(number.en + ": " + number.mi));
	}
	
	private static Number[] getNumbersArray(){
		Number[] numbersArray = {
			new Number("one", "tahi"),
			new Number("two", "rua"),
			new Number("three", "toru"),
			new Number("four", "wha"),
			new Number("five", "rima"),
			new Number("six", "ono"),
			new Number("seven", "whitu"),
			new Number("eight", "waru"),
			new Number("nine", "iwa"),
			new Number("ten", "tekau")
		};
		return numbersArray;
	}
	
}

class Number {
	public String en;
	public String mi;
	
	public Number(String en, String mi){
		this.en = en;
		this.mi = mi;
	}
}

class IndexedNumber {
	public int index;
	public Number number;

	public IndexedNumber(int index, Number number){
		this.index = index;
		this.number = number;
	}
}