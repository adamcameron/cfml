<cfscript>

    classInstance = java{
    public class class1{
          public int execute ()
          {

            int[] arr;
            arr = new int[5];

            arr[0] = 10;
            arr[1] = 20;

            arr[2] = 30;
            arr[3] = 40;
            arr[4] = 50;

            return arr.length;
        }

      }
    }
    writeoutput(classInstance.execute())

</cfscript>
