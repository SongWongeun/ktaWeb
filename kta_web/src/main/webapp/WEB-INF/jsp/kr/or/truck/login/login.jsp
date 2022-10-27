<%@page import="crosscert.Hash"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript" src="/js/commonFunction.js" ></script>
<script language="javascript" src="/cert/init.js"></script>

<c:choose>
	<c:when test="${param.idpwFailCount != null}">
		<script type="text/javascript">
			var idpwFailCount = ${param.idpwFailCount};
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			var idpwFailCount = 0;
		</script>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
window.name ="Parent_window";

$(document).ready(function(){
	
	//$('div.supportCont.clfix.cert').show();
	$('div.supportCont.clfix.cert').hide();
	$('div.supportCont.clfix.idpw').hide();
	//$('div.supportCont.clfix.idpw').hide();
	
	/* -- 2016.12.08 [HYEON] 추가 -- */
	if(idpwFailCount >=1){
		$("#idpwFailCount").val(idpwFailCount);
	}
	
	/* -- 2016.12.16 [HYEON] 추가 -- */
	$("#memTarger").click(function(){
		document.faqNoticeView.articleNo.value='FAQST_00000000000033';
		document.faqNoticeView.submit();
	});
	$("#noJoin").click(function(){
		document.faqNoticeView.articleNo.value='FAQST_00000000000034';
		document.faqNoticeView.submit();
	});
	$("#howContact").click(function(){
		document.faqNoticeView.articleNo.value='FAQST_00000000000035';
		document.faqNoticeView.submit();
	});
	
	
	
	<%-- id/pw 로그인 submit event --%>
	$('#fIdpw div.logCont02 p.btn_login a').on('click',function(e){
		e.preventDefault();
		
		
		/* 2016.12.01 [H]  주석처리
		if( !/[1|2|3]/g.test( $('#fIdpw #agentCd:checked').val() ) ) {
			alert('회원유형을 선택해 주세요.');
			return false;
		}  */
		
		if( $('#fIdpw #id').val() == '' ) {
			alert('ID를 입력해주세요.');
			return false;
		}
		if( $('#fIdpw #password').val() == '' ) {
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		
		if( $('div.capchaBox').is(':hidden')){
			$('form#fIdpw').submit();
		}
		
		/* -- 2016.12.08 [HYEON] captcha 부분 끌어옴 -- */	
		if( $('div.capchaBox').is(':visible')){
	      if ( !$('#answer').val() ) {
	           alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
	      } else {
	           $.ajax({
	               url: '/CaptchaSubmit.do',
	               type: 'POST',
	               dataType: 'text',
	               data: 'answer=' + $('#answer').val(),
	               async: false,  
	               success: function(resp) {
	                    //alert(resp);
	                    
	                    if (resp.trim() == 'Y') {
	                    	$('form#fIdpw').submit(); /* -- 2016.12.08 [HYEON] SUCCESS 부분 & CaptchaSubmit.jsp "일치하지않습니다" -> "N" 이런식으로 수정 -- */
	                    }else{
		                   $('#reLoad').click();
			               $('#answer').val('');
	                    }
	              }
	         });
	      }
		}
		
	});

	
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});
	<%-- 로그인 엔터키 설정--%>
	$('form#fIdpw input[name="password"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			$('#fIdpw div.logCont02 p.btn_login a').click();
			return false;
		}
	});
	
	$('div.supportCont.clfix.cert input[name="agentCd"]').on('change',function(){
		$('div.supportCont.clfix.idpw input[name="agentCd"][value="'+$(this).val()+'"]').click(); 
	});
	
	
	$('input[name="selectCert"]').on('change',function(){
		var selectCert = $('input[name="selectCert"]:checked').val();
		if( selectCert == 'j'){
			$('input#idn1').val('');
			$('input#idn2').val('');
			$('#cert_saup').hide();
			$('#cert_jumin').show();
		}else if( selectCert == 's'){
			$('input#s_idn1').val('');
			$('input#s_idn2').val('');
			$('input#s_idn3').val('');
			$('#cert_saup').show();
			$('#cert_jumin').hide();
		}
	});
	
	if(getCookie('loginIdSaveAt')=='true'){
		document.fIdpw.loginIdSaveAt.checked = 'true';
		document.fIdpw.id.value = getCookie('loginIdSaveId');
	}
});

function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword.trim() == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "<c:url value='/main/totalSearch.do'/>";
   	document.searchForm.submit();
	}
}

