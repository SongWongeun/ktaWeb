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
	f.phone1.value = f.phoneSelect.options[f.phoneSelect.selectedIndex].value;		
	var email = f.email1.value+"@"+f.email2.value;
	var phone = f.phone1.value+"-"+f.phone2.value+"-"+f.phone3.value;
	var category = f.category.value;
	
	//var open_Yn = $("input:radio[name='open_Yn']:checked").val(); // -- 2016.12.13 [H] 수정
	//f.open_Yn.value = open_Yn; // -- 2016.12.13 [H] 수정
	/* $("input[name='ReplySms_YN']:checked").each(function() {
		  var ReplySms_YN = $(this).val();
	}); // -- 2016.12.13 [H] 추가
	$("input[name='ReplyEmail_YN']:checked").each(function() {
		  var ReplyEmail_YN = $(this).val();
	}); // -- 2016.12.13 [H] 추가
	f.ReplySms_YN.value = ReplySms_YN; // -- 2016.12.13 [H] 추가
	f.ReplyEmail_YN.value = ReplyEmail_YN; // -- 2016.12.13 [H] 추가 */
	
	f.phone.value = phone;
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
	
	if(!$("#agreeterms").is(":checked")){  
		alert("개인정보 수집 및 이용에 동의해주세요");
		return false;
	} 
	
    f.action = "<c:url value="${registerFlag == '등록' ? '/customer/fraud/registFraudArticle.do' : '/customer/fraud/updateFraudArticle.do'}"/>";
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
 						<h2><img src="/images/truck/cust/oaofraud_tit.gif" alt="보험사기신고" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/customer/customerIndex.do">고객문의</a>
						<span>보험사기신고</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/cust/oaofraud_con_tit.gif" alt="보험사기 제보내역을 남겨 주시면 빠른 시간 내에 답변 드리도록 하겠습니다" /></p>
					<div class="conSection">
					<form:form commandName="inquiryBoardVO" name="f" enctype="multipart/form-data" action="">
					<fieldset>
					<legend>보험사기신고</legend>
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
					<input type="hidden" name="open_Yn"/>
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
										    <form:option value="10" label="보험사기 신고"></form:option>
										</form:select>
										<label class="" for="">&nbsp;</label>
									</dd>
								</dl>
							</div><!--// 테이블 타이틀 e -->
							<!-- 테이블 s -->
							<table class="tbView_st02 mB5" summary="보험사기 신고 게시판입니다.">
								<caption>보험사기 신고</caption>
								<colgroup>
									<col style="width:17%;" />
									<col style="width:83%;" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">성명</th>
										<td>
										<c:if test="${not empty name}">
										${name}
										<form:hidden path="writerName" value="${name}"/>
										</c:if>	
										<c:if test="${empty name}">
										<form:input path="writerName" type="text" value="" title="성명" style="width:150px;" class="inputSt01" /><label for="writerName" class="hide">업체명 또는 성명</label>
										</c:if>
										<form:hidden path="birth" value="${birth}"/>
										</td>
									</tr>
									<tr>
										<th scope="row">연락처</th>
										<td>
											<select id="" name="phoneSelect" title="휴대폰 첫번째 자리">
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
											<!-- 20161208 추가 -->
											<label class="mL20"><input type="checkbox" name="phone_yn" id="phone_yn" value=""/>SMS 수신은 핸드폰번호인 경우에만 가능합니다.</label>
											<!-- //20161208 추가 -->
										</td>
									</tr>
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
										<th scope="row">신고제목</th>
										<td colspan="3"><label for="" class="hide">신고제목</label><form:input path="title" id="" type="text"  value="" class="inputSt01" title="상담제목" style="width:600px;" /></td>
									</tr>
									<tr>
										<th scope="row">내용</th>
										<td colspan="3" class="textarea01" style="width:600px;height:200px;" name="문의내용">
										<form:textarea path="contentHtml" style="height:250px"></form:textarea>
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
								<p class="txtPoint pB0">개인(신용)정보 수집·이용 및 제공 동의서</p>
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
							
							<p class="txtPoint01" style="margin-top:35px;"> <b>■ 유의사항</b></p>
							<div class="roundBox02" style="margin-top:5px;">
								<div class="round02"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
								<!-- 내용 -->
								<div class="lossSide4">
									<ul class="lossListst01" style="padding:18px 22px 20px 22px;">
										<li>신고내용은 보험사기 조사의 기초자료로 활용됩니다.</li>
										<li>신고자의 개인정보는 비밀보장을 원칙으로 합니다.</li>
										<li>보험사기 이외의 민원, 고충사항은 관련부서로 이첩됩니다.</li>
										<li>신고서 작성 시 관련 내용을 6하 원칙에 맞게 구체적으로 작성해주시기 바랍니다.</li>
										   
									</ul>
								</div>							
								<div class="round02"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
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
								<span class="btn_pack btn_type19"><a href="#;" onclick="registBoard(); return false;">신고등록</a></span>
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

