<cfajaximport tags="cfwindow">
 
<script>
function makeWindow(ID) {
    var d = new Date();
    var curr_hour = d.getHours();
    var curr_min = d.getMinutes();
    var curr_sec = d.getSeconds();
    ColdFusion.Window.create(curr_hour + curr_min + curr_sec,"The Title","window.cfm?ID=" + ID,
    {center:true,modal:true,width:800,height:600,resizable:false});
}
</script>
 
<a href="##" onClick="makeWindow('MyWin')">Open Window</a>