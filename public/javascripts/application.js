// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//<!-- start  java script for toggle effect -->
function toggle() {
	var ele = document.getElementById("toggleText");
	var text = document.getElementById("displayText");
	if(ele.style.display == "block") {
    		ele.style.display = "none";
  	}
	else {
		ele.style.display = "block";
	}
} 
//<!-- End  java script for toggle effect -->
