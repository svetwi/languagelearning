let translation1 = "trans1";
let translation2 = "trans2";
function trans(){
	let source = document.getElementById("toTrans").value;
	if(source == "source1") 
		document.getElementById("transed").value = translation1;
	else if(source == "source2")
		document.getElementById("transed").value = translation2;
	else
		document.getElementById("transed").value = "zle si";
}