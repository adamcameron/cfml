component {
    function countDownFrom(count) {
        var st = {count=count};
        local.c = closure() {
            return st.count--;
        };
        return c;
    }
}     


/*



component {
    function countDownFrom(count) {
        return closure() {
            return count--;
        };
    }
} 

    

component {
    function countDownFrom(count) {
        var iCount = count;
        c = closure() {
            return iCount--;
        };
        return c;
    }
}  
   
component {
    function countDownFrom(count) {
        c = closure() {
            return arguments.count--;
        };
        return c;
    }
} 


*/