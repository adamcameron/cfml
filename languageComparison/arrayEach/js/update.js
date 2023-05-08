rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];

rainbow.forEach(
	function(v,i,a){
		a[i] = v.toUpperCase();
	}
);
console.log(rainbow);