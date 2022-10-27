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
<c:set var="registerFlag" value="${empty inquiryBoardVO.articleNo ? '등록' : '수정'}"/>
<script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
<validator:javascript formName="inquiryBoardVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="/namo/js/namo_scripteditor.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
/* loading 표시 */
window.onbeforeunload = function (e) {
	var agt = navigator.userAgent.toLowerCase();
		$('div#loading_page').show();
	}
// 글 등록 function  
function registBoard() {
	var f = document.f;
	var html = f.contentHtml.value;
	f.contentText.value = html;	
	//f.phone1.value = f.phoneSelect.options[f.phoneSelect.selectedIndex].value;		
	var email = f.email1.value+"@"+f.email2.value;
	//var phone = f.phone1.value+"-"+f.phone2.value+"-"+f.phone3.value;
	
	var category = f.category.value;
	
	var open_Yn = $("input:radio[name='open_Yn']:checked").val(); // -- 2016.12.13 [H] 수정
	f.open_Yn.value = open_Yn; // -- 2016.12.13 [H] 수정
	/* $("input[name='ReplySms_YN']:checked").each(function() {
		  var ReplySms_YN = $(this).val();
	}); // -- 2016.12.13 [H] 추가
	$("input[name='ReplyEmail_YN']:checked").each(function() {
		  var ReplyEmail_YN = $(this).val();
	}); // -- 2016.12.13 [H] 추가
	f.ReplySms_YN.value = ReplySms_YN; // -- 2016.12.13 [H] 추가
	f.ReplyEmail_YN.value = ReplyEmail_YN; // -- 2016.12.13 [H] 추가 */
	
	//f.phone.value = phone;
	f.email.value = email;
	
	
	if($("#phone_yn").is(":checked")){
		f.phone_yn.value='Y';
	}

	if($("#email_yn").is(":checked")){
		f.email_yn.value='Y';
	}
	var re=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var rp=/^\d{3}-\d{3,4}-\d{4}$/;
	if(category == ""){
		alert("카테고리를 선택해주세요");
		return false;
	}
	if(html == ""){
		alert("내용을 입력해주세요");
		 return false;
	}
	if(!rp.test(phone)){
		alert("연락처를 다시 입력해주세요");		
		return false;
	}     
	if(email.length<6 || !re.test(email)){
		alert("잘못된 이메일 형식입니다.");
		return false;
	}	
	if (f.title.value==null || f.title.value==""){
		alert("제목을 입력해 주세요");
	    f.title.focus();
		return false;
	}
	//if(f.post1.value==null || f.post1.value==""){
	//	alert("우편번호를 입력해주세요");
	//	return false;
	//}
	//if(f.addr.value==""||f.new_addr.value==""){
	//	alert("주소를 입력해주세요");
	//	return false;
	//}

	if(open_Yn=='Y'){
		alert("고객님께서 문의하신 내용이 공개되었습니다.");
	}
	
	// -- 2016.12.13 [H] 추가
	if(!$("#agreeterms").is(":checked")){  
		alert("개인정보 수집 및 이용에 동의해주세요");
		return false;
	} 
	
    f.action = "<c:url value="${registerFlag == '등록' ? '/customer/inquiry/registArticle.do' : '/customer/inquiry/updateArticle.do'}"/>";
    f.submit(); 	
}  
function clearFile(obj){
	obj.value="";
	obj.outerHTML = obj.outerHTML;
}
//체크박스 하나만 선택
function checkOnly(chk){
    var obj = document.getElementsByName("agree");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        };
    };   
}
//이메일
function setEmailTail(emailValue) {   
	var emailTail = document.f.email2;    
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
function searchZip(){
	var addr = "/common/searchZip.do?form_name=f&zip1_name=post1&zip2_name=post2&juso_name=addr&new_juso_name=new_addr";
	window.open(addr,'우편번호검색','toolbar=no,location=no,status=no,menubar=no, scrollbars=auto,resizable=no,width=600,height=600 top=10 left=10');
}

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}

