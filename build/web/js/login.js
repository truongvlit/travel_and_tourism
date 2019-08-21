function validate() {
	var check = true;
	if (document.getElementById('user').value == '') {		
		document.getElementById('user').placeholder = "Username cannot be empty";
		document.getElementById('user').classList.add('formInvalid');
		check = false;
	}
	if (document.getElementById('pass').value == '') {		
		document.getElementById('pass').placeholder = "Password cannot be empty";
		document.getElementById('pass').classList.add('formInvalid');
		check = false;
	}
	return check;
}