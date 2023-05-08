import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Stream;
import java.util.function.Predicate;
import java.util.function.Function;
import java.util.function.Consumer;

public class JavaVersion {
	
	private static int i=0;
	
	public static void main(String[] args){
		Number[] numbersArray = getNumbersArray();
		
		// https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html
		ArrayList<Number> numbersList = new ArrayList<Number>(Arrays.asList(numbersArray));

		// https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html
		Stream<Number> numbersStream = numbersList.stream();

		// https://docs.oracle.com/javase/8/docs/api/java/util/function/Function.html
		Function<Number,IndexedNumber> indexNumbers = getIndexMapHandler();
		
		// https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html#map-java.util.function.Function-
		Stream<IndexedNumber> indexedNumbersStream = numbersStream.map(indexNumbers);

		// https://docs.oracle.com/javase/8/docs/api/java/util/function/Predicate.html
		Predicate<IndexedNumber> filterOutEvens = getFilterHandler();
		
		// https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html#filter-java.util.function.Predicate-
		Stream<IndexedNumber> oddIndexedNumbersStream = indexedNumbersStream.filter(filterOutEvens);

		Function<IndexedNumber,Number> deindexNumbers = getDeindexMapHandler();

		Stream<Number> oddNumbersStream = oddIndexedNumbersStream.map(deindexNumbers);
		
		// https://docs.oracle.com/javase/8/docs/api/java/util/function/Consumer.html
		Consumer<Number> renderOddNumbers = getNumberRenderer();
		
		oddNumbersStream.forEach(renderOddNumbers);
		
		
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
	
	private static Predicate<IndexedNumber> getFilterHandler(){
		Predicate<IndexedNumber> predicate = new Predicate<IndexedNumber>(){
			@Override
			// https://docs.oracle.com/javase/8/docs/api/java/util/function/Predicate.html#test-T-
			public boolean test(IndexedNumber indexedNumber){
				return indexedNumber.index % 2 != 0;
			}
		};
		return predicate;
	}
	
	private static Function<Number,IndexedNumber> getIndexMapHandler(){
		return new Function<Number,IndexedNumber>(){
			@Override
			// https://docs.oracle.com/javase/8/docs/api/java/util/function/Function.html#apply-T-
			public IndexedNumber apply(Number number){
				return new IndexedNumber(++i, number);
			}
		};
	}		
	
	private static Function<IndexedNumber,Number> getDeindexMapHandler(){
		return new Function<IndexedNumber,Number>(){
			@Override
			public Number apply(IndexedNumber indexedNumber){
				return indexedNumber.number;
			}
		};
	}
	
	private static Consumer<Number> getNumberRenderer(){
		return new Consumer<Number>(){
			@Override
			// https://docs.oracle.com/javase/8/docs/api/java/util/function/Consumer.html#accept-T-
			public void accept(Number number){
				System.out.println(number.en + ": " + number.mi);
			}
		};
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