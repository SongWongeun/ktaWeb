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

// 글 등록 function  
function registBoard() {
	var f = document.f;
	var content = f.contentHtml.value;
	f.contentText.value = content;
	var phone1 = f.phoneSelect.options[f.phoneSelect.selectedIndex].value;		
	var phone = phone1+"-"+f.phone2.value+"-"+f.phone3.value;
	f.phone.value = phone;
	
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
	var email = f.email01.value;
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if(!re.test(email)){ 
		alert("유효하지 않은 email입니다. 확인해주세요."); f.email01.value = ""; 
		f.email01.focus();
		return false;
	}
	if(f.title.value == ""){ 
		alert("제목을 입력해주세요."); 
		f.title.focus();
		return false; 
	}
	if(f.accnt_no.value == ""){
		alert("사고번호를 입력해주세요.");
		f.accnt_no.focus();
		return false;
	}
	if(f.car_no.value == ""){
		alert("사고차량번호를 입력해주세요.");
		f.car_no.focus();
		return false;
	}
	if(f.accnt_name.value == ""){
		alert("피해자명을 입력해주세요.");
		f.accnt_name.focus();
		return false;
	}
	if(content == ""){ 
		alert("내용을 입력해주세요."); 
		f.contentHtml.focus();
		return false; 
	}
	if(!$("#agreeterms").is(":checked")){  
		alert("개인정보 수집 및 이용에 동의해주세요");
		return false;
	}
	
	if($("#phone_yn").is(":checked")){
		f.phone_yn.value='Y';
	}

	if($("#email_yn").is(":checked")){
		f.email_yn.value='Y';
	}
	
    f.action = "<c:url value='/m/customer/praise/actRegist.do'/>";
    f.submit(); 	
} 
function listPraiseBoard() {
   	document.boardForm.action = "<c:url value='/customer/praise/praiseListIndex.do'/>";
   	document.boardForm.submit();		
}
function maxLengthCheck(object){
   if (object.value.length > object.maxLength){
    object.value = object.value.slice(0, object.maxLength);
   }    
}

function searchZip(){
	var addr = "/m/common/searchZip.do?form_name=f&zip1_name=post1&zip2_name=post2&juso_name=addr&new_juso_name=new_addr";
	window.open(addr,'우편번호검색','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=600,height=600 top=10 left=10');
}

$(document).ready(function(){
	//개인정보 수집 및 이용 안내
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
})

</script>
<style>
	.agreetermBox {
		padding : 10px;
	}
	
	.yn_button {
		font-size:13px;
		vertical-align:0px;
	}
	input[type="checkbox"]{
		height:16px;
		width:15px;
	}
	
	
</style>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path02">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/customer/index.do">고객광장</a></li>
			<li><a href="/m/customer/praise/list.do">칭찬합시다</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
	<form:form commandName="praiseBoardVO" name="f" id="f" enctype="multipart/form-data">
	<input type="hidden" name="phone" />	
	<form:hidden path="articleNo"/>
	<form:hidden path="modifyId"/>
	<form:hidden path="modifyName"/>
	<form:hidden path="modifyTime"/>
	<form:hidden path="contentText"/>
	<form:hidden path="writerId" />
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i02"><img alt="클린센터" src="/images/m_truck/subtop/02top_2.png" /></li>
				<li class="txt01">소중한 칭찬글은 업무 담당자, 직원들에게 큰 힘이 됩니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont05">
			<table class="tbSt02">
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tbody>				
					<tr>
						<th scope="row"><span class="bulSt04">제목</span></th>
						<td><form:input path="title" type="text" class="input" id="" name="" value="" title="제목" style="width:100%;"/></td>
					</tr>				
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
							<br>
							<label class ="yn_button"><input type="checkbox" name="phone_yn" id="phone_yn" value=""/> SMS 수신은 핸드폰번호인 경우에만 가능합니다.</label>
						</td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">E-mail</span></th>
						<td><form:input path="email" type="text" class="input" id="email01" name="email01" value="" title="이메일 입력"  style="width:100%;"/>
							<br>
							<label class ="yn_button"><input type="checkbox" name="email_yn" id="email_yn" value=""/> 답신여부를 이메일로 받음</label>
						</td>
						
					</tr>				
					<tr>
						<th scope="row"><span class="bulSt04">사고번호</span></th>
						<td><form:input path="accnt_no" type="text" class="input" id="accnt_no" name="accnt_no" value="" title="사고번호"  style="width:100%;"/></td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">사고차량번호</span></th>
						<td><form:input path="car_no" type="text" class="input" id="car_no" name="car_no" value="" title="사고차량번호"  style="width:100%;"/></td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">피해자명</span></th>
						<td><form:input path="accnt_name" type="text" class="input" id="accnt_name" name="accnt_name" value="" title="피해자명"  style="width:100%;"/></td>
					</tr>
					<tr>
						<th scope="row"><span class="bulSt04">내용</span></th>
						<td><form:textarea path="contentHtml" id="" name="" class="textarea" style="width:100%;"/></td>
					</tr>
					
				</tbody>
			</table>
			<div class ="agreetermBox">
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
				<a href="/m/customer/praise/list.do" class="btn btn-white">취소</a>
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