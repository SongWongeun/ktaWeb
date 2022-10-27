//<![CDATA[
$(document).bind("mobileinit", function(){
	$.mobile.ajaxEnabled=false;
	$.mobile.pushStateEnabled = true;
	$.mobile.loadingMessageTextVisible = true;
	//$.mobile.dialog.prototype.options.closeBtnText = "닫기";
});

$(function(){
	var menuStatus;
	FnComWindowResize('');
	
	// Show menu
	$("a.showMenu").click(function(){
		if(menuStatus != true){	
			$("#container").animate({
				marginLeft: "0px",
			  }, 100, function(){menuStatus = true});
			$("#menu").show();
			  return false;
		} else {
			$("#container").animate({
				marginLeft: "0px",
			  }, 100, function(){menuStatus = false});
			$("#menu").hide();
			return false;
		  }
	});
});		

$(window).resize(function(){
	FnComWindowResize();
}).resize(); // 로딩되면서 창크기에 맞추기 위해 한 번 부름

var SEP_DATE	= '.';
var SEP_TIME	= ':';
var RowIdxMemo  = 0; // 메모에서 사용하는 그리드의 선택된 로우 구분 변수

var StringBuffer = function() {
	this.buffer = new Array();
};

StringBuffer.prototype.append = function(str) {
	this.buffer.push(str);
	return this;
};

StringBuffer.prototype.toString = function(){
	return this.buffer.join("");
};

function checkKey(){
	var clintName = navigator.appName;
	if ( clintName.indexOf("Netscape") != -1 ) {
		return false;
	}else{
		if(window.event.keyCode == 35){ // 백 스페이스 키
			return false;
		}
	}
}

/**
 * 윈도우 창이 리사이징 될때 창 크기를 조절한다.
 * @param resize_id
 */
function FnComWindowResize(resize_id){
	var width  = parseInt($(this).width());
	var height = parseInt($(this).height());
	$("#wrapper").text(width);
	var isBoolean = true;

	if( width > 500 ){
		isBoolean = false;
		if (width < 800) {
			$("body").removeClass("layout-1024 layout-1280").addClass("layout-800");
		} else if (width > 1024 && width < 1280) {
			$("body").removeClass("layout-1280 layout-800").addClass("layout-1024");
		} else if (width > 1280) {
			$("body").removeClass("layout-800 layout-1024").addClass("layout-1280");
		}
	}

	/*
	$("#rootOnlyTable").attr("style","width:100%;height:"+(height)+"px");
	*/
	$("#menu").attr("style","height:"+(height)+"px");
	$("#snbMenu").attr("style","height:"+(height)+"px");	
	
	if(!isBoolean){
		var width_str  = ((width*0.01)/3)*10+"";
		var bbb = width_str.split(".");
		$("#"+resize_id).attr("style","margin:auto; width:"+bbb[0]+"%;");
	}
}

/**
 * 
 * @param formName
 */
function isValid(formName){
	var obj = eval("document."+formName).elements;
	var isValid = true;
	
	for(var i=0; i<obj.length; i++){
		var datatype  = "";
		var datalength= "";
		var dataname  = "";
		var datavalue = "";
		var validChkFieldFind = obj[i].getAttribute("validYn");
		var required  = "";
		var objtype   = "";
		
		if(obj[i].disabled){
			continue;
		}
		
		if(validChkFieldFind=="Y"){
			datatype   = obj[i].getAttribute("datatype");
			datalength = obj[i].getAttribute("datalength");
			dataname   = obj[i].getAttribute("dataname");
			datavalue  = obj[i].value;
			required   = obj[i].getAttribute("isReq");
			objtype    = obj[i].type;

			if(dataname == null || dataname == ""){
				alert("해당 필드의 데이타명(dataname) 속성이 정의되어 있지 않습니다.");
				return false;
			}
			
			if(datatype == null || datatype == ""){
				alert("( "+ dataname + " )의 데이타타입(datatype) 속성이 존재 하지 않습니다.");
				return false;
			}
			
			if(datalength == null || datalength == ""){
				alert("( "+ dataname + " )의 데이타길이(datalength) 속성이  존재 하지 않습니다.");
				return false;
			}
			
			if(required == null || required == ""){
				alert("( "+ dataname + " )의 필수여부(required) 속성이 존재 하지 않습니다.");
				return false;
			}
			
			// ### 필수여부 체크 
			if(required=="Y"){
				isValid = false;
				if(objtype=="radio" || objtype=="checkbox"){
					if( obj[i].name.length ){
						var isname = eval("document."+formName+"."+obj[i].name);
						for(var j=0; j<isname.length; j++){
							if(isname[j].checked){
								isValid = true;
								break;
							}
						}
					}
				}else {
					if(!isEmpty(datavalue)){
						isValid = true;
					}else{
						isValid = false;
					}
				}
			}
			
			if( !isValid ){
				alert("[ "+ dataname + " ]은(는) 필수항목입니다.");
				obj[i].focus();
				return false;
			}

			// 데이터 길이 체크
			if( fnByteLength(datavalue) > datalength){
				isValid = false;
			}else{
				isValid = true;
			}
			if( !isValid ){
				alert("[ "+ dataname + " ]은(는) 최대 입력 길이가 "+datalength+"Byte 입니다.\n입력 된 길이["+fnByteLength(datavalue)+"Byte]\n\n\n※ 한글의 경우 한글자는 2byte로 계산됩니다.");
				obj[i].focus();
				//obj[i].select();
				obj[i].value="";
				return false;
			}

			if(!isEmpty(datavalue)){
				// 데이타 타입 체크
				if(objtype=="text" || objtype=="textarea"){
					isValid = false;
					
					if(datatype=="integer"){
						datavalue = deleteCommaStr(datavalue);
						isValid   = isInteger(datavalue);	
					}else if(datatype=="number"){
						datavalue = deleteCommaStr(datavalue);
						isValid   = isNumber(datavalue);
					}else if(datatype=="string"){ //isInteger
						isValid = true;
					}else if(datatype=="email"){
						isValid   = isEmail(datavalue);
					}else if(datatype=="date"){
						datavalue = deleteDateFormatStr(datavalue);
						isValid   = isDate(datavalue);
					}else if(datatype=="hphone" || datatype=="mphone"){
						isValid   = isNumber(datavalue);
					}else if(datatype=="juminno"){
						datavalue = deleteJuminNoFormatStr(datavalue);
						isValid   = isJuminNo(datavalue);
					}else if(datatype=="actntno"){
						datavalue = deleteActntNoStr(datavalue);
						isValid   = isActntNo(datavalue);
						
					}else if(datatype=="ktatime"){
						datavalue = deleteTimeStr(datavalue);
						isValid   = isTime(datavalue);
						
					}else if(datatype=="postno"){
						datavalue = deletePostNoStr(datavalue);
						isValid   = isPost(datavalue);
					}
				}
				if( !isValid ){
					alert("[ "+ dataname + " ]의 데이타 타입 형식이 올바르지 않습니다.");
					obj[i].focus();
					obj[i].value="";
					//obj[i].select();
					return false;
				}
			}

		}
	}
	
	return isValid;
}

