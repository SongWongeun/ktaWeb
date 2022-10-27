<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<%
	System.out.println(request.getAttribute("articleNo"));
	System.out.println(request.getAttribute("returnUrl"));
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>

</head>
<c:set var="registerFlag" value="${empty hwamulBoardVO.articleNo ? '등록' : '수정'}"/>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="/js/truck/kma_common.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">


//지부코드
var jibuCode;

//차량번호 확인
var crrCode;

/* loading 표시 */
 window.onbeforeunload = function (e) {
	var agt = navigator.userAgent.toLowerCase();
		$('div#loading_page').show();
	}

/* 글 등록 function */
function saveHwamulBoard() {	
	var f = document.f;
 	/* var html = f.contentHtml.value;
	f.contentText.value = html; */
	
	f.phone1.value = f.phoneSelect.options[f.phoneSelect.selectedIndex].value;
	
	var email = "";
	if(f.email1.value!=""){
		email = f.email1.value+"@"+f.email2.value;
	}
	
	//var email = f.email1.value+"@"+f.email2.value;
	var phone = f.phone1.value+"-"+f.phone2.value+"-"+f.phone3.value;
	f.phone.value = phone;
	f.email.value = email;
	
	var year = f.select_year.value;
	var month = lpad(f.select_month.value,2,'0');
	var day = lpad(f.select_day.value,2,'0');
		
	var expire_date = year+month+day;
	f.expire_date.value = expire_date;
	
	var car_no = f.jibu.value+f.car_no.value;
	

	var jibu = f.jibu.value;
	checkPlate(car_no);
	if(crrCode == 1){
		alert("차량번호를 다시 입력해주세요");
		return false;
	}
	f.jibu_cd.value=jibuCode;

	var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var rp=/^\d{3}-\d{3,4}-\d{4}$/;
	var rc=/^\d{2}[가-힣]\d{2,3}\d{1}[가-힣]\d{4}$/;
		
	if($("#phone_yn").is(":checked")){
		f.phone_yn.value='Y';
	}
	if($(f.essential_notice1).is(":checked")){
		f.essential_notice1.value='Y';
	}
	if($(f.essential_notice2).is(":checked")){
		f.essential_notice2.value='Y';
	}
	if($(f.essential_notice3).is(":checked")){
		f.essential_notice3.value='Y';
	}
	if($(f.essential_notice4).is(":checked")){
		f.essential_notice4.value='Y';
	}
	if($(f.essential_notice5).is(":checked")){
		f.essential_notice5.value='Y';
	}
	if($(f.essential_notice6).is(":checked")){
		f.essential_notice6.value='Y';
	}
	if($(f.essential_notice7).is(":checked")){
		f.essential_notice7.value='Y';
	}

  	if(!rp.test(phone)){
		alert("연락처를 다시 입력해주세요");		
		return false;
	}
	if(f.car_no.value==null || f.car_no.value==""){
		alert("차량번호를 입력해주세요");
		f.car_no.focus();
		return false;
	}
 	if(!$("#agreeterms").is(":checked")){  
		alert("개인정보 수집 및 이용에 동의해주세요");
		return false;
	}
 	if($("input:checkbox[name=object_coverage]:checked").length<1){
 		alert("대물 항목은 필수입니다");
 		return false;
 	}
 	
 	if($(".essential_notice:checked").length<1){
 		alert("한개 이상의 필수고지사항을 선택해주세요");
 		return false;
 	}
 	
 	f.car_no.value = car_no;
	if('${registerFlag}' == '등록') {
		f.action = '/deductProduct/privateHwamul/hwamulAdd.do';
	}
    f.submit();
	
}