function SignData(){
    

	// 환경설정 함수 콜
	init();
	var ret;
	var signeddata, textin;
	var userdn, EncR;

	if( document.fCert.src.value == null || document.fCert.src.value == "" )
	{
		alert("서명할 데이타를 넣어주십시요");
		return;
	}



	// 인증서 선택창 초기화 및 선택된 인증서의 DN 추출
	// DN은 인증기관에서 유니크한 것임.
	userdn = document.CC_Object_id.GetUserDN();
	if( userdn == null || userdn == "" )
	{ 
		
		return;
	}
	else
	{

		// 전자서명 생성
		// BSTR *SignData(BSTR Source, BSTR HashAlgo, BSTR Password);
		// parameters : 
		//   Source : 전자서명할 메세지
		//   HashAlgo : 서명 알고리즘 ("SHA1", "MD5") ==> SHA1이 표준
		//   Password : 개인키 복호를 위한 패스워드
		// return value : 생성된 전자서명 값
		// 참 고 : 암호를 넣지 않았을 경우에는 암호 입력 다이얼로그 박스에 입력한다.
		signeddata = document.CC_Object_id.SignData( document.fCert.src.value, "SHA1", "");

		if( signeddata == null || signeddata == "" )
		{
			errmsg = document.CC_Object_id.GetErrorContent();
			errcode = document.CC_Object_id.GetErrorCode();
			alert( "SignData :"+errmsg );
			return;
		}
		else
		{

			getR = CC_Object_id.GetRFromKey(userdn, "");
			if (getR == "")
			{
				alert("주민번호/사업자번호를 확인할 수 없는 인증서입니다.");
				return;
			}


			ret = CC_Object_id.ValidCert_VID(userdn, getR, document.fCert.idn.value);
			if (ret == "0")
			{
				//alert("신원확인 성공");
				
			}
			else
			{
				alert("본인확인을 실패하였습니다.");	
				return false;
			}
			
			document.fCert.userR.value =  getR;

			if (document.fCert.idn.value == "")
			{
				//alert("주민 또는 사업자번호 입력 요망");
				alert("주민번호를 정확히 입력해주세요.");
				return;
			}

			document.fCert.signeddata.value = signeddata;
			//document.fCert.action = "login_check.jsp";
			//document.fCert.method = "post";
			document.fCert.submit();
			
		}
	}
}
function windowOpen(){
	window.open("/main/guidePopup.do",'','toolbar=no,location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=700,height=480 top=20 left=20');
}


function winPlayer(objUrl) {
	  $('#audiocatpch').html(' <bgsound src="' + objUrl + '">');
}

	 
</script>
<c:if test="${param.code == 'noLegacy'}">
<script type="text/javascript">
$(window).load(function(){
	alert('가입된 조합원정보와 홈페이지정보가 \n일치하지 않습니다.\n\n[홈페이지 문의] \n02-3483-3800 \nweb_master@truck.or.kr');
});
</script>
</c:if>
<c:if test="${param.code == 'loginIPINFail' || param.code == 'loginHPFail' || param.code == 'loginNAMEFail' || param.code == 'loginCERTFail'}">
<script type="text/javascript">
$(window).load(function(){
	alert('화물공제조합에 등록되지 않은 사용자입니다.');
});
</script>
</c:if>
<c:if test="${param.code == 'lockingID'}"> <!-- 2016.12.09 [HYEON] 추가 -->
<script type="text/javascript">
$(window).load(function(){
	alert('잠겨있는 아이디 입니다.\n\n[홈페이지 문의] \n02-3483-3800 \nweb_master@truck.or.kr');
});
</script>
</c:if>
<c:if test="${param.code == 'loginIDPWFail'}">
<script type="text/javascript">
$(window).load(function(){
	alert('화물공제조합에 등록되지 않은 아이디이거나, \n아이디 또는 비밀번호를 잘못 입력하셨습니다.');
});
</script>
</c:if>
<c:if test="${param.code == 'certFail'}">
<script type="text/javascript">
$(window).load(function(){
	alert('공인인증서 로그인 오류입니다.');
});
</script>
</c:if>
<c:if test="${param.code == 'alterSuccess'}">
<script type="text/javascript">
$(window).load(function(){
	alert('비밀번호가 변경되었습니다.');
});
</script>
</c:if>