/* 20161208 추가 */
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
});
/* //20161208 추가 */
</script>
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
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/cust/oaoinq_tit.gif" alt="1:1문의" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/customerIndex.do">고객문의</a>
						<span>1:1문의</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/oaoinq_con_tit.gif" alt="궁금한 사항을 남겨 주시면 빠른 시간 내에 답변 드리도록 하겠습니다" /></p>
					<div class="conSection">
					<form:form commandName="inquiryBoardVO" name="f" enctype="multipart/form-data" action="">
					<fieldset>
					<legend>1:1문의게시판</legend>
					<input type="hidden" name="phone" />
					<input type="hidden" name="email" />
					<input type="hidden" name="agreeterms" /> <!-- 2016.12.13 [H] 추가 -->
					<form:hidden path="articleNo"/>
					<form:hidden path="modifyId"/>
					<form:hidden path="modifyName"/>
					<form:hidden path="modifyTime"/>
					<form:hidden path="contentText"/>
					<form:hidden path="writerId" />
					<input type="hidden" name="phone1"/>
						<!-- table writing s -->
						<div class="bbsView1">
							<!-- 테이블 타이틀 s -->
							<!-- 20161208 삭제 
  							<span class="mustHave">&nbsp;&nbsp; 표시가 붙은 항목은 필수입니다.</span>
							//20161208 삭제 -->
  							<p>&nbsp;</p>
							<!-- 20161208 수정 -->
							<div class="tbtitBox">
								<dl>
									<dt>문의분류</dt>
									<dd>
										<form:select id="" path="category" title="문의분류" style="width:150px;">
										    <form:option value="1" label="전체"></form:option>
										    <form:option value="2" label="보상"></form:option>
										    <form:option value="3" label="계약"></form:option>
										    <form:option value="4" label="홈페이지"></form:option>  
										    <form:option value="5" label="장학사업"></form:option>  
										    <form:option value="6" label="기타"></form:option>  
										</form:select>
										<label class="" for="">문의분류를 정확하게 선택 시 더욱 빠르게 처리됩니다.</label>
									</dd>
								</dl>
							</div><!--// 테이블 타이틀 e -->
							<!-- 테이블 s -->
							<table class="tbView_st02 mB5" summary="1:1문의하기 게시판입니다.">
								<caption>1:1문의하기 게시판</caption>
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">업체명&#40;성명&#41;</th>
										<td>
										<c:if test="${not empty name}">
										${name}
										<form:hidden path="writerName" value="${name}"/>
										</c:if>	
										<c:if test="${empty name}">
										<form:input path="writerName" type="text" value="" title="업체명 또는 성명" style="width:150px;" class="inputSt01" /><label for="writerName" class="hide">업체명 또는 성명</label>
										</c:if>
										<form:hidden path="birth" value="${birth}"/>
										</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>
										  <c:if test="${not empty number}">
											${number}
											<form:hidden  path="writerName" value="${number}"/>
											</c:if>	
											<!-- <select id="" name="phoneSelect" title="휴대폰 첫번째 자리">
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
											<label for="phone2" class="hide">휴대폰 두번째 자리</label><input type="text" name="phone2" title="휴대폰 두번째 자리" style="width:55px;" maxlength="4" class="inputSt01" />&#45;
											<label for="phone3" class="hide">휴대폰 세번째 자리</label><input type="text" name="phone3" title="휴대폰 세번째 자리" style="width:55px;" maxlength="4" class="inputSt01" />
										     -->
											<!-- 20161208 추가 -->
											<label class="mL20"><input type="checkbox" name="phone_yn" id="phone_yn" value=""/>SMS 수신은 핸드폰번호인 경우에만 가능합니다.</label>
											<!-- //20161208 추가 -->
										</td>
									</tr>
									<!-- 주소 입력 필드 삭제 -->
									<!--
									<tr>
										<th scope="row">주소</th>
										<td colspan="3">
										<!-- 
											<label class="hide" for="post1">우편번호앞자리</label>
											<form:input path="post1" class="inputSt01" style="width:100px;"  readonly="true"  />
											<span>&#45;</span>
											<label class="hide" for="post2">우편번호뒷자리</label>
											<form:input path="post2" class="inputSt01" style="width:100px;" readonly="true"  />
											<a id="zipPopup" href="#;" onclick="searchZip();" class="btn_pack btn_type15"><span>우편번호</span></a>
											
											<label class="hide" for="addr">기본주소</label>
											<form:input path="addr" class="inputSt01" style="width:600px; margin-bottom:5px; margin-top:5px;"  />
											<label class="hide" for="new_addr">상세주소</label>
											<form:input path="new_addr" class="inputSt01" style="width:600px;"   />
											<form:errors cssClass="formError" path="post1" />
										 	
											<p class="mB3">
											<form:input type="text" path="post1" id="sample4_postcode"  style="width:150px;" value="${resultMap2.POST1}" placeholder="우편번호" />
											<a id="zipPopup" href="#;" onclick="sample4_execDaumPostcode()" class="btn_pack btn_type15"><span>우편번호</span></a>
											</p>
											<p class="mB3">
											<form:input type="text" path="addr" id="sample4_roadAddress" style="width:500px;" value="${resultMap2.NEW_JUSO}"  placeholder="도로명주소" />
										    </p>
										    <p>
											<form:input type="text" path="new_addr" id="sample4_jibunAddress" style="width:500px;" value="${resultMap2.COMJUSO}"  placeholder="지번주소" />
											<span id="guide" style="color:#999"></span>
											</p>
											<p>
											</br>※ 주소는 도로명주소와 지번주소 둘 중 한 개만 입력하면 됩니다.
											</p>
										</td>
									</tr> --> 
									<!-- 주소 입력 필드 삭제 -->
									<tr>
										<th scope="row">E&#45;mail</th>
										<td colspan="3">
											<label for="" class="hide"></label><input name="email1" id="" type="text"  value="" class="inputSt01" style="width:230px;" />&#64;
											<label for="" class="hide">이메일계정입력</label><input name="email2" title="이메일 계정입력" id="" type="text"  value="" class="inputSt01" style="width:150px;" />
											<select name="emailCheck" title="이메일 계정 선택" id="emailDomain" onchange="setEmailTail(emailCheck.options[this.selectedIndex].value)">
											    <option value="notSelected" >::선택하세요::</option>
											    <option value="etc">직접입력</option>
											    <c:forEach items="${emailList}" var="email">
											    	<option value="${email.CODE}">${email.CODE_NM}</option>
											    </c:forEach>
										    </select>
											<!-- 20161208 추가 -->
											<label class="mL20"><input type="checkbox" name="email_yn" id="email_yn"  value=""/> 답신여부를 이메일로 받음</label>
											<!-- //20161208 추가 -->
										</td>
									</tr>
									<tr>
										<th scope="row">상담제목</th>
										<td colspan="3"><label for="" class="hide">상담제목</label><form:input path="title" id="" type="text"  value="" class="inputSt01" title="상담제목" style="width:600px;" /></td>
									</tr>
									<tr>
										<th scope="row">내용</th>
										<td colspan="3" class="textarea01" style="width:600px;height:200px;" name="문의내용">
										<form:textarea path="contentHtml" style="height:250px"></form:textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">공개여부</th>
										<td colspan="3">
											<!-- 20161208 삭제 
											<select id="" name="openSelect" title="공개여부">
											    <option value="N">비공개</option>
											    <option value="Y">공개</option>
											</select>
											//20161208 삭제 -->
											<!-- 20161208 추가 -->
											<label><input type="radio" name="open_Yn" id="open_Yn" value="Y" /> 공개</label> <!-- 2016.12.13 [H] id.name.value 추가 -->
											<label class="mL20"><input type="radio" name="open_Yn" id="open_Yn" checked="checked" value="N" /> 비공개</label><!-- 2016.12.13 [H] id.name.value 추가 -->
											<!-- //20161208 추가 -->
											<!-- 20161208 수정 -->
											<span class="mL20">※ '공개' 선택 시 작성된 내용은 불특정 다수가 볼 수 있음을 유념하시기 바랍니다.</span>
											<!-- //20161208 수정 -->
										</td>
									</tr>
									<tr>
										<th scope="row">첨부파일</th>
										<td colspan="3">
										<label for="egovComFileUploader" class="hide">첨부파일</label><input name="fileadd" id="egovComFileUploader" type="file" title="첨부파일입력" class="inputSt01"/>
										</td>
									</tr>
								</tbody>
							</table><!--// 테이블 e -->
							<!-- //20161208 수정 -->

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

							<!-- 20161208 삭제 
							<table class="tbDetail_st01 mB5" summary="개인정보 수집 및 이용안내 테이블 입니다.">
								<caption>개인정보 수집 및 이용안내에 대해서 나타낸 표</caption>
								<colgroup>
									<col style="width:40%;" />
									<col style="width:30%;" />
									<col style="width:30%;" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">목적</th>
										<th scope="col">항목</th>
										<th scope="col">보유 및 이용기간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>문의 내용에 대한 답변 메일 발송 및 처리내역 확인</td>
										<td>핸드폰 번호 및 이메일</td>
										<td>별도 요청 시까지</td>
									</tr>
								</tbody>
							</table><!--// 개인정보 수집 및 이용안내 표 e 
							
							<div class="alarm">문의하신 내용은 개인이메일 및 홈페이지에서 확인하실 수 있습니다&#46;</div>
							//20161208 삭제 -->
							<!-- 20161208 수정 -->
							<!-- 버튼 -->
							<div class="btnboxR clfix mT30">	
								<span class="btn_pack btn_type19"><a href="#;" onclick="registBoard(); return false;">문의등록</a></span>
								<span class="btn_pack btn_type20"><a href="/customer/inquiry/oaoInquiryIndex.do">취소</a></span>
							</div>
							<!-- //20161208 수정 -->
						</div>
						<!--// table writing e -->
					</fieldset>
					</form:form>
					</div>
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>