//지부코드 부여 
function checkPlate (value){
	crrCode=0;
	var carNumber = value.replace(/ /gi, "");
	var region = carNumber.substring(0,2);  
  	var chkRegion = "서울,부산,대구,인천,광주,대전,울산,경기,강원,충북,충남,전북,전남,경북,경남,제주,세종";
  	var arrChkRegion = chkRegion.split(',');
  	var chkRegionCode ="A02,A03,A04,A05,A06,A07,A08,A09,A10,A11,A12,A13,A14,A15,A16,A17,A18";
  	var arrChkCode = chkRegionCode.split(',');
	   
	 for(var i = 0; i < arrChkRegion.length; i++){
	    if(region==arrChkRegion[i]){
	    	carNumber=carNumber.substring(2,carNumber.lenght);
	     jibuCode = arrChkCode[i];
	    break;
	    }
	 }
	
	   var typeOfCar = Number(carNumber.substring(0, 2));
	   
	   if(isNaN(typeOfCar) || typeOfCar.lenght < 2){
	    
	    return false;
	   }
	   
	   var use = carNumber.substring(2, 3);
	   var checkUse = "가,나,다,라,마,"
	       +"거,너,더,러,머,버,서,어,저,"
	       +"고,노,도,로,모,보,소,오,조,"
	       +"구,누,두,루,무,부,수,우,주,"
	       +"바,사,아,자,"
	       +"배,"
	       +"허,하,호,"
	       +"국,합,육,해,공";
	   var arrCheckUse = checkUse.split(',');
	   var resultUse = 0;
	   
	   for(var j = 0; j < arrCheckUse.length; j++){
	    if(use==arrCheckUse[j]){
	     resultUse = 1;
	     break;
	    }
	   }
	   
	   if(resultUse == 0) {
		   crrCode=1;
		   return false;
	   }
	   
	   var serialNumber = carNumber.substring(3, value.length);
	   
	   if(isNaN(serialNumber) || serialNumber.length < 4){
		   crrCode=1;
	       return false;
	   }
	   
	return true;
}

//이메일
function setEmailTail(emailValue) {   
 var emailTail = document.all("email2");    
 if ( emailValue == "notSelected" )
  return;
 else if ( emailValue == "etc" ) {
  emailTail.readOnly = false;
  emailTail.value = "";
  emailTail.focus();
 } else {
  emailTail.readOnly = true;
  emailTail.value = emailValue;
 }
}

function lastday(){ //년,월에 따라 마지막 일 도출
	var Year=document.getElementById('select_year').value; 
	var Month=document.getElementById('select_month').value; 
	var day=new Date(new Date(Year,Month,1)-86400000).getDate(); 
	var dayindex_len=document.getElementById('select_day').length; 
	if(day>dayindex_len){ 
		for(var i=(dayindex_len+1); i<=day; i++){
			document.getElementById('select_day').options[i-1] = new Option(i, i);
			} 
		} else if(day<dayindex_len){
			for(var i=dayindex_len; i>=day; i--){
			document.getElementById('select_day').options[i]=null; 
			}
		}
}


