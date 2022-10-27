<%@page import="Kisinfo.Check.IPINClient"%>
<%@page import="NiceID.Check.CPClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	$('#confirmUseTerms').parent().find('label').on('click',function(e){
		$('#confirmUseTerms').click();
	});
	
	$('#confirmPrivacy').parent().find('label').on('click',function(e){
		$('#confirmPrivacy').click();
	});
	
	$('#nameCheck').on('click',function(e){
		e.preventDefault();
		if( $('#confirmUseTerms:checked').size() == 0 ){
			alert('이용약관에 동의해 주세요.');
			return false;
		}
		if($('#confirmPrivacy:checked').size() == 0 ){
			alert('개인정보 수집 및 이용에 동의해 주세요.');
			return false;
		}
		//네이체크 본인인증
		//var w = 600;
		//var h = 500;
		//window.open('/nc.do', 'popupNameCheck', 'width=584, height=514, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		location.href='/join/terms/realNameAuthentication.do';
	});
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			
			searchForm();
			return false;
		}
	});
	<%-- 레이어팝업 닫기 --%>
	$('a#closePopup').on('click',function(){
		$('#typePopupLayer').hide();
	});
	<%-- 지부 선택 보이기/안보이기 설정 --%>
	$('input[name="agent_cd"]').on('change',function(e){
		var a = $('input[name="agent_cd"]:checked').val();
		if( a == '2' ){
			$('#cert_saup').hide();
			$('#jibuSelect').hide();
		}else if( a == '3' ){
			$('#cert_saup').show();
			$('#jibuSelect').hide();
		}else{
			$('#cert_saup').show();
			$('#jibuSelect').show();
		}
	});
	
	
});
function typeSelecter(){
	$('#typePopupLayer').show();
}

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
</script>
<style type="text/css">
	#typePopupLayer{
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
		<%-- <!-- header s --><c:import url="/common/include/subHeader.do"></c:import><!--// header e --> --%>
		<!-- header s -->
		<div id="headerWrap" style="height:133px;"><!-- 메뉴열기버튼 클릭시 높이값 305px로 변경 -->
			<div class="header" >
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<!-- <li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li> -->
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
						<!-- <a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a> -->
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<form name="searchForm" method="post" action="">
						<fieldset>
							<legend>회원가입 통합검색</legend>
							<input type="hidden" name="searchKeywordT"/>
							<span class="ut_search"><label for="">검색어</label><input type="text" name="searchKeywordTotal" id="searchKeywordTotal" title="검색어 입력" /></span>
							<a class="btn_ut_search" href="#;" onclick="totalSearch(); return false;"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
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
 						<h2><img src="/images/truck/net/join_tit.gif" alt="회원가입" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<span>회원가입</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/net/join_con_tit.gif" alt="화물공제조합 방문을 환영합니다 회원가입을 위해서 아래 이용약관 개인정보 수집 및 이용에 대한 안내를 읽고 동의해 주세요" /></p>
					<!-- 20161130 추가 -->
					<div class="joinStep">
						<img src="/images/truck/net/img_join_step01.gif" alt="약관동의, 실명인증, 사업자 정보확인, 회원정보 확인 중 약관동의 단계" />	<!-- 20161206 수정 -->
					</div>
					<!-- //20161130 추가 -->
					<div class="conSection">
						<h3 class="netsubTit"><span class="greenBul">이용약관</span></h3>
						<div class="agreeWrap">
							<div class="agreeBox">
								<div class="txtWrap">
									<h4>제1조 &#91;목 적&#93;</h4>
									<p class="pB20">본 약관은 화물공제에서 제공하는 서비스에 대한 사항을 규정하여  회원과 공제조합간의 상호신뢰 증진을 목적으로 합니다&#46;</p>
									<h4>제2조 &#91;용어의 정의&#93;</h4>
									<ol class="liSt01 pB20">
										<li>홈페이지란 회사가 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 이용자에게 제공하고 거래할 수 있도록 설정한 가상의 영업장을 말한다&#46;</li>
										<li>이용자란 &#34;홈페이지&#34;에 접속하여 이 약관에 따라 &#34;홈페이지&#34;가 제공하는 서비스를 받는 회원 및 비회원을 말한다&#46;</li>
										<li>회원이라 함은 &#34;홈페이지&#34;에 개인정보를 제공하여 회원등록을 한 자로서&#44; &#34;홈페이지&#34;의 정보를 지속적으로 제공받으며 &#34;홈페이지&#34;가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말한다&#46;</li>
										<li>비회원이라 함은 회원에 가입하지 않고&#34;홈페이지&#34;가 제공하는 서비스를 이용하는 자를 말한다&#46;</li>
										<li>게시물이라 함은 회원이 홈페이지를 이용함에 있어서 홈페이지에 게시한 부호&#44; 문자&#44; 음성&#44; 음향&#44; 화상&#44; 동영상 등의 정보 형태의 글&#44; 사진&#44; 동영상 및 각종 파일과 링크 등을 의미한다&#46;</li>
									</ol>
									<h4>제3조 &#91;약관의 효력과 변경&#93;</h4>
									<ol class="liSt01 pB20">
										<li>본 약관의 내용은 서비스 화면에 게시하거나 이용자에게 공시함으로써 그 효력이 발생합니다&#46;</li>
										<li>공제조합은 본 약관을 변경할 수 있으며&#44; 변경된 약관은 제 1항과 동일한 방법으로 공지함으로써 효력이 발생합니다&#46;</li>
									</ol>
									<h4>제4조 &#91;약관외 준칙&#93;</h4>
									<ol class="liSt01 pB20">
										<li>본 약관에 명시되지 않은 사항은 전자거래 기본법&#44; 전자서명법&#44; 통신판매법 및 기타 관계법령의 규정을 따릅니다&#46;</li>
									</ol>
									<h4>제5조 &#91;회원가입 및 탈퇴&#93;</h4>
									<ol class="liSt01 pB20">
										<li>회원가입은 조합원사가 회원가입을 신청하고 회원약관에 동의함으로써 성립됩니다&#46;</li>
										<li>회원가입은 한 조합원사가 회원번호&#40;ID&#41; 하나만을 갖는 것을 원칙으로 합니다&#46;</li>
										<li>회원은 회원가입 신청시 기재한 사항이 변경되었을 경우에는 온라인을 통해 수정할 수 있으나 아이디는 변경이 불가능하므로 작성시 주의해야 합니다&#46;</li>
										<li>회원 가입시 작성하는 모든 회원 정보들은 서비스 제공에 필요한 경우를 제외하고&#44; 다른 목적으로 사용되지 않습니다&#46;</li>
										<li>허위정보를 기재하였을 경우 발생하는 불이익은 책임지지 않으며&#44; 서비스 제한 조치를 받을 수 있습니다&#46;</li>
										<li>타인의 명의&#40;이름 및 주민등록번호&#41;를 도용하여 가입 신청을 한 회원의 모든 ID는 삭제되며&#44; 관계법령에 따라 처벌을 받을 수 있습니다&#46;</li>
										<li>회원은 가입시 등록한 회원정보의 변경이 발생한 경우 즉시 &#34;홈페이지&#34;에서 직접 수정 또는 전자우편&#44; 기타방법으로 &#34;홈페이지&#34;에 그 변경 사실을 알려야 한다&#46;</li>
									</ol>
									<h4>제6조 &#91;회원자격의 박탈&#93;</h4>
									<p>회원이 공제조합의 서비스를 이용함에 있어 다음의 사항에 해당하는 행위를 한 것이 발견될 경우 이용계약을 임의 해지하거나 공제조합이 정한 일정기간동안 서비스 이용중지를 할 수 있습니다&#46;</p>
									<ul class="pL10 pB20">
										<li>&#9312; 공공질서 및 미풍양속에 반하는 경우</li>
										<li>&#9313; 범죄적 행위에 관련되는 경우</li>
										<li>&#9314; 국익 또는 공익에 저해되는 목적으로 서비스를 이용한 경우</li>
										<li>&#9315; 서비스에 위해를 가하는 등 서비스의 건전한 이용에 저해한 경우</li>
										<li>&#9316; 타인의 아이디 및 비밀번호를 도용하거나 타인의 명예를 훼손한 경우</li>
										<li>&#9317; 기타 관계법령이나 공제조합이 정한 약관에 위배되는 경우</li>
									</ul>
									<h4>제7조 &#91;서비스 내용의 추가 및 변경&#93;</h4>
									<ol class="liSt01 pB20">
										<li>공제조합은 수시로 서비스 내용 및 종류를 변경할 수 있으며&#44; 변경사항은 공지사항을 통하여 공지합니다&#46;</li>
										<li>서비스 내용이 추가 및 변경됨으로써 이용에 필요한 사항이 변경될 경우 공제조합은 공지 사항을 통하여 이를 회원에게 사전 공지합니다&#46;</li>
									</ol>
									<h4>제8조 &#91;공제조합의 의무와 권리&#93;</h4>
									<ol class="liSt01 pB20">
										<li>회원은 자신의 회원번호&#40;ID&#41; 및 비밀번호를 공제조합의 사전승낙없이 타인에게 양도&#44; 임대할 수 없습니다&#46;</li>
										<li>회원에게 부여된 회원번호&#40;ID&#41; 및 비밀번호에 대한 모든 관리책임은 회원에게 있습니다&#46;</li>
										<li>회원은 자신의 회원번호&#40;ID&#41;가 부정하게 이용된 것을 인지한 즉시 공제조합에 그 사실을 통지해야 합니다&#46;</li>
										<li>회원은 본 약관 및 관계법령에서 규정한 사항을 준수해야 합니다&#46;</li>
									</ol>
									<h4>&#60;부칙&#62;</h4>
									<p>인터넷회원가입 약관 버전번호 v1&#46;0</p>
									<p class="pB20">인터넷회원가입 약관 최종변경일자 2009&#46;12</p>
								</div>
							</div>
							<p class="btnboxQ"><input id="confirmUseTerms" type="checkbox" name="agreeterms" /><label for="agreeterms">위 내용을 읽어보았으며&#44; 이용약관에 동의 합니다&#46;</label></p>
						</div><!--// 이용약관  -->
						<h3 class="netsubTit"><span class="greenBul">개인정보 수집 및 이용안내</span></h3>
						<div class="agreeWrap">
							<div class="agreeBox">
								<div class="txtWrap">
									<h4>수집하는 개인정보의 항목</h4>
									<p class="bold">&#60;조합원 회원가입&#62;</p>
									<p class="pB10">&#45; 대표자명&#44; 대표자 주민번호&#44; 조합원 아이디&#44; 비밀번호&#44; 사업자번호&#44; 회사명&#44; 회사주소&#44; 대표 전화번호&#44; 대표 휴대번호&#44; 대표 이메일 주소&#44; 계약지부</p>
									<p class="bold">&#60;차량관리자 회원가입&#62;</p>
									<p class="pB10">&#45; 성명&#44; 주민번호&#44; 아이디&#44; 비밀번호&#44; 사업자번호&#44; 주소&#44; 전화번호&#44; 휴대번호&#44; 이메일 주소</p>
									<p class="bold">&#60;거래처 회원가입&#62;</p>
									<p class="pB20">&#45; 대표자명&#44; 대표자 주민번호&#44; 대표 아이디&#44; 비밀번호&#44; 사업자번호&#44; 회사명&#44; 회사주소&#44; 대표 전화번호&#44; 대표 휴대번호&#44; 대표 이메일 주소</p>
									<h4>개인정보의 수집 및 이용 목적</h4>
									<p>본 조합이 수집한 개인정보를 다음의 목적을 위해 활용합니다&#46;</p>
									<p>이용자가 제공한 모든 정보는 하기 목적에 필요한 용도 이외로는 사용되지 않으며 이용목적이 변경될 시에는 사전 동의를 구할 것입니다&#46;</p>
									<ul class="pB20">
										<li>가&#46; 회원가입&#44; 민원처리&#44; 해당 서비스 이용시 본인의 확인</li>
										<li>나&#46; 신규 서비스 개발 및 공지사항 전달시 활용</li>
									</ul>
									<h4>개인정보의 보유 및 이용기간</h4>
									<p>본 조합은 회원 가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다&#46;</p>
									<p class="pB20">회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우&#44; 수집 및 이용목적이 달성되면 해당 개인정보를 지체 없이 파기합니다&#46;</p>
								</div>
							</div>
							<p class="btnboxQ"><input id="confirmPrivacy" type="checkbox" name="agreeterms" /><label for="agreeterms">위 내용을 읽어보았으며&#44; 개인정보 수집 및 이용에 동의 합니다&#46;</label></p>
						</div><!--// 개인정보 수집 및 이용안내  -->
						
						<div class="lossSide2">
							<div class="lossBox">
								<!-- <p>화물공제조합 <span class="txtBlue2">사고접수번호 (1577-8278)</span>로 안내를 받은 후 해당 지부를 방문하여 직접청구에 관련된 서류작성</p> -->
								<p align="center"><span class="txtRed">분담금 카드 결제는 회원가입 없이 가능합니다. </span> 카드수납 사이트 바로가기<a href="https://card.truck.or.kr" target="_blank"><span class="txtBlue2">(https://card.truck.or.kr)</span></a><br/></p>
							</div>
						</div>		
						
						<p class="btnboxC"><a id="nameCheck" href="#;"><img src="/images/truck/btn/btn_join_next.gif" alt="실명확인" /></a></p>
						
					</div>
					<!-- 20161214 삭제 
					<div style="width:100%;text-align:center;margin-top: 20px;">
						<div style="display:inline-block;">
							<div class="flL">
								<span class="txtPoint06"><b>대표자 이름 및 주민등록번호</b> 인증 후 가입이 가능합니다.</span>
							</div>
						</div>			
					</div>
					<div style="width:100%;text-align:center;margin-top: 1px;">
						<div style="display:inline-block;">
							<div class="flL">
								<span class="txtPoint06">2개 이상의 지부에 계약을 유지중인 경우 <b>지부별 별도 가입이 필요</b>합니다.</span>
							</div>
						</div>			
					</div>
					//20161214 삭제 -->

				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<hr />
		<!--// container e -->
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->

		
	</div>
	<!-- //wrap e -->
	<!-- 
	<form id="f" name="f" action="/join/input/regist.do" method="post">
		<input type="hidden" name="jumin1" value="" />
		<input type="hidden" name="jumin2" value="" />
		<input type="hidden" name="sName" value="" />
	</form>
	 -->
</body>
</html>