/**
 * 
 * @param formName
 */
function isValid1(formName, frmPart){
	var obj = eval("document."+formName).elements;
	var isValid = true;
	
	for(var i=0; i<obj.length; i++){
		var datatype  ="";
		var datalength="";
		var dataname  ="";
		var datavalue ="";
		var validChkFieldFind=obj[i].getAttribute("validYn");
		var required="";
		var objtype ="";
		if(obj[i].disabled){
			continue;
		}
		if(validChkFieldFind==frmPart){
			datatype   = obj[i].getAttribute("datatype");
			datalength = obj[i].getAttribute("datalength");
			dataname   = obj[i].getAttribute("dataname");
			datavalue  = obj[i].value;
			required   = obj[i].getAttribute("isReq");
			objtype    = obj[i].type;

			if(dataname == null || dataname == ""){
				alert("해당 필드의 데이타명(dataname) 속성이 정의되어 있지 않습니다.");
				return false;
			}

			if(datatype == null || datatype == ""){
				alert("( "+ dataname + " )의 데이타타입(datatype) 속성이 존재 하지 않습니다.");
				return false;
			}
			
			if(datalength == null || datalength == ""){
				alert("( "+ dataname + " )의 데이타길이(datalength) 속성이  존재 하지 않습니다.");
				return false;
			}
			
			if(required == null || required == ""){
				alert("( "+ dataname + " )의 필수여부(required) 속성이 존재 하지 않습니다.");
				return false;
			}

			// ### 필수여부 체크 
			if(required=="Y"){
				isValid = false;
				if(objtype=="radio" || objtype=="checkbox"){
					if( obj[i].name.length ){
						var isname = eval("document."+formName+"."+obj[i].name);
						for(var j=0; j<isname.length; j++){
							if(isname[j].checked){
								isValid = true;
								break;
							}
						}
					}
				}else {
					if(!isEmpty(datavalue)){
						isValid = true;
					}else{
						isValid = false;
					}
				}
			}
			
			if( !isValid ){
				alert("[ "+ dataname + " ]은(는) 필수항목입니다.");
				obj[i].focus();
				return false;
			}

			// 데이터 길이 체크
			if( fnByteLength(datavalue) > datalength){
				isValid = false;
			}else{
				isValid = true;
			}

			if(!isValid){
				alert("[ "+ dataname + " ]은(는) 최대 입력 길이가 "+datalength+"Byte 입니다.\n입력 된 길이["+fnByteLength(datavalue)+"Byte]\n\n\n※ 한글의 경우 한글자는 2byte로 계산됩니다.");
				obj[i].focus();
				obj[i].value="";
				return false;
			}
			
			if(!isEmpty(datavalue)){
				// 데이타 타입 체크
				if(objtype=="text" || objtype=="textarea"){
					isValid = false;
					
					if(datatype=="integer"){
						datavalue = deleteCommaStr(datavalue);
						isValid   = isInteger(datavalue);	
					}else if(datatype=="number"){
						datavalue = deleteCommaStr(datavalue);
						isValid   = isNumber(datavalue);
					}else if(datatype=="string"){ //isInteger
						isValid = true;
					}else if(datatype=="email"){
						isValid   = isEmail(datavalue);
					}else if(datatype=="date"){
						datavalue = deleteDateFormatStr(datavalue);
						isValid   = isDate(datavalue);
					}else if(datatype=="hphone" || datatype=="mphone"){
						isValid   = isNumber(datavalue);
					}else if(datatype=="juminno"){
						datavalue = deleteJuminNoFormatStr(datavalue);
						isValid   = isJuminNo(datavalue);
					}else if(datatype=="actntno"){
						datavalue = deleteActntNoStr(datavalue);
						isValid   = isActntNo(datavalue);
						
					}else if(datatype=="ktatime"){
						datavalue = deleteTimeStr(datavalue);
						isValid   = isTime(datavalue);
						
					}else if(datatype=="postno"){
						datavalue = deletePostNoStr(datavalue);
						isValid   = isPost(datavalue);
					}
				}
				if( !isValid ){
					alert("[ "+ dataname + " ]의 데이타 타입 형식이 올바르지 않습니다.");
					obj[i].focus();
					obj[i].value="";
					return false;
				}
			}

		}
	}
	
	return isValid;
}
function FnFormClear(formName){
	var obj = eval("document."+formName).elements;
	for(var i=0; i<obj.length; i++){
		var isInit = obj[i].getAttribute("isInit");
		if(isInit=="true"){
			obj[i].value = "";
		}
	}
}
function FnMakeObject(formName){
	var obj = eval("document."+formName).elements;
	var datatype  ;
	var datalength;
	var dataname  ;
	var datavalue ;
	var validChkFieldFind;
	var required;
	var isValid = false;
	var objtype ;

	for(var i=0; i<obj.length; i++){
		validChkFieldFind = obj[i].getAttribute("validYn");
		datatype   = obj[i].getAttribute("datatype");
		datalength = obj[i].getAttribute("datalength");
		dataname   = obj[i].getAttribute("dataname");
		datavalue  = obj[i].value;
		required   = obj[i].getAttribute("isReq");
		objtype    = obj[i].type;
		if(validChkFieldFind=="Y"){
			if(objtype=="text" || objtype=="textarea"){
				if(datatype=="integer"){
					datavalue = addCommaStr(datavalue);
					
				}else if(datatype=="number"){
					datavalue = addCommaStr(datavalue);
				}else if(datatype=="string"){ //isInteger

				}else if(datatype=="email"){

				}else if(datatype=="date"){
					datavalue = addDateFormatStr(datavalue);
					
				}else if(datatype=="hphone" || datatype=="mphone"){
					
				}else if(datatype=="juminno"){
					datavalue = addJuminNoFormatStr(datavalue);
					
				}else if(datatype=="actntno"){
					datavalue = addActntNoStr(datavalue);
					
				}else if(datatype=="ktatime"){
					datavalue = addTimeStr(datavalue);

				}else if(datatype=="postno"){
					datavalue = addPostNoStr(datavalue);
				}
			}
			obj[i].value = datavalue;
		}
	}
}
function FnMakeObject1(formName,formPart){
	var obj = eval("document."+formName).elements;
	var datatype  ;
	var datalength;
	var dataname  ;
	var datavalue ;
	var validChkFieldFind;
	var required;
	var isValid = false;
	var objtype ;

	for(var i=0; i<obj.length; i++){
		validChkFieldFind = obj[i].getAttribute("validYn");
		datatype   = obj[i].getAttribute("datatype");
		datalength = obj[i].getAttribute("datalength");
		dataname   = obj[i].getAttribute("dataname");
		datavalue  = obj[i].value;
		required   = obj[i].getAttribute("isReq");
		objtype    = obj[i].type;
		if(validChkFieldFind==formPart){
			if(objtype=="text" || objtype=="textarea"){
				if(datatype=="integer"){
					datavalue = addCommaStr(datavalue);
					
				}else if(datatype=="number"){
					datavalue = addCommaStr(datavalue);
				}else if(datatype=="string"){ //isInteger

				}else if(datatype=="email"){

				}else if(datatype=="date"){
					datavalue = addDateFormatStr(datavalue);
					
				}else if(datatype=="hphone" || datatype=="mphone"){
					
				}else if(datatype=="juminno"){
					datavalue = addJuminNoFormatStr(datavalue);
					
				}else if(datatype=="actntno"){
					datavalue = addActntNoStr(datavalue);
					
				}else if(datatype=="ktatime"){
					datavalue = addTimeStr(datavalue);

				}else if(datatype=="postno"){
					datavalue = addPostNoStr(datavalue);
				}
			}
			obj[i].value = datavalue;
		}
	}
}
function FnDeleteObject(formName){
	var obj = eval("document."+formName).elements;
	var datatype  ="";
	var datavalue ="";
	var validChkFieldFind="";
	var objtype ="";

	for(var i=0; i<obj.length; i++){
		validChkFieldFind = obj[i].getAttribute("validYn");
		datatype   = obj[i].getAttribute("datatype");
		datavalue  = obj[i].value;
		objtype    = obj[i].type;
		if(validChkFieldFind == "Y"){
			if(objtype=="text" || objtype=="textarea"){
				if(datatype=="integer"){
					datavalue = deleteCommaStr(datavalue);
				}else if(datatype=="number"){
					datavalue = deleteCommaStr(datavalue);
					
				}else if(datatype=="string"){ //isInteger

				}else if(datatype=="email"){

				}else if(datatype=="date"){
					datavalue = deleteDateFormatStr(datavalue);
				}else if(datatype=="hphone" || datatype=="mphone"){
					
				}else if(datatype=="juminno"){
					datavalue = deleteJuminNoFormatStr(datavalue);
					
				}else if(datatype=="actntno"){
					datavalue = deleteActntNoStr(datavalue);
					
				}else if(datatype=="ktatime"){
					datavalue = deleteTimeStr(datavalue);
					
				}else if(datatype=="postno"){
					datavalue = deletePostNoStr(datavalue);
				}
			}
			obj[i].value = datavalue;
		}
	}
}
function FnDeleteObject1(formName,formPart){
	var obj = eval("document."+formName).elements;
	var datatype  ="";
	var datavalue ="";
	var validChkFieldFind="";
	var objtype ="";

	for(var i=0; i<obj.length; i++){
		validChkFieldFind = obj[i].getAttribute("validYn");
		datatype   = obj[i].getAttribute("datatype");
		datavalue  = obj[i].value;
		objtype    = obj[i].type;
		if(validChkFieldFind == formPart){
			if(objtype=="text" || objtype=="textarea"){
				if(datatype=="integer"){
					datavalue = deleteCommaStr(datavalue);
				}else if(datatype=="number"){
					datavalue = deleteCommaStr(datavalue);
					
				}else if(datatype=="string"){ //isInteger

				}else if(datatype=="email"){

				}else if(datatype=="date"){
					datavalue = deleteDateFormatStr(datavalue);
				}else if(datatype=="hphone" || datatype=="mphone"){
					
				}else if(datatype=="juminno"){
					datavalue = deleteJuminNoFormatStr(datavalue);
					
				}else if(datatype=="actntno"){
					datavalue = deleteActntNoStr(datavalue);
					
				}else if(datatype=="ktatime"){
					datavalue = deleteTimeStr(datavalue);
					
				}else if(datatype=="postno"){
					datavalue = deletePostNoStr(datavalue);
				}
			}
			obj[i].value = datavalue;
		}
	}
}