$(document).ready(function(){
		$('.toggleBox').hide();
		$('.toggleWrap .btnAgree').click(function(){
			$(this).siblings('.toggleBox').slideToggle();
			  if( $(this).find('.hide').html() == '내용열기' ) {
				$(this).find('.hide').html('내용닫기');
				$(this).addClass('close');
				}
				else {
				$(this).find('.hide').html('내용열기');
				$(this).removeClass('close');
				}
		return false;
	});
	
 /* 체크박스 하나만 선택 */	
 $("input:checkbox").on('click', function() {
	  if ($(this).prop("checked")) {
	    var chk = "input:checkbox[name='" + $(this).attr("name") + "']";
	    $(chk).prop("checked", false);
	    $(this).prop("checked", true);
	  } 
 }); 
 
 
 
 $("#essential_notice71").click(function(){
	$("input:checkbox[name='essential_notice1']").prop("checked", false);
	$("input:checkbox[name='essential_notice2']").prop("checked", false);
	$("input:checkbox[name='essential_notice3']").prop("checked", false);
	$("input:checkbox[name='essential_notice4']").prop("checked", false);
	$("input:checkbox[name='essential_notice5']").prop("checked", false);
	$("input:checkbox[name='essential_notice6']").prop("checked", false);
 });  

 
 $(".ess").click(function(){
	 $("input:checkbox[name='essential_notice7']").prop("checked", false);
 });
  
//---------------날자
	 var start_year="2015";// 시작할 년도 
	 var today = new Date();
	 var today_year= today.getFullYear();
	 
	 var index=0;
	
	 for(var y=today_year; y<=today_year+4; y++){
	 	 document.getElementById('select_year').options[index] = new Option(y,y);
	 	 index++;
	 }
	 index=0;
	 for(var m=1; m <= 12; m++){
	 	 document.getElementById('select_month').options[index] = new Option(m,m);
	 	 index++;
	 }
	
	 lastday();
	 
//--------------지역
	 var chkRegion = "서울,부산,대구,인천,광주,대전,울산,경기,강원,충북,충남,전북,전남,경북,경남,제주,세종";
	 var arrChkRegion = chkRegion.split(',');
	 for(var i = 0; i < arrChkRegion.length; i++){
		document.getElementById('jibu').options[i] = new Option(arrChkRegion[i],arrChkRegion[i]);
	    }



});

</script>
<style>
	.notice{
		font-size:20px;
		padding:10px;
	}
	input[type="checkbox"]{
		display : inline-block;
		height:20px;
		cursor:pointer;
		}
	label{
		display : inline-block;
		height:20px;
		text-align:center;
		cursor:pointer;
		padding:5px;
	}	
