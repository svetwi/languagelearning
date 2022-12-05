
function trans(){
	let source = document.getElementById("toTrans").value.toLowerCase();
	if(source == "s1") 
		document.getElementById("transed").value = "a";
	else if(source == "s2")
		document.getElementById("transed").value ="b";
	else
		document.getElementById("transed").value = "zle si";
}
