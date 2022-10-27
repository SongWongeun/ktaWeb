<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<%
	System.out.println(request.getAttribute("articleNo"));
	System.out.println(request.getAttribute("returnUrl"));
%>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript" src="/js/truck/kma_common.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

//지부코드
var jibuCode;

//차량번호 확인
var crrCode;

// 글 등록 function  
function registBoard() {
	var f = document.f;
 	/* var html = f.contentHtml.value;
	f.contentText.value = html; */
	var phone1 = f.phoneSelect.options[f.phoneSelect.selectedIndex].value;		
	var phone = phone1+"-"+f.phone2.value+"-"+f.phone3.value;
	f.phone.value = phone;
	var email = f.email.value;
	
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

  	if( !/^\d{3,4}$/.test(f.phone2.value)){
		alert("유효하지 않은 연락처입니다. 확인해주세요.");
		f.phone2.focus();
		return false;
	}
	if( !/^\d{4}$/.test(f.phone3.value)){
		alert("유효하지 않은 연락처입니다. 확인해주세요.");
		f.phone3.focus();
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
 	
    f.action = '/m/deductProduct/privateHwamul/hwamulAdd.do';
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

function maxLengthCheck(object){
	   if (object.value.length > object.maxLength){
	    object.value = object.value.slice(0, object.maxLength);
	   }    
	}
/* 	
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
} */

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
		padding : 12px;
	}
	.agreetermBox {
		padding : 10px;
	}
	input[type="checkbox"]{
		display : inline-block;
		height:25px;
		width:25px;
		margin-right:10px;
		cursor:pointer;
		}
	label{

		height:20px;
		padding:2px;
		cursor:pointer;
	}	
	html:first-child select {padding-right:6px;height:35px;}
	select {border:1px solid #e0e0e0;vertical-align:middle;line-height:24px;height:35px;padding:3px 3px 3px 4px;color:#585858;font-family:'NanumGothic','나눔고딕';}
	input[type="text"], input[type="password"] {background:#ffffff;height:35px;line-height:24px;padding:0px 5px;vertical-align:middle;border:1px solid #e0e0e0;color:#585858;font-family:'NanumGothic','나눔고딕';}
</style>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path02">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/joinInfo/index.do">가입안내</a></li>
			<li><a href="/m/deductProduct/privateHwamul/hwamulAddView.do">개인화물 공제가입 상담신청</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="hwamulBoardVO" name="f" id="f" enctype="multipart/form-data">
	<input type="hidden" name="phone" />
	<form:hidden path="articleNo"/>
	<form:hidden path="modifyId"/>
	<form:hidden path="modifyName"/>
	<form:hidden path="modifyTime"/>
	<form:hidden path="contentText"/>
	<form:hidden path="writerId" />
	
	<form:hidden path="expire_date" title="계약만기예정일" value=""/>
	<form:hidden path="jibu_cd" title="지부코드"/>
			
		<article class="contentSubTitle">
			<!-- <ul class="subTitBox">
				<li class="subtit_i02"><img alt="클린센터" src="/images/m_truck/subtop/02top_3.png" /></li>
				<li class="txt01">클린신고센터는 화물공제조합 감사실에 직접 제보하는 기능이며, 언제나 누구든지 이용이 가능합니다.</li>
			</ul> -->
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont05">
			<table class="tbSt02">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><span class="bulSt04">성명</span></th>
						<td>${name}
							<form:hidden path="writerName" value="${name}"/>
							<form:hidden path="birth" value="${birth}"/>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">연락처</span></th>
						<td>
							<select id="" name="phoneSelect" class="select tel01" title="휴대폰 첫번째 자리">    
											    <option value="010">010</option>
											    <option value="011">011</option>    
											    <option value="016">016</option>
											    <option value="017">017</option>
											    <option value="018">018</option>
											    <option value="019">019</option> 
											</select>
							<span class="gab01">-</span>
							<span class="tel01"><input type="number" name="phone2" class="input" id="" value="" title="" maxlength="4" oninput="maxLengthCheck(this)"/></span>
							<span class="gab01">-</span>
							<span class="tel01"><input type="number" name="phone3" class="input" id="" value="" title="" maxlength="4" oninput="maxLengthCheck(this)"/></span>
						</td>
					</tr>
					<tr>
						<th scope="row"> SMS수신 </th>
						<td>
						<label><input type="checkbox" name="phone_yn" id="phone_yn" value=""/> SMS 수신은 핸드폰번호인 경우에만 가능합니다.</label>
						</td>
					</tr>
					<tr>
						<th scope="row">  E-mail</th>
						<td><form:input path="email" type="text" class="input" value="" title="이메일 입력"  style="width:100%;"/></td>
					</tr>
				</tbody>
			</table>
			<p class="notice">[ 차량정보 ]</p>		
			<table class="tbSt02">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tbody>		
					<tr>
						<th scope="row"><span class="bulSt04">차량번호</span></th>		
						<td>
							<select id="jibu" title="지역"></select></span>			
							<form:input path="car_no" type="text" value="" title="차량번호" maxlength="7" style="width:70%" placeholder="차량번호를 입력하세요"/><br>
						</td>						
					</tr>
					<tr>
						<th scope="row">적재정량</th>
						<td>
							<form:input path="carry_capacity" type="text" value="" title="적재정량" maxlength="10" style="width:70%;" placeholder="적재정량을 입력하세요"/>kg
						</td>
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
						<th scope="row">계약만기(예정)일</th>
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
							<form:input type="text" value="" path="extra_charge" title="현 할인할증등급"  class="inputSt01" /><br>
							<label>현 가입중인 손해보험사 등급요율 <br>( 예시 : 12Z, 13Z )</label>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">필수고지사항</span></th>
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
			<table class="tbSt02">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>	
			<tbody>	
					<tr>
						<th scope="row"><span class="bulSt04">대인Ⅰ</span></th>
						<td><form:checkbox path="person1_coverage" value="Y" label="가입" checked="checked" onclick="return false;" /></td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">대인Ⅱ</span></th>
						<td><form:checkbox path="person2_coverage" value="Y" label="가입" checked="checked" onclick="return false;" /></td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">대물</span></th>
						<td>
							<form:checkbox path="object_coverage" value="2000" label="2천만원" checked="checked"/>
							<form:checkbox path="object_coverage" value="3000" label="3천만원"/>
							<form:checkbox path="object_coverage" value="5000" label="5천만원"/><br>
							<form:checkbox path="object_coverage" value="7000" label="7천만원"/>
							<form:checkbox path="object_coverage" value="10000" label="1억원"/>
							<form:checkbox path="object_coverage" value="20000" label="2억원"/><br>
							<form:checkbox path="object_coverage" value="30000" label="3억원"/>
							<form:checkbox path="object_coverage" value="40000" label="4억원"/>
							<form:checkbox path="object_coverage" value="50000" label="5억원"/>
						</td>
					</tr>
					<tr>
						<th scope="row">자기신체사고<br>(사망후유장애)</th>
						<td>
							<form:checkbox path="selfbody_coverage" value="1500" label="1천5백만원"/>
							<form:checkbox path="selfbody_coverage" value="3000" label="3천만원"/>
							<form:checkbox path="selfbody_coverage" value="5000" label="5천만원"/><br>
							<form:checkbox path="selfbody_coverage" value="10000" label="1억원"/><br>
							<form:checkbox path="selfbody_coverage" value="0" label="미가입"/>
							<a>(부상 1천 5백만원 동일)</a>
						</td>
					</tr>
					<tr>
						<th scope="row">자기차량손해</th>
						<td>
							<form:checkbox path="selfcar_coverage" value="Y" label="가입"/>
							<form:checkbox path="selfcar_coverage" value="N" label="미가입"/>
						</td>
					</tr>
					<tr>
						<th scope="row">긴급출동</th>
						<td>
							<form:checkbox path="emergency_call" value="Y" label="가입"/>
							<form:checkbox path="emergency_call" value="N" label="미가입"/>
						</td>
					</tr>
					<tr>
						<th scope="row">법률비용지원</th>
						<td>
							<form:checkbox path="law_expense" value="Y" label="가입"/>
							<form:checkbox path="law_expense" value="N" label="미가입"/>
						</td>
					</tr>
					<tr>
						<th scope="row">적재물</th>
						<td>
						<form:checkbox path="luggage_coverage" value="Y" label="가입"/>
						<form:checkbox path="luggage_coverage" value="N" label="미가입"/>
						</td>
					</tr>
					
				</tbody>
			</table>
			<div class="agreetermBox">
				<div class="tblTop mT25">
					<p class="txtPoint pB0">개인정보 수집 및 이용안내</p><br><br>
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
			</div>
			<div class="btn_r_area">
				<a href="/m/deductProduct/privateHwamul/mHwamulInfo.do" class="btn btn-white">취소</a>
				<a href="#;" onclick="registBoard(); return false;" class="btn btn-black">등록</a>
			</div>
		</article>
		</form:form>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>