<!-- 2016.12.09 [HYEON] 추가 -->
<c:if test="${param.idpwFailCount == '5'}">
<script type="text/javascript">
$(window).load(function(){
	alert('로그인이 5번 실패하셨습니다.\n\n[홈페이지 문의] \n02-3483-3800 \nweb_master@truck.or.kr');
	location.href="/main/index.do";
});
</script>
</c:if>

<style type="text/css">
	#certPopupLayer{
		background: url("/images/truck/com/overlay.png") repeat 0% 0%;
		position: fixed;
		left: 0px;
		top: 0px;
		text-align: center;
		z-index: 90000;
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body>
	<div class="skipMenu"  title="스킵메뉴" >
		<a href="#Gnb">대메뉴 바로가기</a>
		<a href="#Contents">컨텐츠 바로가기</a>
	</div>
	<div id="wrap">
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- 20161130 삭제
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
						//20161130 삭제 -->
						<!-- <li><a href="#;"><img src="/images/truck/main/util01.gif" alt="직원마당" /></a></li> -->
						<c:choose>
							<c:when test="${not empty loginVO }">
								<li><a href="/netCounter/memberPage/myPage/myInfo.do"><img src="/images/truck/main/util04.gif" alt="마이페이지" /></a></li>
							<li><a href="/logout.do"><img src="/images/truck/main/logout.gif" alt="로그아웃" /></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/join/terms/view.do"><img src="/images/truck/main/util02.gif" alt="회원가입" /></a></li>
								<li><a href="/login.do"><img src="/images/truck/main/util03.gif" alt="로그인" /></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
					<div class="gnbSubGo">
						<a href="/main/guide.do"><img src="/images/truck/main/guide.gif" alt="이용안내가이드" /></a>
						<!-- 20161214 삭제 
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						//20161214 삭제 -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="">
						<fieldset>
						<legend>통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
							<a class="btn_ut_search" href="#;" onclick="totalSearch();"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
						</fieldset>
						</form>
					</div>
				</div>
				<!-- gnb s --><!-- subDep01까지만 노출 depth03부터는 display:none과 display:block로 컨트롤  -->
				<div class="gnb" id="Gnb">
					<ul class="gnbList">
						<li class="gnb1Dep01 "><a class="menu1" href="/netCounter/memberPage/myPage/myInfo.do"><span class="hide">인터넷창구</span></a>
						</li><!--// gnb1Dep01 인터넷창구 e -->
						<li class="gnb1Dep02 "><a class="menu2" href="/infoLounge/infoLoungeIndex.do"><span class="hide">정보마당</span></a>
						</li><!--// gnb1Dep02 정보마당 e -->
						<li class="gnb1Dep03 "><a class="menu3" href="/deductProduct/deductProductIndex.do"><span class="hide">공제상품</span></a>
						</li><!--// gnb1Dep03 공제상품 e -->
						<li class="gnb1Dep04 "><a class="menu4" href="/customer/customerIndex.do"><span class="hide">고객광장</span></a>
						</li><!--// gnb1Dep04 고객광장 e -->
						<li class="gnb1Dep05"><a class="menu5" href="/assocIntroduce/assocIntroduceIndex.do"><span class="hide">조합소개</span></a>
						</li><!--// gnb1Dep05 조합소개 e -->
						<li class="gnb1Dep06 "><a class="menu6" href="/cyberPr/cyberPrIndex.do"><span class="hide">사이버홍보관</span></a>
						</li><!--// gnb1Dep06 사이버홍보관 e -->
					</ul>
					<!-- 컨트롤버튼 -->
					<!-- <a href="#;" title="메뉴열기버튼" class="btn_memuopen" ><span class="hide">메뉴열기</span></a>
					<a href="#;" title="메뉴를 고정시킵니다." class="btn_pause pause_on" ><span>고정</span></a> --><!-- 고정버튼 눌렀을 경우 class명 pause_on 추가 -->
					<a href="#;" title="메뉴를 닫습니다." class="btn_close" ><span>닫기</span></a>
				</div><!-- // gnb e -->
			</div>
		</div>
		<hr />
		<!--// header e -->
		
		<!-- container s -->
		<div id="container">
			<div class="contents" id="Contents">
				<div class="conTitle">
					<div class="title">
 						<h2><img src="/images/truck/net/log_tit.gif" alt="로그인" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>로그인</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/log_con_tit.gif" alt="화물공제조합 방문을 환영합니다 로그인 하시면 공제계약관련 보상처리 내역 및 거래처의 거래내역 조회서비스를 보다 편리하게 이용하실 수 있습니다" /></p>
					<div class="conSection">
						<div class="clfix cert"><%-- cert class 추가 --%>	<!-- 20161201 수정 -->
							<p class="consecTit"><img src="/images/truck/net/log_sub_tit01.gif" alt="본인인증으로 안전하고 편리한 인터넷창구 서비스" /></p>
	
							<!-- 20161201 수정 -->
							<div class="roundBox">
								<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
								<div class="loginArea clfix">
								
									<!-- 아이디 로그인 -->
									<form id="fIdpw" name="fIdpw" action="/actIdpwLogin.do" method="post">
									<input type="hidden" id="idpwFailCount" name="idpwFailCount" value="0" />
									<div class="logCont02">
										<h3>아이디 로그인</h3>
										<dl>
											<dt><label for="id">아이디</label></dt>
											<dd><input name="id" class="txt" id="id" type="text" value=""/></dd>
											<dt><label for="password">비밀번호</label></dt>
											<dd><input name="password" class="txt" id="password" type="password" value=""/></dd>
										</dl>
										<span class="idSave" style="display:inline;">
											<input name="loginIdSaveAt" id="loginIdSaveAt" type="checkbox" value="" />
											<label for="loginIdSaveAt">아이디 저장</label>
										</span>
										<p class="btn_login"><a href="#;"><img src="/images/truck/btn/btn_log02.gif" alt="로그인" /></a></p>	<!-- 20161206 수정 -->
										<!-- 버튼-->
										<div class="btnFind">
											<a href="/login/findInfoId.do">아이디 찾기</a>
											<a href="/login/findInfoPw.do">비밀번호 찾기</a>
										</div>
										</form>
										<!-- 버튼 -->
										 <!-- 로그인 3회 실패시 캡챠 노출 -->
										<div class="capchaBox" style="display: none;">
											<span class="txtPoint06">아래 이미지의 보안문자를 입력하세요.</span>
											<div class="img">
												<div id="catpcha">Wait...</div>
  												<div id="audiocatpch" style="display: none;"></div>
											</div>
											<div class="btn">
												<a href="# return false;" id='soundOn'><img src="/images/truck/net/btn_capcha_voice.gif" alt="" /></a>
												<a href="# return false;" id='reLoad'><img src="/images/truck/net/btn_capcha_refresh.gif" alt="" /></a>
											</div>
											<input type="text" name="" id="answer" placeholder="보안문자 입력" style="width:133px;" />
										</div>
										
									</div>
								</div>
								<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
							</div>
						</div>
							
					</div><!--// conSection e -->
					<div class="loginHelp clfix">
						<div class="helpInfo">
							<h3>분담금 카드결제 안내</h3>
							<p>분담금 카드 결제 및 확인 하고자 하는경우 <b>신용카드수납시스템</b>에서 로그인 없이 바로 이용 가능합니다&#46;</p>
							<div class="btnbox"><span class="btn_pack btn_type09 icon" style="margin-right:-70px"><span class="det"></span><a href="https://card.truck.or.kr" target="_blank">카드수납시스템 바로가기</a></span></div>
						</div>
		
						<div class="helpQna">
							<h3>자주하는 질문</h3>
							<p class="more"><a href="/customer/faqNoticeIndex.do">더보기</a></p>
							<!-- 20161201 수정 -->
							<ul class="qnaBanner">
								<li><a href="#" id="memTarger"><img src="images/truck/net/img_ques_banner01.gif" alt="인터넷 회원의 대상이란" /></a></li>
								<li><a href="#" id="noJoin"><img src="images/truck/net/img_ques_banner02.gif" alt="회원가입이 이루어지지않아요." /></a></li>
								<li><a href="#" id="howContact"><img src="images/truck/net/img_ques_banner03.gif" alt="계약/보상조회는 어떻게 이루어지나요?" /></a></li>
							</ul>
							<form id="faqNoticeView" name="faqNoticeView" action="/customer/loginUnder/faqNoticeView.do" method="post">
								<input type="hidden" id="articleNo" name="articleNo" value="" />
								<input path="searchCategory" type="hidden" id="faqCategory" name="faqCategory" value="3"/>
							</form>
							
						</div><!--// 자주하는 질문 -->
					</div><!--// loginHelp e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
	
	<object id="CC_Object_id"
      classid="CLSID:A099920B-630C-426B-91EC-737685CEEE17"
	  codebase="/cert/AxCrossCert.cab#Version=2,6,4,0"
      width= Document.body.clientWidth
      height= Document.body.clientHeight>
	</object>
</body>
</html>