function isNumber(num) {
	var notNumberPattern    = /[^0-9.-]/;
	var twoDotPattern       = /[0-9]*[.][0-9]*[.][0-9]*/;
	var twoMinusPattern     = /[0-9]*[-][0-9]*[-][0-9]*/;
	var validRealPattern    = /^([-]|[.]|[-.]|[0-9])[0-9]*[.]*[0-9]+$/;
	var validIntegerPattern = /^([-]|[0-9])[0-9]*$/;
	var validNumberPattern  = /(^([-]|[.]|[-.]|[0-9])[0-9]*[.]*[0-9]+$)|(^([-]|[0-9])[0-9]*$)/;

	num = rtrim(num);
	return  !notNumberPattern.test(num) &&
			!twoDotPattern.test(num)    &&
			!twoMinusPattern.test(num)  &&
			validNumberPattern.test(num);
}

/**
 * ltrim
 *
 * @param   text
 * @return  string
 */
function ltrim(text) {
	if (text == "") {
		return  text;
	}

	var len = text.length;
	var st  = 0;

	while ((st < len) && (text.charAt(st) <= ' ')) {
		st++;
	}

	return  (st > 0) ? text.substring(st, len) : text;
}

/**
 * rtrim
 *
 * @param   text
 * @return  string
 */
function rtrim(text) {
	if (text == "") {
		return  text;
	}

	var len = text.length;
	var st  = 0;

	while ((st < len) && (text.charAt(len - 1) <= ' ')) {
		len--;
	}

	return  (len < text.length) ? text.substring(st, len) : text;
}

