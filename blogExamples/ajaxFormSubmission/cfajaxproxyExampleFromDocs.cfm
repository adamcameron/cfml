<!--- The cfajaxproxy tag creates a client-side proxy for the emp CFC. 
        View the generated page source to see the resulting JavaScript.  
        The emp CFC is in the components subdirectory of the directory that 
        contains this page. ---> 
<cfajaxproxy cfc="emp" jsclassname="emp"> 
 
<html> 
    <head> 
        <script type="text/javascript"> 
         
            // Function to find the index in an array of the first entry  
            // with a specific value. 
            // It is used to get the index of a column in the column list. 
            Array.prototype.findIdx = function(value){ 
                for (var i=0; i < this.length; i++) { 
                    if (this[i] == value) { 
                        return i; 
                    } 
                } 
            } 
 
            // Use an asynchronous call to get the employees for the  
            // drop-down employee list from the ColdFusion server. 
            var getEmployees = function(){ 
                // create an instance of the proxy.  
                var e = new emp(); 
                // Setting a callback handler for the proxy automatically makes 
                // the proxy's calls asynchronous. 
                e.setCallbackHandler(populateEmployees); 
                e.setErrorHandler(myErrorHandler); 
            // The proxy getEmployees function represents the CFC 
            // getEmployees function. 
                e.getEmployees(); 
            } 
             
            // Callback function to handle the results returned by the 
            // getEmployees function and populate the drop-down list. 
            var populateEmployees = function(res) 
            { 
                with(document.simpleAJAX){ 
                    var option = new Option(); 
                    option.text='Select Employee'; 
                    option.value='0'; 
                    employee.options[0] = option; 
                    for(i=0;i<res.DATA.length;i++){ 
                        var option = new Option(); 
                        option.text=res.DATA[i][res.COLUMNS.findIdx('FIRSTNAME')] 
                            + ' ' + res.DATA[i][[res.COLUMNS.findIdx('LASTNAME')]]; 
                        option.value=res.DATA[i][res.COLUMNS.findIdx('EMP_ID')]; 
                        employee.options[i+1] = option; 
                    } 
                }     
            } 
 
            // Use an asynchronous call to get the employee details. 
            // The function is called when the user selects an employee. 
            var getEmployeeDetails = function(id){ 
                var e = new emp(); 
                e.setCallbackHandler(populateEmployeeDetails); 
                e.setErrorHandler(myErrorHandler); 
            // This time, pass the employee name to the getEmployees CFC 
            // function. 
                e.getEmployees(id); 
            } 
            // Callback function to display the results of the getEmployeeDetails 
            // function. 
            var populateEmployeeDetails = function(employee) 
            { 
                var eId = employee.DATA[0][0]; 
                var efname = employee.DATA[0][1]; 
                var elname = employee.DATA[0][2]; 
                var eemail = employee.DATA[0][3]; 
                var ephone = employee.DATA[0][4]; 
                var edepartment = employee.DATA[0][5]; 
 
                with(document.simpleAJAX){ 
                    empData.innerHTML =  
                    '<span style="width:100px">Employee Id:</span>'  
                    + '<font color="green"><span align="left">'  
                    + eId + '</font></span><br>'  
                    + '<span style="width:100px">First Name:</span>'  
                    + '<font color="green"><span align="left">'  
                    + efname + '</font></span><br>'  
                    + '<span style="width:100px">Last Name:</span>'  
                    + '<font color="green"><span align="left">'      
                    + elname + '</font></span><br>'  
                    + '<span style="width:100px">Email:</span>' 
                    + '<font color="green"><span align="left">'  
                    + eemail + '</span></font><br>'  
                    + '<span style="width:100px">Phone:</span>'  
                    + '<font color="green"><span align="left">'  
                    + ephone + '</font></span><br>'  
                    + '<span style="width:100px">Department:</span>'  
                    + '<font color="green"><span align="left">'  
                    + edepartment + '</font></span>'; 
                } 
            } 
 
            // Error handler for the asynchronous functions. 
            var myErrorHandler = function(statusCode, statusMsg) 
            { 
                alert('Status: ' + statusCode + ', ' + statusMsg); 
            } 
             
        </script> 
    </head> 
 
    <body> 
        <!--- The form to display the employee drop-down list and  
        employee data. ---> 
        <form name="simpleAJAX" method="get"> 
        List of Employees:&nbsp;&nbsp;&nbsp; 
        <select name="employee" onChange="getEmployeeDetails(this.value)"> 
            <script language="javascript"> 
                getEmployees(); 
            </script> 
        </select> 
        <br><br> 
        <span id="empData"></span> 
        </form>     
    </body> 
</html>