</style>
</head>
<body>
 	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e -->
		<!-- container s -->
		<div id="container">
		<form:form commandName="hwamulBoardVO" name="f" enctype="multipart/form-data" action="">
		<fieldset>
			<legend>개인화물 공제가입 상담신청</legend>
			<form:hidden path="articleNo"/>
			<input type="hidden" name="phone" />
			<input type="hidden" name="phone1" />
			<input type="hidden" name="contentText"/>
				
			<form:hidden path="email" title="이메일" value=""/>
			<form:hidden path="expire_date" title="계약만기예정일" value=""/>
			<form:hidden path="jibu_cd" title="지부코드"/>
			
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/dedu/registqna_tit.gif" alt="개인화물 공제가입 상담신청" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/deductProduct/deductProductIndex.do">고객광장</a>
						<a href="/deductProduct/hwamulInfo.do">개인화물 가입안내</a>
						<span>개인화물 공제가입 상담신청</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/personal_con_tit.gif" alt="고객과 함께 크는 기업 화물공제조합 칭찬합시다 서비스 입니다 고객님들께서 남겨주시는 칭찬글 모두 화물공제조합 직원들에게 힘이 되고, 동기 부여가 됩니다." /></p>
					<div class="conSection">
						<!-- table writing s -->
						<div class="bbsView1">
							<!-- 테이블 타이틀 s -->
  							<span class="mustHave">&nbsp;&nbsp;표시가 붙은 항목은 필수입니다.</span>
  							<p>&nbsp;</p>
							<%-- <div class="tbtitBox">
								<dl>
									<dt><span class="mustHave">제목</span></dt>
									<dd><label for="" class="hide">제목</label><form:input type="text" value="" path="title" title="개인화물 공제가입 상담신청 페이지" style="width:750px;" class="inputSt01" /></dd>
								</dl>
							</div><!--// 테이블 타이틀 e --> --%>
							<!-- 테이블 s -->
							<table class="tbView_st02" summary="개인화물 공제가입 상담신청">
								<caption>개인화물 공제가입 상담신청</caption>
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span  class="mustHave" >성명</span></th>
										<td>
										<c:if test="${not empty name}">
										${name}
										<form:hidden path="writerName" value="${name}"/>
										</c:if>									
										<c:if test="${empty name}">
										<label for="writerName" class="hide">업체명 또는 성명</label><form:input path="writerName" type="text" value="" title="업체명 또는 성명" style="width:150px;" class="inputSt01" />
										</c:if>
										</td>
										<%-- <form:hidden path="birth" value="${birth}"/> --%>
									</tr>
									<tr>
										<th scope="row"><span class="mustHave">연락처</span></th>
										<td>
											<select id="" name="phoneSelect" title="휴대폰 첫번째 자리" >
												<option value="010">010</option>
											    <option value="011">011</option>    
											    <option value="016">016</option>
											    <option value="019">019</option>
											    <option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="033">033</option>
												<option value="041">041</option>
												<option value="042">042</option>
												<option value="043">043</option>
												<option value="051">051</option>
												<option value="052">052</option>
												<option value="053">053</option>
												<option value="054">054</option>
												<option value="055">055</option>
												<option value="061">061</option>
												<option value="062">062</option>
												<option value="063">063</option>
												<option value="064">064</option>
											</select>&#45;
											<label for="" class="hide">휴대폰 두번째 자리</label><input type="text" value="${phone2}" name="phone2" title="휴대폰 두번째 자리" style="width:55px;" maxlength="4" class="inputSt01" />&#45;
											<label for="" class="hide">휴대폰 세번째 자리</label><input type="text" value="${phone3}" name="phone3" title="휴대폰 세번째 자리" style="width:55px;" maxlength="4" class="inputSt01" />
											<!-- 20161208 추가 -->
											<label class="mL20"><input type="checkbox" name="phone_yn" id="phone_yn" value=""/> SMS 수신은 핸드폰번호인 경우에만 가능합니다.</label>
											<!-- //20161208 추가 -->
										</td>
									</tr>
									<!-- 이메일 -->
									<tr>
										<th scope="row">E&#45;mail</span></th>
										<td>
											<label for="" class="hide"></label><input name="email1" id="" type="text"  value="${email}" class="inputSt01" style="width:230px;" />&#64;
											<label for="" class="hide">이메일계정</label><input name="email2" title="이메일 계정입력" id="" type="text"  value="${email2}" class="inputSt01" style="width:150px;" />
											<select title="이메일 계정 선택" id="emailDomain" name="emailCheck" onchange="setEmailTail(emailCheck.options[this.selectedIndex].value)">
												<option selected="selected" value="">선택하세요</option>
											    <option value="etc">직접입력</option>
												<c:forEach items="${emailList}" var="email">
											    	<option value="${email.CODE}">${email.CODE_NM}</option>
											    </c:forEach>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
							<p class="notice">[ 차량정보 ]</p>
							<table class="tbView_st02" summary="개인화물 공제가입 상담신청">
								<caption>개인화물 공제가입 상담신청</caption>
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>
									
									<!-- 차량번호 입력 -->
									<tr> 
										<th scope="row"><span  class="mustHave" >차량번호 / 적재정량</span></th>
											<td>					
												<select id="jibu" title="지역"/>
												<form:input path="car_no" type="text" value="" title="차량번호" maxlength="7" style="width:130px;" class="inputSt01" placeholder="차량번호를 입력하세요"/>
												/	
												<form:input path="carry_capacity" type="text" value="" title="적재정량" maxlength="10" style="width:130px;" class="inputSt01" placeholder="적재정량을 입력하세요"/>	
												kg														
											</td>
										<%-- <form:hidden path="birth" value="${birth}"/> --%>							
									</tr>
									<tr>
										<th scope="row">협회가입유무</th>
										<td>
											<form:checkbox path="assocication_join" value="0" label="미가입" checked="checked" />
											<form:checkbox path="assocication_join" value="1" label="개별화물협회"/>
											<form:checkbox path="assocication_join" value="2" label="용달화물협회"/>
										</td>
									</tr>
									<tr>
										<th scope="row">계약 만기(예정)일</th>
										<td>
											<select id="select_year" onchange="javascript:lastday();">년</select>
											<select id="select_month" onchange="javascript:lastday();">월</select>
											<select id="select_day">일</select>
										</td>
										
									</tr>
									<tr>
										<th scope="row">현 할인할증 등급</span></th>
										<td>
											<label for="" class="hide"></label>
											<form:input type="text" value="" path="extra_charge" title="현 할인할증등급"  class="inputSt01" />
											<label>현 가입중인 손해보험사 등급요율 ( 예시 : 12Z, 13Z )</label>
										</td>
									</tr>
									<tr>
										<th scope="row"><span  class="mustHave" >필수고지사항</span></th>
										<td>
											<form:checkbox path="essential_notice1" value="N" class="essential_notice ess" label="수반차를 견인하는데 사용하는 특수연결장치(트랙터, 풀카고 등)를 한 차량"/><br>
											<form:checkbox path="essential_notice2" value="N" class="essential_notice ess" label="위험물(석유, 고압가스, 폭발인화성위험물질 등 )을 적재하는 차량"/><br>
											<form:checkbox path="essential_notice3" value="N" class="essential_notice ess" label="기중기, 붐, 집게등이 장착(사다리차, 크레인, 렉카 등)된 차량"/><br>
											<form:checkbox path="essential_notice4" value="N" class="essential_notice ess" label="방송, 녹음, 레트켄, 토오키 등 정밀기계가 장착된 차량"/><br>
											<form:checkbox path="essential_notice5" value="N" class="essential_notice ess" label="6인승 밴형화물자동차 또는 승차정원이 3인을 초과하는 차량"/><br>
											<form:checkbox path="essential_notice6" value="N" class="essential_notice ess" label="구조변경 이력이 있는 차량"/><br>
											<form:checkbox path="essential_notice7" value="N" class="essential_notice" label="해당없음"/>
										</td>
									</tr>
								</tbody>
							</table>
							<p class="notice">[ 가입상품 ]</p>
							<table class="tbView_st02" summary="개인화물 공제가입 상담신청">
								<caption>개인화물 공제가입 상담신청</caption>
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span  class="mustHave" >대인Ⅰ</span></th>
										<td>
										<form:checkbox path="person1_coverage" value="Y" label="가입" checked="checked" onclick="return false;"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><span  class="mustHave" >대인Ⅱ</span></th>
										<td>
										<form:checkbox path="person2_coverage" value="Y" label="가입" checked="checked" onclick="return false;"/>
										</td>
									</tr>
									<tr>
										<th scope="row"><span  class="mustHave" >대물</span></th>
										<td>
										<form:checkbox path="object_coverage" value="2000" label="2천만원" checked="checked" />
										<form:checkbox path="object_coverage" value="3000" label="3천만원"/>
										<form:checkbox path="object_coverage" value="5000" label="5천만원"/>
										<form:checkbox path="object_coverage" value="7000" label="7천만원"/>
										<form:checkbox path="object_coverage" value="10000" label="1억원"/>
										<form:checkbox path="object_coverage" value="20000" label="2억원"/>
										<form:checkbox path="object_coverage" value="30000" label="3억원"/>
										<form:checkbox path="object_coverage" value="40000" label="4억원"/>
										<form:checkbox path="object_coverage" value="50000" label="5억원"/>
										</td>
									</tr>
									<tr>
										<th>자기신체사고<br>(사망후유장애)</th>
										<td>				
										<form:checkbox path="selfbody_coverage" value="1500" label="1천5백만원"/>
										<form:checkbox path="selfbody_coverage" value="3000" label="3천만원"/>
										<form:checkbox path="selfbody_coverage" value="5000" label="5천만원"/>
										<form:checkbox path="selfbody_coverage" value="10000" label="1억원"/>
										<form:checkbox path="selfbody_coverage" value="0" label="미가입"/>
										<a style="position: relative; left: 50px">(부상 1천 5백만원 동일)</a>
										</td>
									</tr>
									<tr>
										<th scope="row">자기차량손해</span></th>
										<td>
										<form:checkbox path="selfcar_coverage" value="Y" label="가입"/>
										<form:checkbox path="selfcar_coverage" value="N" label="미가입"/>
										</td>
									</tr>
									<tr>
										<th scope="row">긴급출동</span></th>
										<td>
										<form:checkbox path="emergency_call" value="Y" label="가입"/>
										<form:checkbox path="emergency_call" value="N" label="미가입"/>
										</td>
									</tr>
									<tr>
										<th scope="row">법률비용지원</span></th>
										<td>
										<form:checkbox path="law_expense" value="Y" label="가입"/>
										<form:checkbox path="law_expense" value="N" label="미가입"/>
										</td>
									</tr>
									<tr>
										<th scope="row">적재물</span></th>
										<td>
										<form:checkbox path="luggage_coverage" value="Y" label="가입"/>
										<form:checkbox path="luggage_coverage" value="N" label="미가입"/>
										</td>
									</tr>
