/**
 * 주민번호 확인 egovframework validation
 * */
function checkIhIdNum(ihidnum){

	fmt = /^\d{6}[1234]\d{6}$/;
	if(!fmt.test(ihidnum)){
		return false;
	}

	birthYear = (ihidnum.charAt(7) <= "2") ? "19" : "20";
	birthYear += ihidnum.substr(0, 2);
	birthMonth = ihidnum.substr(2, 2) - 1;
	birthDate = ihidnum.substr(4, 2);
	birth = new Date(birthYear, birthMonth, birthDate);

	if( birth.getYear() % 100 != ihidnum.substr(0, 2) ||
	    birth.getMonth() != birthMonth ||
	    birth.getDate() != birthDate) {
	    return false;
	}

	var arrDivide = [2, 3, 4, 5, 6, 7, 8, 9, 2, 3, 4, 5];
	var checkdigit = 0;
	for(var i=0;i<ihidnum.length-1;i++){
		checkdigit += parseInt(ihidnum.charAt(i)) * parseInt(arrDivide[i]);
	}
	checkdigit = (11 - (checkdigit%11))%10;
	if(checkdigit != ihidnum.charAt(12)){
		return false;
	}else{
		return true;
	}
}