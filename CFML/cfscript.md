# CFScript documentation

This attempts to document all of CFScript, as a resource for people migrating from old-school tag-based code to script-based code. The reason I am doing this is because neither ColdFusion nor Railo provide much (or in the case of Railo: _any_) useful [documentation of CFScript](https://wikidocs.adobe.com/wiki/display/coldfusionen/The+CFScript+language).

This is not a document for converting tags to script. It is not written from a point of view of "if you use ``<cfsometag>`` then you need to instead use [some script construct]". It simply documents CFScript. It does - however - set out how to perform all CFML functionality using CFScript. It is also not an exercise in teaching CFML (or at least the script part). It assumes you know what you're doing, and is purely a reference. I am contemplating another article / series of articles which teach CFML correctly (the various resources that exist to do this all take the wrong approach, and are a barrier to CFML uptake, IMO).

I assume Railo 4.2 or ColdFusion 11, except where stated.


### Comments
```cfc
// single line comment
```    

```cfc
a=1; // single line comment at end of line
```    
```cfc
/*
    multiple
    line
    comment
*/
```    
```cfc
/*
multiple line
/* comments */
cannot be nested
*/
```   

In this case, the commented bit is `/* multiple line /* comments */`, making the next bit a syntax error.

### Statements

Statements end in semi-colons:

    a = 1; 
   

Semi-colons are _generally_ optional on Railo:

    a = 1 
   

Where "generally" means "if the end of the statement is unambiguous without a semi-colon".

Block statements (with curly braces) do not have semi-colons:

    while(condtion){
    }
   

### Variables

Assigning a variable:

    varName = "foo";
   

Assigning a function-local variable:

```cfc
var varName = "foo"; // analogous to local.varName =  "foo";
```   

Note that the var keyword can appear inline in most statements where a variable is first initialised, eg:

    for (var i=1; i <= 10; i++);
   

Assigning a dynamically-named variable:

    varName = "foo";
    "#varName#" = "bar";
    writeOutput(foo); // bar
   

This is the same as with a `<cfset>` tag, but confuses some people due to it being slightly odd-looking. Obviously one can also use associative array syntax too (eg: variables[varName] = "bar";. This is preferable as it's more clear what's going on).

Defaulting a variable:

    param numeric variableName=defaultValue; // where "numeric" could be any type
   

For more complex situations:

    param name="variableName" type="regex" pattern="."; // any cfparam attribute is supported
   

### Operators

All operators available to tag-based code still work in CFScript. In addition, CFScript has these ones:

#### Decision

    a == 1; // equality
    a < 1; // less than
    a <= 1; // less-than-or-equal
    a >= 1; // greater-than-or-equal
    a > 1; // greater than
    a != 1; // inequality
    a <> 1; // inequality (Railo only)
   

#### Arithemetic

##### Increment/decrement

    // increment
    a = 1;
    b = a++; // b=1, a=2    // postfix operators returns value, then peforms action (in this case: increments a)
    c = ++a; // c=3, a=3    // prefix operator peforms action then returns result
<!-- break -->

    // decrement
    a--; // a=2
    --a; // a=1
   

##### Inline assignment

    a += 2; // equivalent to a=a+2
    a -= 3; // equivalent to a=a-3
    a *= 4; // equivalent to a=a*4
    a /= 5; // equivalent to a=a/5
    a %= 6; // equivalent to a=a%6
    s &= "a"; // equivalent to s = s & "a"
   

#### Boolean

    
    !a; // NOT a
    a && b; // a AND b
    a || b;    // a OR b
   

#### Decision

##### Ternary operator

    result = condition ? trueExpression : falseExpression;
    //eg:
    coinTossResult = randRange(0,1) ? "heads" : "tails";
<!-- break -->

    // NB: only one of trueExpression or falseExpression is evaluated:
    a = 1;
    b = 1;
    c = false ? ++a : ++b; // a=1, b=2, c=2
   

##### Null-coalescing variation

     
    result = left ?: right; // left-hand expression is used unless it is null, in which case the right one is used
    //eg:
    a = d ?: "default"; // a = default
<!-- break -->

    d = 1;
    a = d ?: "default"; // a = 1
   

### Conditions

#### if/elseif/else

    if (booleanExpression)
        // single statement executed if booleanExpression is true
    else if(anotherBooleanExpression)
        // single statement executed if anotherBooleanExpression is true
    else
        // single statement executed if condition(s) are false
<!-- break -->

    if (booleanExpression){
        // multiple statements executed if booleanExpression is true
    } else if(anotherBooleanExpression) {
        // multiple statements executed if anotherBooleanExpression is true
    } else {
        // multiple statements executed if condition(s) are false
    }
   

#### switch

    switch (expression){
        case "some constant value": // value can be dynamic on Railo
             // statements executed if expression = "some constant value"
        break; // exit switch statement
        case "a different constant value":
            // statements executed if expression = "a different constant value"
            // if there is no break, then processing continues to execute statements until a break is encountered...
            // ... but subsequent case evaluations are not made. A switch is basically a GOTO mechanism, which does a...
            // single GOTO the first matching case. It is NOT a series of if/elseif/else statements
        case "third constant value":
            // statements executed if expression = "a different constant value" or "third constant value"
        break;
        case "4th value":
             "5th value":
                // statements executed if expression is one of "4th value" or "5th value"
        break;
        default:
            // statements executed if no case was fulfilled (or if the last fulfilled case did not have a break)
        break;
    }
   

#### try/catch/finally, throw/rethrow

    try {
        // statements

        throw "message"; // throws an Application exception, with the given message
        // or
        throw(type="ExceptionType", message="message", detail="detail", errorCode="errorCode", extendedInfo="extendedInfo"); // despite appearances, this is NOT a function
        // or
        throw(object=JavaExceptionObject);

    }
    catch (SomeExceptionType variableContainingExceptionObject){
        // statements executed if code in try block errors with a SomeExceptionType exception

        rethrow; // rethrows the caught exception
    }
    catch (SomeOtherExceptionType variableCOntainingExceptionObject){
        // statements executed if code in try block errors with a SomeOtherExceptionType exception
    }
    catch (any variableCOntainingExceptionObject){
        // statements executed if code in try block errors with any not-yet-caught exception type
    }
    finally {
        // statements executed in any case, INCLUDING unhandled exceptions. This code ALWAYS runs
    }
   

### Iteration

#### General-purpose for loop

    for (initialisation; condition; repetition) statement;

or:

    for (initialisation; condition; repetition) {
        // statements
    }

EG:

    for (i=1; i <=5; i++) writeOutput(i); // just the following single statement is looped over
   

or:

    for (i=1; i <=5; i++) {
        // all statements within the block are looped over
        result = i * 2;
        writeOutput(result);
    }

The general perception is that this is the only form of a general-purpose for() loop: initialising a counter variable, testing it and adjusting it (increment, decrement). This is not the case. Each of the statements can be _anything_ (the condition needs to evaluate to a boolean), and indeed are optional. This is an endless loop, equivalent to while(true):

    for(;;)
   

A very contrived example to demonstrate the freedom one has with the parameters of the for():

    i=0;
    for(; true; writeOutput(i)){
        if (++i > 5) break;
    }
   

In general, all looping constructs have either the single-statement or block-of-statements syntax. I'll only offer the more common (and recommended, for code-clarity) block syntax henceforth.

#### Pre-condition loop

This form of loop evaluates a single condition at the beginning of each iteration, and continues to loop whilst the condition is true:

    while (condition) {
        // statements
    }
   

This form of loop will execute zero or more times.

#### Post-condition loop

This form of loop evaluates a single condition at the beginning of each iteration, and continues to loop whilst the condition is true:

    do { 
        // statements
    } while(condition);

This form of loop will execute _one_ or more times. It's important to consider that the body of the loop will always run the first time, because no condition is evaluated until the _end_ of the loop.

#### Array loop

##### For statement

    for (element in [1,2,3,4,5]){
        writeOutput(element); // 12345
    }

##### arrayEach()

    arrayEach(["a","b","c"], function(element,index,array){
        writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
    });

##### Array.each()

    a = ["a","b","c"];
    a.each(function(element,index,array){
        writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
    });

Note that Railo can call methods directly on a literal, so this works:

    ["a","b","c"].each(function(element,index,array){
        writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
    });

#### Struct loop

##### For statement

    struct = {a=1,b=2,c=3};
    for (key in struct){
        writeOutput("#key#:#struct[key]#;"); // a:1;b:2;c:3; (order of keys not guaranteed, obviously)
    }
   

##### structEach()

    structEach(struct, function(key,value,struct){
        writeOutput("#key#:#value#;"); // a:1;b:2;c:3;
    });

##### Struct.each()

    struct.each(function(key,value,struct){
        writeOutput("#key#:#value#;"); // a:1;b:2;c:3;
    });

#### Query loop

    q = queryNew("id,data", "integer,varchar",[
        [11, "aa"],
        [22, "bb"],
        [33, "cc"]
    ]);
    for (row in q){
        writeOutput("#q.currentRow#:#row.id#:#row.data#;"); // 1:11:aa;2:22:bb;3:33:cc;
    }

Using grouping:

    q = queryNew("pk,fk,data", "integer,integer,varchar",[
        [1, 10, "aa"],
        [2, 20, "bb"],
        [3, 20, "cc"],
        [4, 30, "dd"],
        [5, 30, "ee"],
        [6, 30, "ff"]
    ]);
    cfloop(query=q, group="fk"){
        writeOutput("<strong>#fk#</strong>");
        cfloop(){
            writeOutput("#pk#:#data#<br>");
        }
        writeOutput("<hr>");
    }

Railo only:

    loop query=q group="fk" {
        writeOutput("<strong>#fk#</strong>");
        loop {
            writeOutput("#pk#:#data#<br>");
        }
        writeOutput("<hr>");
    }

#### List loop

    list = "a;b;c";
    listEach(list, function(element,index,list){
        writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
    }, ";");

    // or

    list.each(function(element,index,list){
        writeOutput("#index#:#element#;"); // 1:a;2:b;3:c;
    }, ";");

    // or (ColdFusion only, see [RAILO-3207](https://issues.jboss.org/browse/RAILO-3207))

    for (element in "a,b,c,d,e"){
        writeOutput(element); // abcde
    }
   

I am not sure how one would specify a delimiter for the last example: it does not seem supported.

Railo only:

    cfloop(list="a;b;c", index="element", delimiters=";"){
        writeOutput(element); // abc
    }
    // or
    loop list="a;b;c" index="element" delimiters=";" {
        writeOutput(element); // abc
    }
   

#### File loop

    filePath = getCurrentTemplatePath();
    cfloop(file=filePath, index="chars", characters=16, charset="UTF-8"){
        writeOutput(chars); // outputs the contents of this file
    }
   

Railo only:

    loop file=filePath index="chars" characters=16 charset="UTF-8" {
        writeOutput(chars);
    }
   

#### Date/time range loop

ColdFusion has no specific CFScript-specific construct for this as of ColdFusion 11

Work around:

    from    = now();
    to        = dateAdd("d", 7, from);

    for(date=from; dateCompare(date, to, "d") <= 0; date = dateAdd("d", 1, date)){
        writeOutput(dateTimeFormat(date, "yyyy-mm-dd HH:nn:sstt") & "<br>");
    }
   

Railo only:

    cfloop(from=from, to=to, index="date", step=createTimespan(1,0,0,0)){
        writeOutput(dateTimeFormat(date, "yyyy-mm-dd HH:nn:sstt") & "<br>");
    }
    // or
    loop from=from to=to index="date" step=createTimespan(1,0,0,0){
        writeOutput(dateTimeFormat(date, "yyyy-mm-dd HH:nn:sstt") & "<br>");
    }
   

### Other flow control statements

#### Abort processing

    abort;
    // or
    abort "error message";
   

#### Exit from current file

    exit;
    //or
    exit "method";
   

### Code reuse

#### Include

    include "pathToFile";
    // or
    include "pathToFile" runonce=true;
   

#### Module

    // Railo
    module template="inc.cfm" attr1="val1" attr2="val2";

    // ColdFusion
    cfmodule(template="inc.cfm", attr1="val1", attr2="val2");
   

### Components / interfaces

    component {

    }

#### Attributes

    component extends="Parent" {

    }
   

Or:

    /**
    @extends Parent
    */
    component {

    }
   

Note that the comment for annotations is /** not simply /*.

Also note that the latter syntax does not currently work on Railo (see [RAILO-3169](https://issues.jboss.org/browse/RAILO-3169)).

#### Interface

    interface {
        public void function f(required numeric x); // note no braces, and ends with semi-colon
    }
   

#### Properties

Basic:

    property string myProperty;
   

With additional parameters:

    property type="string" name="myProperty" default="default value"; // and all the same attributes as `<cfproprty>`
   

#### Functions

Basic:

    function f(){ // assumes public function, returntype any

    }
   

With access and return type modifiers:

    private void function f(){

    }
   

#### Arguments

Basic:

    function f(x){ // optional argument of type "any"

    }
   

Type:

    function f(numeric x){ // optional argument of type "numeric"

    }
   

Required:

    function f(required numeric x){ // required argument of type "numeric"

    }
   

#### Function/argument annotations

    /**
    * @x.hint hint for argument x
    * @x.type numeric
    * @x.required true
    */
    function f(x){

    }
   

Note these annotations do not current correctly work on Railo (see [RAILO-3170](https://issues.jboss.org/browse/RAILO-3170))

Also note that this does not currently work on ColdFusion (see [3808960](https://bugbase.adobe.com/index.cfm?event=bug&id=3808960))

    /**
    * @x.type numeric
    * @x.default 0 // this causes a compile error
    */
    function f(x){
    }
   

#### Function expressions

    f = function(x){
    };
   

Functions defined by function expressions use closure, functions defined by a function statement do not

Annotations for function expressions are not supported on ColdFusion ([3808978](https://bugbase.adobe.com/index.cfm?event=bug&id=3808978)); are supported on Railo, but have same shortcomings as noted above.

#### Calling functions dynamically

    test = new Test();
    methodToCall = "f";
    argumentsToPass = {x=1};
    result = invoke(test, methodToCall, argumentsToPass);
   

Railo-only:

    result = test[methodToCall](argumentCollection=argumentsToPass);
   

#### Import

    import com.domain.app.package.*;
   

#### Object creation

    myObj = createObject(type, "path.to.class"); // along with other type/situation-specific arguments
    // or
    myObj = new path.to.some.cfc.file(); // NB: will call the CFC's init() (by default), or method identified by the initmethod attribute of the component (bug in Railo: [RAILO-2294](https://issues.jboss.org/browse/RAILO-2294)) 
   

### File system operations

#### Directories

    // simple directory creation
    directoryCreate("path/to/directory");
<!-- break -->

    // using other optional attributes
    cfdirectory(action="create", directory="path/to/directory", mode="777");
<!-- break -->

    // Railo only
    directory action="create" directory="path/to/directory" mode="777";
<!-- break -->

    // delete
    directoryDelete("path/to/directory");
<!-- break -->

    // list
    listing = directoryList("path/to/directory", true, "query", "*.cfm", "size desc"); // CF11 added an additional "type" attribute. Not currently supported on Railo
<!-- break -->

    // rename
    directoryRename("path/to/directory", "path/to/new/directory");
   

#### Files

    // read
    // text
    result = fileRead("path/to/file");
    // or
    fileHandle = fileOpen("path/to/file", "read");
    result = fileRead(fileHandle, bytesToRead);
    fileClose(fileHandle);
<!-- break -->

    // binary
    result = fileReadBinary("path/to/file");
    //or
    fileHandle = fileOpen("path/to/file", "readbinary");
    result = fileRead(fileHandle, bytesToRead);
<!-- break -->

    // append
    fileHandle = fileOpen("path/to/file", "append");
    fileWrite(fileHandle, textToAppend);
    fileClose(fileHandle);
<!-- break -->

    // copy
    fileCopy("path/to/file", "path/to/copyOfFile");

    // delete
    fileDelete("path/to/file");
<!-- break -->

    // move / rename
    fileMove("path/to/file", "new/path/to/file");
<!-- break -->

    // upload
    fileUpload("path/to/upload/file/to");
    fileUploadAll("path/to/upload/files/to");
<!-- break -->

    // write
    fileWrite("path/to/file", data);
    // or
    fileWrite(fileHandle, data);
   

### Database

#### Query

    // general form
    recordset = queryExecute(sqlString, params, options);
<!-- break -->

    // with params array
    numbers = queryExecute("
        SELECT    columns
        FROM    table
        WHERE    id BETWEEN ? AND ?
    ",
    [1,4],
    {
        datasource    ="myDsn",
        result        = "result"    // this is analogous to the result attribute of `<cfquery>`
    });
<!-- break -->

    // with params struct
    numbers = queryExecute("
        SELECT    columns
        FROM    table
        WHERE    id BETWEEN :low AND :high
    ",{low=2,high=3}
    );
   

For versions prior to ColdFusion 11 (in which queryExecute() was implemented), there is a CFC-based solution: [Query.cfc](https://wikidocs.adobe.com/wiki/display/coldfusionen/query). An example is as follows:

    numbers = new Query(
        sql            = "
            SELECT    columns
            FROM    table
            WHERE    id BETWEEN :low AND :high
        ",
        parameters    =[
            {name="low", value=2},
            {name="high", value=3}
        ]
    ).execute().getResult();
   

#### Stored Procedure

    cfstoredproc(procedure="procName") {
        cfprocparam(type="in", cfsqltype="cf_sql_varchat", value="someValue");
        cfprocresult(name="result");
    }
   
Railo only

    storedproc procedure="procName" {
        procparam type="in" cfsqltype="cf_sql_varchat" value="someValue";
        procresult name="result";
    }
   

There is a change request you should vote for, to implement this syntax:

    options = {
        datasource = "scratch_mssql",
        fetchclientinfo = true,
        returncode = true
    };
    params = [
        {value=URL.low, type="INTEGER"},
        {value=URL.high, type="INTEGER"},
        {type="out", variable="inclusiveCount", type="INTEGER"},
        {type="out", variable="exclusiveCount", type="INTEGER"}
    ];

    result = executeProcedure("uspGetColours", params, options);
   

See ColdFusion ticket: [3791737](https://bugbase.adobe.com/index.cfm?event=bug&id=3791737); Railo ticket: [RAILO-3184](https://issues.jboss.org/browse/RAILO-3184), and earlier blog article: '[ColdFusion 11: calling a stored procedure from script. And can we please stop wearing out our "c" and "f" keys?](http://blog.adamcameron.me/2014/03/coldfusion-11-calling-stored-procedure.html#executeProcedure)'.

#### Insert

Railo only:

    insert datasource="myDataSource" table="myTable" formFields="list,of,form,fields"; // arguments the same as `<cfinsert>`. datasource is optional
   

Note: there is a bug with this: [RAILO-3180](https://issues.jboss.org/browse/RAILO-3180).

ColdFusion only:

    cfinsert(datasource="myDataSource", table="myTable", formFields="list,of,form,fields"); // arguments the same as `<cfinsert>`
   

Note that datasource is currently required, which is a bug: [3814079](https://bugbase.adobe.com/index.cfm?event=bug&id=3814079).

#### Update

Railo only:

    update datasource="myDataSource" table="myTable" formFields="list,of,form,fields"; // arguments the same as `<cfupdate>`. datasource is optional
   

Note the same bug applies here as does with insert.

ColdFusion only:

    cfupdate(datasource="myDataSource", table="myTable", formFields="list,of,form,fields"); // arguments the same as `<cfupdate>`
   

#### DB Info

    cfdbinfo(type="tables", name="info"); // arguments the same as `<cfdbinfo>`
   

Railo only:

    dbinfo type="tables" name="info"; // arguments the same as `<cfdbinfo>`
   

#### Transactions

    transaction {
        try {
            // stuff to do
            transaction action="commit";
        }
        catch (any e){
            transaction action="rollback";    
        }
    }
   

Note that all attributes of `<cftransaction>` are supported as space-separated name/value pairs.

### Debugging

#### Dump

    writeDump(myVar); // can use either ordered or named arguments.  
   

#### Log

    writeLog("text to log"); // can use either ordered or named arguments.  
   

#### Trace

    // RAILO only
    trace category="test" text="trace text" { // plus all same params as `<cftrace>`
        // stuff to trace
    }
<!-- break -->

    // COLDFUSION only
    trace(category="test", text="trace text"){ // plus all same params as `<cftrace>`
        // stuff to trace
    }
    // note that CF11 incorrectly records timing information (see [3811003](https://bugbase.adobe.com/index.cfm?event=bug&id=3811003))
   

#### Timer

    
    cftimer(label="timer label" type="outline") { // plus all same params as `<cftimer>`
        // stuff to time
    }
<!-- break -->

    // RAILO only
    timer label="timer label" type="outline" { // plus all same params as `<cftimer>`
        // stuff to time
    }
   

### General / Miscellaneous

#### Output

    writeOutput(expression); // expression must resolve to a string
   

Railo only:

    echo(expression); // expression must resolve to a string
   

#### File Encoding

    pageencoding "UTF-8";
   

Note that this only works in CFC files on ColdFusion ([3712167](https://bugbase.adobe.com/index.cfm?event=bug&id=3712167)). It works correctly on Railo.

#### Save content

    savecontent variable="saved" {
        writeOutput("stuff to save");
    }
   

#### Threading

    thread action="run" name="threadName" {
        // code to run in separate thread here
    }
    thread action="join" name="threadName,anotherThreadName";
   

#### Locking

    lock name="lockName" timeout=1 throwontimeout=true {
        // code to lock
    }
   

#### Image / XLS manipulation

The function equivalents of [`<cfimage>`](https://wikidocs.adobe.com/wiki/display/coldfusionen/Image+functions) and [`<cfspreadsheet>`](https://wikidocs.adobe.com/wiki/display/coldfusionen/Spreadsheet+functions) are all well documented, and are not specifically CFScript constructs.

#### PDF Manipulation

I have to concede I have never ever done any work with PDFs, so cannot make an informed comment on the CFScript equivalents. However in lieu of particular CFScript-specific constructs that I am aware of, the generic syntax ought to work, eg:

ColdFusion:

    cfdocument(format="PDF"){
        // mark-up here
    }

   

    Railo:

    document format="PDF" {
        // mark-up here
    }

   
The same should work on other PDF-oriented tags. For versions of ColdFusion prior to CF11, there is a PDF.cfc (similar to Query.cfc, and also in cfusion/CustomTags/com/adobe/coldfusion). I have never used it, do not know how it works, and have no interest in finding out. If someone would like to donate some example code, I will integrate it here.

### Elements of tag-based CFML with no _specific_ CFScript implementation

#### CFC-based solutions

As far as I can tell,there is no CFScript-specific implement for the following pieces of functionality:

*   `<cfhttp>`
*   `<cfftp>`
*   `<cfpop>`
*   `<cfimap>`
*   `<cffeed>`
*   `<cfldap>`
*   `<cfcollection>`
*   `<cfindex>`
*   `<cfsearch>`

There a re CFC wrappers for these in cfusion/CustomTags/com/adobe/coldfusion. I have not used many of these, and the documentation is sparse.

#### The rest

To use any other functionality not listed here within CFScript, one needs to use the generalised syntax.

On Railo this is a matter of removing the "`<cf`" and the "`>`", and using normal block syntax (curly braces) where the tag-version is a block-oriented tag.

On ColdFusion, replace the "`<cf_tagname_`" with "`cf_tagname_(`", and the "`>`" with "`)`", and comma-separate the attributes. Note that this will make the construct _look_ like a function, but it actually is not, and cannot be used like a function, eg this is invalid syntax:

    result = cfhttp(method="post", url="http://example.com");
    