/**
 * trim
 *
 * @param   text
 * @return  string
 */
function trim(text) {
	if (text == "") {
		return  text;
	}

	var len = text.length;
	var st  = 0;

	while ((st < len) && (text.charAt(st) <= ' ')) {
		st++;
	}

	while ((st < len) && (text.charAt(len - 1) <= ' ')) {
		len--;
	}

	return  ((st > 0) || (len < text.length)) ? text.substring(st, len) : text;
}

function lpad(str, num, padstr) {
	if (isEmpty(padstr)) {
		return str;
	}

	var tempstr = "";
	for (var i=0; i<num; i++) {
		tempstr += padstr;
	}

	tempstr += str;

	return  tempstr.substring(tempstr.length - num, tempstr.length);
}

function lpadObj(obj, num, padstr) {
	if (isEmpty(padstr)) {
		return str;
	}

	var tempstr = "";
	for (var i=0; i<num; i++) {
		tempstr += padstr;
	}

	tempstr += obj.value;
	
	obj.value = tempstr.substring(tempstr.length - num, tempstr.length);
	//return  tempstr.substring(tempstr.length - num, tempstr.length);
}

/*
 * 문자값이 존재하는 지에 대해 검사하는 함수
 * @param   str
 * @return  boolean
 */
function isEmpty(str) {
	if (str == null || trim(str) == "" || typeof str == 'undefined') {
		return  true;
	}
	return  false;
}
/**
 * 문자열의 byte length를 얻는다.
 *
 * @param   str 문자열
 * @return  byte length
 */
function fnByteLength(str) {
	if (str == "") {
		return  0;
	}

	var len = 0;

	for (var i = 0; i < str.length; i++) {
		if (str.charCodeAt(i) > 128) {
			len++;
		}
		len++;
	}

	return  len;
}
/**
 * 정수 체크
 *
 * 1. +, - 부호를 생략하거나 넣을 수 있다 : ^[\+-]?
 * 2. 0에서 9까지 숫자가 0번 이상 올 수 있다 : [0-9]*
 * 3. 마지막은 숫자로 끝나야 한다 : [0-9]$
 *
 * @param   num
 * @return  boolean
 */
function isInteger(num) {
	var re  = /^[\+-]?[0-9]*[0-9]$/;

	if (re.test(num)) {
		return  true;
	}

	return  false;
}

/**
 * 숫자에서 comma를 없앤다.
 *
 * @param   str
 */
function deleteCommaStr(str) {
	var temp    = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == ',') {
			continue;
		} else {
			temp    += str.charAt(i);
		}
	}

	return  temp;
}
/**
 * 이메일 체크
 *
 * @param   email
 * @return  boolean
 */
function isEmail(email) {
	re  = /^[_a-zA-Z0-9-\\.]+@[A-Za-z0-9_-]+[.]+[A-Za-z]+/;
	
	if (re.test(email)) {
		return  true;
	}

	return  false;
}
/**
*   전화, 핸드폰 번호에 맞는 양식인지 확인한다.
**/
function isPhone(str)
{
	//var str = obj.value;
	 
	// 0-0, 00-000, 0000-00-00000, ... 같은 형태의 정규식.  ^는 입력의 시작, $는 입력의 끝을 나타낸다
	var NumberHypenPattern = /^[0-9]+([-][0-9]+)+$/; 
	 
	str = trim(str);
	var sExpression = new String(str);
	 
	if (sExpression.search(NumberHypenPattern) == -1  &&  str != ""){
		return false;
	}
	 
	return true;
}
/**
 * 날짜 포멧
 *
 * @param   str
 */
function deleteDateFormatStr(str) {
	var temp    = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == SEP_DATE) {
			continue;
		} else {
			temp    += str.charAt(i);
		}
	}

	return  temp;
}
/**
 * 날짜 체크
 *
 * @param   date
 * @return  boolean
 */
function isDate(date) {
	if (date == null || date.length != 8) {
		return  false;
	}

	if (!isNumber(date)) {
		return  false;
	}

	var year    = eval(date.substring(0, 4));
	var month   = eval(date.substring(4, 6));
	var day     = eval(date.substring(6, 8));

	if (month > 12) {
		return  false;
	}

	var totalDays;

	switch (eval(month)) {
		case 1 :
			totalDays   = 31;
			break;
		case 2 :
			if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) {
				totalDays   = 29;
			} else {
				totalDays   = 28;
			}
			break;
		case 3 :
			totalDays   = 31;
			break;
		case 4 :
			totalDays   = 30;
			break;
		case 5 :
			totalDays   = 31;
			break;
		case 6 :
			totalDays   = 30;
			break;
		case 7 :
			totalDays   = 31;
			break;
		case 8 :
			totalDays   = 31;
			break;
		case 9 :
			totalDays   = 30;
			break;
		case 10 :
			totalDays   = 31;
			break;
		case 11 :
			totalDays   = 30;
			break;
		case 12 :
			totalDays   = 31;
			break;
	}

	if (day > totalDays) {
		return  false;
	}

	return  true;
}

/**
 * 숫자에 comma를 붙인다.
 *
 * @param   obj
 */
function addComma(formName, objectName) {
	var obj  = eval("document."+formName+"."+objectName);
	obj.value   = trim(obj.value);
	var value   = obj.value;

	if (value == "") {
		return;
	}

	value   = deleteCommaStr(value);

	if (!isFloat(value)) {
		dispName    = obj.getAttribute("dataname");

		if (dispName == null) {
			dispName    = "";
		}

		alert("["+dispName + "]의 데이터 타입 형식이 올바르지 않습니다.");
		obj.value   = "0";
		obj.focus();
		//obj.value="";
		if (window.event) {
			window.event.returnValue    = false;
		}

		return;
	}

	obj.value   = addCommaStr(value);
}
/**
 * 숫자에 comma를 붙인다.
 *
 * @param   str
 * @param   len 소수점 아래자리까지 표현
 */