<%-- 									<tr>
										<th scope="row"><span class="mustHave">기타문의 사항</span></th>
										<td colspan="3" class="textarea01" style="width:900px;height:250px;" name="기타문의">
										<form:textarea path="contentHtml" style="height:250px"></form:textarea>
										</td>
									</tr> --%>
								</tbody>
							</table>
														
							<!-- 20161208 추가 -->
							<div class="tblTop mT25">
								<p class="txtPoint pB0">개인정보 수집 및 이용안내</p>
								<p class="rightBtm"><input id="agreeterms" type="checkbox" name="agreeterms" /><label for="agreeterms"> 개인정보 수집 및 이용에 동의합니다&#46;</label></p>
							</div>

							<div class="agreeToggle">
								<div class="toggleWrap">
									<h4>수집하는 개인정보의 항목</h4>
									<div class="toggleBox">
										<p class="bold">&#60;회원&#62;</p>
										<p class="pB10">&#45; 대표자정보&#44; 조합원명&#44; 아이디&#44; 연락처&#44; 이메일&#44;</p>
										<p class="bold">&#60;비회원&#62;</p>
										<p class="pB10">&#45; 이름&#44; 연락처&#44; 이메일</p>
									</div>
									<a href="#" class="btnAgree"><span class="hide">내용열기</span></a>
								</div>
								<div class="toggleWrap">
									<h4>개인정보의 수집 및 이용 목적</h4>
									<div class="toggleBox">
										<p>본 조합이 수집한 개인정보를 다음의 목적을 위해 활용합니다&#46;</p>
										<p>이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며 이용목적이 변경될 시에는 사전 동의를 구할 것입니다&#46;</p>
										<ul>
											<li>가&#44; 민원처리&#44; 해당 서비스 이용시 본인의 확인</li>
											<li>나&#46; 처리내역 및 진행내용 알림</li>
										</ul>
									</div>
									<a href="#" class="btnAgree"><span class="hide">내용열기</span></a>
								</div>
								<div class="toggleWrap">
									<h4>개인정보의 보유 및 이용기간</h4>
									<div class="toggleBox">
										<p>본 조합은 회원 가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다&#46;</p>
										<p>회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우&#44; 수집 및 이용목적이 달성되면 해당 개인정보를 지체 없이 파기합니다&#46;</p>
									</div>
									<a href="#" class="btnAgree"><span class="hide">내용열기</span></a>
								</div>
							</div>
							<!-- //20161208 추가 -->
							</br>
							<!-- 버튼 -->
							<div class="btnboxR clfix">
								<span class="btn_pack btn_type01 icon"><span class="check"></span><a href="#;" onclick="saveHwamulBoard(); return false;">동의 후 등록</a></span>
								<span class="btn_pack btn_type10 icon"><span class="cancel"></span><a href="#;" onclick="listPraiseBoard();">등록취소</a></span>
								<!-- <span class="btn_pack btn_type02"><a href="javascript:clearFile(obj);">다시쓰기</a></span> -->
							</div>
						</div>
						<!--// table writing e -->
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			</fieldset>
			</form:form>
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html> 