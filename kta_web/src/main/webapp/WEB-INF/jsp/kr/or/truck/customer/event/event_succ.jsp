<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="title" content="KTA | 전국화물자동차공제조합" />
    <title>KTA |전국화물자동차공제조합</title>
    <script type="text/javascript" src="/js/jquery/jquery-1.10.2.min.js"></script>
</head>
<script type="text/javaScript" >
window.name ="Parent_window";
$(document).ready(function(){
	<%-- hp ë¡ê·¸ì¸ submit event --%>
	window.opener.document.insertForm.phone.value='${phone}';
	window.opener.document.insertForm.name.value='${name}';
	window.opener.document.insertForm.di.value='${di}';
	window.close();	
});
function sendData(){
	window.opener.document.insertForm.phone.value='${phone}';
	window.opener.document.insertForm.name.value='${name}';
	window.opener.document.insertForm.di.value='${di}';
	window.close();
}
</script>
<body>

</body>

</html>