function addCommaStr(str, len) {
	var rxSplit = new RegExp('([0-9])([0-9][0-9][0-9][,.])');
	var zero    = "0000000000";
	if (len > 0 && str == Math.ceil(str)) {
		if (str > 0) {
			str += ".";
		}
	}

	if ((typeof str) == "number") {
		str += "";
	}

	var arrNumber   = str.split('.');
	arrNumber[0]    += '.';
	do {
		arrNumber[0]    = arrNumber[0].replace(rxSplit, '$1,$2');
	} while (rxSplit.test(arrNumber[0]));

	if (arrNumber.length > 1) {
		if (arrNumber[1].length < len) {
			arrNumber[1]    += zero.substring(0, (len - arrNumber[1].length));
		}

		replaceStr  = arrNumber.join("");
	} else {
		replaceStr  = arrNumber[0].split(".")[0];
	}

	return  replaceStr;
}
function deleteComma(formName, objectName) {
	var obj  = eval("document."+formName+"."+objectName);
	obj.value   = deleteCommaStr(obj.value);
}
/**
 * 유리수 체크
 *
 * 1. +, - 부호를 생략하거나 넣을 수 있다 : ^[\+-]?
 * 2. 0에서 9까지 숫자가 0번 이상 올 수 있다 : [0-9]*
 * 3. 소수점을 넣을 수 있다 : [.]?
 * 4. 소수점 이하 자리에 0에서 9까지 숫자가 올 수 있다 : [0-9]*
 * 5. 마지막은 숫자로 끝나야 한다 : [0-9]$
 *
 * @param   num
 * @return  boolean
 */
function isFloat(num) {
	re  = /^[\+-]?[0-9]*[.]?[0-9]*[0-9]$/;

	if (re.test(num)) {
		return  true;
	}

	return  false;
}

/**
 * 날짜 포멧
 *
 * @param   obj
 */
function deleteDateFormat(obj) {
	obj.value   = deleteDateFormatStr(obj.value);
}
/**
 * 날짜 포멧
 *
 * @param   str
 */
function addDateFormatStr(str) {
	if (str == "" || str == "null"){
		return  "";    // ""인경우 '--'로 출력되는것을 방지.
	}else{
		if(str.length==8){
			return  str.substring(0, 4) + SEP_DATE +    str.substring(4, 6) + SEP_DATE +    str.substring(6, 8);
		}else{
			return "";
		}
		
	}
		

	
}
/**
 * 날짜 포멧
 *
 * @param   obj
 */
function addDateFormat(obj) {
	//var obj  = eval("document."+formName+"."+objectName);
	var value   = obj.value;

	if (trim(value) == "") {
		return;
	}

	value   = deleteDateFormatStr(value);
	if (value.length == 4) {
		value	= (new Date()).getFullYear() + value;
	}
	if (!isDate(value)) {
		dispName    = obj.getAttribute("dataname");

		if (dispName == null) {
			dispName    = "";
		}

		alert("["+dispName + "]의 데이타타입 형식이 올바르지 않습니다.");
		obj.focus();
		obj.value="";
		return;
	}

	obj.value   = addDateFormatStr(value);
}
/**
 * 법인번호에 "-"를 붙인다.
 *
 * @param   obj
 */
function addCorpNoFormat(formName, objectName) {
	var obj  = eval("document."+formName+"."+objectName);
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteCorpNoFormatStr(value);

	if (!isCorpNo(value)) {
		dispName = obj.getAttribute("dataname");

		if (dispName == null) {
			dispName = "";
		}

		alert("["+dispName + "]의 데이타타입 형식이 올바르지 않습니다.");
		obj.focus();
		obj.value="";
		if (window.event) {
			window.event.returnValue = false;
		}

		return;
	}

	obj.value = addCorpNoFormatStr(value);
}
/**
 * 법인번호에 "-"를 붙인다.
 *
 * @param   str
 */
function addCorpNoFormatStr(str) {
	return  str.substring(0, 6) + "-" + str.substring(6);
}
/**
 * 법인번호에서 "-"를 없앤다.
 *
 * @param   str
 */
function deleteCorpNoFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == '-') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return  temp;
}
/**
 * 법인번호에서 "-"를 없앤다.
 *
 * @param   obj
 */
function deleteCorpNoFormat(formName, objectName) {
	var obj  = eval("document."+formName+"."+objectName);
	obj.value = deleteCorpNoFormatStr(obj.value);
}

/**
 * 주민번호 형식인지 체크 한다.
 *
 * @param   str
 * @return  boolean
 */
function isJuminNo(str) {
	var tmp = 0;
	var sex = str.substring(6, 7);
	var birthday;

	if (str.length != 13) {
		return  false;
	}

	if (str == "1111111111111") {
		return  true;
	}

	if (sex == 1 || sex == 2) {
		birthday = "19" + str.substring(0, 6);
	} else if (sex == 3  || sex == 4) {
		birthday = "20" + str.substring(0, 6);
	} else if (sex == 5) {
		return true;
	} else {
		return  false;
	}

	if (!isDate(birthday)) {
		return  false;
	}

	for (var i = 0; i < 12 ; i++) {
		tmp = tmp + ((i%8+2) * parseInt(str.substring(i,i+1)));
	}

	tmp = 11 - (tmp %11);
	tmp = tmp % 10;

	if (tmp != str.substring(12, 13)) {
		return  false;
	}

	return  true;
}
/**
 * 주민번호에 "-"를 붙인다.
 *
 * @param   obj
 */
function addJuminNoFormat(obj) {
	//var obj  = eval("document."+formName+"."+objectName);
	var value = obj.value;

	if (trim(value) == "") {
		return;
	}

	value = deleteJuminNoFormatStr(value);

	if (!isJuminNo(value)) {
		dispName = obj.getAttribute("dataname");

		if (dispName == null) {
			dispName = "";
		}

		alert("["+dispName + "]의 데이타타입 형식이 올바르지 않습니다.");
		obj.value = "";
		obj.focus();
		obj.value="";

		if (window.event) {
			window.event.returnValue = false;
		}

		return;
	}

	obj.value = addJuminNoFormatStr(value);
}
/**
 * 주민번호에서 "-"를 없앤다.
 *
 * @param   obj
 */
function deleteJuminNoFormat(obj) {
	//var obj  = eval("document."+formName+"."+objectName);
	obj.value = deleteJuminNoFormatStr(obj.value);
}
/**
 * 주민번호에서 "-"를 없앤다.
 *
 * @param   str
 */
function deleteJuminNoFormatStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == '-') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}

	return  temp;
}
/**
 * 주민번호에 "-"를 붙인다.
 *
 * @param   str
 */
function addJuminNoFormatStr(str) {
	return  str.substring(0, 6) + "-" + str.substring(6, 13);
}

