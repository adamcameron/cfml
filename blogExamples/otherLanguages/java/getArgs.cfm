<cfscript>
/*
import java.lang.management.ManagementFactory;
import java.lang.management.RuntimeMXBean;

import java.util.List;

public static void main(String[] args) {
  RuntimeMXBean bean = ManagementFactory.getRuntimeMXBean();
  List<String> aList = bean.getInputArguments();

  for (int i = 0; i < aList.size(); i++) {
    System.out.println( aList.get( i ) );
  }
  // print the non-JVM command line arguments using args
  // name of the main class
  System.out.println(" " + System.getProperty("sun.java.command"));
}
*/

bean = createObject("java", "java.lang.management.ManagementFactory").getRuntimeMXBean();
list = bean.getInputArguments();
writeDump(list);

	
</cfscript>