/**
 * 사고번호에 "-"를 삭제한다.
 * @param str
 * @returns {String}
 */
function deleteActntNoStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == '-') {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}
	return  temp;
}
function deleteActntNoObj(obj) {
	var actntNo = deleteActntNoStr(obj.value);
	obj.value = actntNo;
}

/**
 * 사고번호에 "-"를 붙인다.
 *
 * @param   str
 */
function addActntNoStr(str) {
	if(str.length < 1){
		return "";
	}
	return  str.substring(0, 4) + "-" + str.substring(4, 9);
}
/**
 * 사고번호에 "-"를 붙인다.
 *
 * @param   str
 */
function addActntNoObj(obj) {
	var _value = obj.value;
	if(_value.length>0){
		if( !isActntNo(_value) ){
			obj.value = "";
			obj.focus();
			alert("테이터 타입이 올바르지 않습니다.");
			return;
		}
		var actntNo = addActntNoStr(_value);
		obj.value = actntNo;
	}
}

/**
 * 사고번호 자리수 체크
 * @param str
 * @returns {Boolean}
 */
function isActntNo(str) {
	if(str.length>0){
		if(isNumber(str)){
			if (str.length==9) {
				return  true;
			}else{
				return  false;
			}
		}else{
			return  false;
		}
	}
}


function deleteActntNoObj(obj) {
	var actntNo = deleteActntNoStr(obj.value);
	obj.value = actntNo;
}

/**
 * 사고번호에 "-"를 붙인다.
 *
 * @param   str
 */
function addActntNoStr(str) {
	if(str.length < 1){
		return "";
	}
	return  str.substring(0, 4) + "-" + str.substring(4, 9);
}
/**
 * 사고번호에 "-"를 붙인다.
 *
 * @param   str
 */
function addActntNoObj(obj) {
	var _value = obj.value;
	if(_value.length>0){
		if( !isActntNo(_value) ){
			obj.value = "";
			obj.focus();
			alert("테이터 타입이 올바르지 않습니다.");
			return;
		}else{
			var actntNo = addActntNoStr(_value);
			obj.value = actntNo;
		}
	}
}

/**
 * 사고번호 자리수 체크
 * @param str
 * @returns {Boolean}
 */
function isActntNo(str) {
	if(str.length>0){
		if(isNumber(str)){
			if (str.length==9) {
				return  true;
			}else{
				return  false;
			}
		}else{
			return  false;
		}
	}
}

function isPost(str){
	if(!isNumber(str)){
		return false;
	}
	
	if(str.length != 6){
		return false;
	}
	
	return true;

}

function deletePostNoObj(obj) {
	var _str = deletePostNoStr(obj.value);
	obj.value = _str;
}
function deletePostNoStr(str) {
	var temp = '';
	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == "-") {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}
	return  temp;
}
function addPostNoObj(obj) {
	var _value = obj.value;
	if(_value.length>0){
		if( !isPost(_value) ){
			obj.value = "";
			obj.focus();
			alert("데이터 타입이 올바르지 않습니다.");
			return;
		}else{
			var _str = addPostNoStr(_value);
			obj.value = _str;
		}
	}
}
function addPostNoStr(str) {
	if(str.length < 1){
		return "";
	}
	return  str.substring(0, 3) + "-" + str.substring(3, 6);
}

/**
 * 시간 타입 여부
 * @param str
 * @returns {Boolean}
 */
function isTime(str) {
	if(str.length > 0){
		
		if( !isNumber(str) ){
			return false;
		}
		if (str.length!=4){
			return false;
		}
		var _time = Number(str.substring(0, 2));
		var _minu = Number(str.substring(2, 4));
		if( _time > 24 && _time < 1 ){
			return false;
		}
		if( _minu > 59 && _minu < 0){
			return false;
		}
		
		if(Number(str) > Number("2400") ) return false;
		
		return true;
		
	}
}
function addTimeObj(obj) {
	var _value = obj.value;
	if(_value.length>0){
		if( !isTime(_value) ){
			obj.value = "";
			obj.focus();
			alert("테이터 타입이 올바르지 않습니다.");
			return;
		}else{
			var time = addTimeStr(_value);
			obj.value = time;
		}

	}
}
function addTimeStr(str) {
	if(str.length < 1){
		return "";
	}
	return  str.substring(0, 2) + SEP_TIME + str.substring(2, 4);
}

function deleteTimeObj(obj) {
	var _time = deleteTimeStr(obj.value);
	obj.value = _time;
}
function deleteTimeStr(str) {
	var temp = '';

	for (var i = 0; i < str.length; i++) {
		if (str.charAt(i) == SEP_TIME) {
			continue;
		} else {
			temp += str.charAt(i);
		}
	}
	return  temp;
}

function addPuqFormat(str) {
	if( str.length != 19){
		return "";
	}
	return  str.substring(0, 4) + "-" + 
			str.substring(4, 7) + "-" + 
			str.substring(7, 13) + "-" + 
			str.substring(13, 19) ;
}

function addEtcStr(str) {
	if( (str.length < 1 && str.length > 4) || str=="" || typeof str == 'undefined' || str==null || str=="null"){
		return "";
	}
	return  str.substring(0, 2) + "-" + str.substring(2, 4);
}

/**
 * ip4 형식에 맞는지 확인하여 리턴한다.
 * @param str
 * @returns {Boolean}
 */
function isIp4(str){
	var filter = /^([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+\.([1-9][0-9]{0,2})+$/;
	if (!filter.test(str)) {
		//f.ip.focus();
		return false;
	}else{
		return true;
	}
}

/**
 * 체크박스 선택 해제
 * @param sender
 * @param containerID
 * @param checkboxIDMatch
 */
function FnCmmCheckRows(sender, containerID, checkboxIDMatch){
    var checkboxContainer = document.getElementById(containerID);
    var inputs = checkboxContainer.getElementsByTagName('input');
    for (var i = 0; i < inputs.length; i++){
        var isItem = inputs.item(i);        
        if(isItem.type=="checkbox" && isItem.name=="_grid_row"){
        	if(sender.checked==true){
        		isItem.checked = true;
        	}else{
        		isItem.checked = false;
        	}
        }
    }
}

function FnCmmCheckBoxYn(isName){
	var obj = document.getElementsByName(isName);
	var x = 0; 
	for(var i =0;i<obj.length;i++){
  		if(obj[i].checked == true){
    		x++; 
  		}
	}
	
	if(x==0){
		return false;
	}else{
		return true;
	}
}

//설정한 날짜만큼 쿠키가 유지되게. expiredays가 1 이면 하루동안 유지
function setCookie(name, value, expiredays) {
	var expire_date = new Date();
	expire_date.setDate(expire_date.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; expires=" + expire_date.toGMTString() + "; path=/";
}

//쿠키 소멸 함수
function clearCookie(name) {
	var expire_date = new Date();
	//어제 날짜를 쿠키 소멸 날짜로 설정한다.
	expire_date.setDate(expire_date.getDate() - 1);
	document.cookie = name + "= " + "; expires=" + expire_date.toGMTString() + "; path=/";
}

//체크 상태에 따라 쿠키 생성과 소멸을 제어하는 함수
function controlCookie(elemnt, popupname) {
	//if (elemnt.checked) {
		//체크 박스를 선택했을 경우 쿠키 생성 함수 호출
		setCookie(popupname,"true", 1);
	//}else {
		//체크 박스를 해제했을 경우 쿠키 소멸 함수 호출
	//	clearCookie(popupname);
	//}
	return;
}

function getCookie(name) {
	var Found = false ;
	var start, end ;
	var i = 0 ;
	// cookie 문자열 전체를 검색 
	while(i <= document.cookie.length) { 
		start = i ;
		end = start + name.length ;
	
		// name과 동일한 문자가 있다면 
		if(document.cookie.substring(start, end) == name){
			Found = true ;
			break ;
		} 
		i++ ;
	}
	// name 문자열을 cookie에서 찾았다면 
	if(Found == true) { 
		start = end + 1 ;
		end = document.cookie.indexOf(";", start) ;
		// 마지막 부분이라 는 것을 의미(마지막에는 ";"가 없다) 
		if(end < start) 
			end = document.cookie.length ;
		
		// name에 해당하는 value값을 추출하여 리턴한다. 
		return document.cookie.substring(start, end) ;
	}else{
		// 찾지 못했다면 
		return false ;
	}
}

/**
 * 셰션이 살아 있는지 체크 한다.
 */
function FnLoginAlive(context){
	$.ajax({
		async : true
      , type: 'POST'
      , url: context+"account/loginAlive.kta"
      , dataType : 'json'
      , data : {}
      , success : function (data) {
    	  alert(data._result);
    	  if(data.result=="false"){
    		  clearCookie("USER_ID");
    		  clearCookie("SESSIONID");
    	  }
	  }, error: function(response, error) {
		  FnAjaxError( response );
	  }
	});
}
function FnLogout(context){
	$.ajax({
		async : true
      , type: 'POST'
      , url: context+"account/logout.kta"
      , dataType : 'json'
      , data : {}
      , success : function (data) {
    	  alert(data._message);
    	  if(data._result == "S"){
    		  clearCookie("USER_ID");
    		  clearCookie("SESSIONID");
    	  }
    	  
    	  if(FnMobileCheck()){
    		  location.href="app://appExit";
    	  }else{
    		  location.href=context;
    	  }
    	  
	  }, error: function(response, error) {
		  FnAjaxError( response );
	  }
	});
}
function FnEnter(e, callFunction){

	//if( checkKey() ){
		if(e.keyCode==13){
			if(callFunction != "") {
				eval(callFunction+"()");
			}else{
				return false;
			}
		}
	//}

}
function FnAjaxError( response ){
	if(response.status==0) {
		window.history.back();
	}else{
		alert("[시스템 에러발생] : " + response.status );
	}
}

function FnDateSet(id){
    $('#'+id).scroller();
}

/**
 * 공통코드정보) 공통코드를 조회하여 display_type에 따라 html태그를 만들어 준다.
 * @param com_cd
 * @param display_type(S:select, R:radio, C:checkbox)
 * @param display_area_id(출력된 영역의 아이디)
 * @param object_id(object의 아이디 식별 명)
 * @param read_yn(object가 읽기전용(혹은 disabled)의 여부)
 * @param cur_data(입력된 코드값)
 * @param add_all_yn(전체 추가 여부)
 * @param callfn(클릭 혹은 변경시 호출함수)
 * @param datatype(필드의 데이터 타입)
 * @param datalength(필드의 데이터 길이)
 * @param dataname(필드의 명칭)
 * @param isReq(필수 체크 여부)
 * @param 컨텍스트루트
 */
function FnAjaxCmmsComCdInfo(com_cd, display_type, display_area_id, object_id, read_yn, cur_data, add_all_yn, callfn, datatype, datalength, dataname, isReq, path){
	$.ajax({
		  async : true
		, type: 'POST'
		, url: path+"common/getCmmCode.kta"
		, dataType : 'json'
	    , data : { "_codePart" : com_cd }
		, success : function (data) {
			if(display_type=="S"){
	    		  FnSelectHtml(data._list, com_cd, display_type, display_area_id, object_id, read_yn, cur_data, add_all_yn, callfn, datatype, datalength, dataname, isReq);
	    		  
			}else if(display_type=="R"){
	    		  FnRadioHtml(data._list, com_cd, display_type, display_area_id, object_id, read_yn, cur_data, add_all_yn, callfn, datatype, datalength, dataname, isReq );
	    		  
			}else if(display_type=="C"){
	    		  FnCheckBoxHtml(data._list, com_cd, display_type, display_area_id, object_id, read_yn, cur_data, add_all_yn, callfn, datatype, datalength, dataname, isReq );
			}
		}, error: function(response, error) {
			FnAjaxError(response);
		}
	});
}

/**
 * 
 * @param obj
 * @param com_cd
 * @param display_type
 * @param display_area_id
 * @param object_id
 * @param read_yn
 * @param cur_data
 * @param add_all_yn
 * @param callfn
 * @param datatype
 * @param datalength
 * @param dataname
 * @param isReq
 * @param widthGbn
 */
function FnSelectHtml(obj, com_cd, display_type, display_area_id, object_id, read_yn, cur_data, add_all_yn, callfn, datatype, datalength, dataname, isReq){
	
	//alert(add_all_yn);

	var str = new StringBuffer();
	var offset = "";
	var style  = "";
	if(read_yn == 'Y') offset = "disabled";
	
	if(callfn!="") {
		callfn = "onchange='"+callfn+"();'";
		
	}else{
		callfn = "";
	}
	str.append("<select data-mini='true' data-inline='true' class='isSelect' type='select' id='"+object_id+"' isReq='"+isReq+"' name='"+object_id+"' "+offset+" validYn='Y' datatype="+datatype+" datalength="+datalength+" dataname="+dataname+" "+callfn+" "+style+"> \n");
	if(add_all_yn=="Y") {
		str.append("<option value=''>선택</option> \n");
	}else if(add_all_yn=="A") {
		str.append("<option value='ALL'>전체</option> \n");
	}

	for(var i=0; i<obj.length; i++){
		var select = "";
		if(cur_data==obj[i].COM_CODE) select = "selected";
		str.append("<option value='"+obj[i].COM_CODE+"' "+select+">"+obj[i].COM_NAME+"</option> \n");
	}
	
	str.append("</select> \n");
	$("#"+display_area_id).html(str.toString()).trigger( "create" );
}

function FnRadioHtml(obj, com_cd, display_type, display_area_id, object_id, read_yn, cur_data, add_all_yn, callfn, datatype, datalength, dataname, isReq ){
	var str = new StringBuffer();
	for(var i=0; i<obj.length; i++){
		var disabled = "";
		var checked = "";
		
		if(cur_data==obj[i].CODE) checked = "checked";
		if(read_yn=="Y") disabled = "disabled";
		str.append("<input type='radio' name='"+object_id+"' isReq='"+isReq+"' id='"+object_id+"' value='"+obj[i].CODE+"' "+disabled+" "+checked+" validYn='Y' datatype="+datatype+" datalength="+datalength+" dataname="+dataname+" /> "+obj[i].NAME+" \n");
	}
	$("#"+display_area_id).html(str.toString());
}

function FnCheckBoxHtml(obj, com_cd, display_type, display_area_id, object_id, read_yn, cur_data, add_all_yn, callfn, datatype, datalength, dataname, isReq ){
	var str = new StringBuffer();
	var isdata = new Array();
	isdata = cur_data.split("||");

	for(var i=0; i<obj.length; i++){
		var checked = "";
		var disabled = "";
		for(var j=0; j<isdata.length; j++){
			if(obj[i].COM_CD==isdata[j]){
				checked = "checked";
				break;
			}
		}
		if(read_yn=="Y") disabled = "disabled";
		str.append("<input type='checkbox' name='"+object_id+"' isReq='"+isReq+"' id='"+object_id+"' "+disabled+" value='"+obj[i].COM_CD+"' "+checked+" validYn='Y' datatype="+datatype+" datalength="+datalength+" dataname="+dataname+" /> "+obj[i].COM_CD_NM+" \n");
	}
	$("#"+display_area_id).html(str.toString());
}

/**
 * 
 * @param _tblId  : 그리드 아이디
 * @param _rowLoc : 그리드 하단, 혹은 상단에 추가 할지 구분자
 * @param _html   : 추가할 html코드
 * @param _gbn    : 추가여부
 */
function FnCmmRowAdd(_tblId, _rowLoc, _html, _gbn){
	//alert("111");
	if(_rowLoc=="FIRST"){
		$("#"+_tblId).find("tbody tr:first").before( _html ) ;
		$("#"+_tblId).trigger( "create" );
	}else{
		$("#"+_tblId).find("tbody").append( _html) ;
		$("#"+_tblId).trigger( "create" );
	}
	
	if(_gbn=="ADD") $("#noData").remove();
}

function FnCmmRowSelectDelete(obj, _tblId, _rowLoc, _html){	
}

/**
 * 파일 다운로드
 * @param fileSeq
 * @param context
 */
function FnCmmFileDown( fileSeq, context ){
	if(context.length<1) context = "/";
	var str = "<input type='hidden' id='_fileSeq' name='_fileSeq' value='"+fileSeq+"'/>";
	$("#_paramArea").html(str);
	$("form#kta_form").attr("action", context + "down/index.kta");
	$("form#kta_form").attr("method", "POST");
	$("form#kta_form").attr("target", "_self");
	$("form#kta_form").submit();
}

/**
 * 모바일 기기 확인
 */
function FnMobileCheck(){
		var filter = "win16|win32|win64|mac";     
		if( navigator.platform  ){        
			if( filter.indexOf(navigator.platform.toLowerCase())<0 ){            
				//alert("모바일에서 접속");  
				return true;    
			}else{            
				//alert("PC에서 접속");   
				return false;    
			}    
		}	
}

function FnAjaxLoginMovie(isRoot){
	if( FnMobileCheck() ){
		location.href="app://appExit";
	}else{
		alert("로그인 하시기 바랍니다.");
		location.href=isRoot;
	}
}

function FnCmmImageViewer(imagePath,context){
	alert(imagePath);
	$.mobile.changePage("/biz/com/pop/image/ImageViewerPop.kta?_imagePath="+imagePath);		
	//$.mobile.changePage("/biz/com/pop/image/ImageViewerPop.kta?_imagePath=1332981693211_sunflowers.jpg");
}

/**
 * 그리드 로우 선택 시 상세내용 보이기, 숨기기 처리
 * @param tableIds
 * @param rowId
 * @param iconId
 * @param idx
 * @param prjName
 */
function FnCmmRowSelect(tableIds, rowId, iconId, idx, prjName){
	var tableId     = document.getElementById(tableIds);
	var tableId_cnt = (tableId.rows.length-1) / 2;
	var ___minus = "<a href='#' data-role='button' data-icon='minus' data-iconpos='notext'>&nbsp;</a>"; 
	var ___plus  = "<a href='#' data-role='button' data-icon='plus' data-iconpos='notext'>&nbsp;</a>";
	var curIdx ;
	if(prjName=="MEMO"){
		if(idx=="") idx = RowIdxMemo;
		curIdx = RowIdxMemo;
	}

	if(idx == curIdx){
		$("#"+rowId+idx).hide();
		$("#"+iconId+idx).html(___plus).trigger('create');
		curIdx = 99999;
	}else{
		for(var i=0; i<tableId_cnt; i++){
			if(Number(idx==i)){
				$("#"+rowId+idx).show();
				$("#"+iconId+idx).html(___minus).trigger('create');
				curIdx = i;
			}else{
				$("#"+rowId+i).hide();
				$("#"+iconId+i).html(___plus).trigger('create');
			}
		}
	}

	if(prjName=="MEMO"){
		RowIdxMemo = curIdx;
	}
	
}
//]]>