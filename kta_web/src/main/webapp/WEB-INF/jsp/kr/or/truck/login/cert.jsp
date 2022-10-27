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
<script type="text/javascript">
</script>
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
				<h1><a href="/main/index.do"><img src="/images/truck/com/sub_logo.gif" alt="KTA | 전국화물자동차운송사업자공제조합" /></a></h1>
				<div class="gnbSub">
					<ul>
						<li><a href="/mail/check.do" target=""><img src="/images/truck/main/kpw.gif" alt="만기안내 비밀번호 변경"></a></li>
						<li><a href="http://www2.truck.or.kr/" target="_blank" title="새창열림"><img src="/images/truck/main/k_home.gif" alt="구홈페이지" /></a></li>
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
						<a href="/cyberPr/cyberPrIndex.do"><img src="/images/truck/main/btn_cyber.gif" alt="사이버홍보관" /></a>
						<a href="/util/siteMap.do"><img src="/images/truck/main/btn_allview.gif" alt="전체보기" /></a>
					</div>
					<div class="gnbSubSearch">
						<span class="ut_search"><label for="">검색어</label><input type="text" name="searchKeyword" id="searchKeyword" title="검색어 입력" /></span>
						<a class="btn_ut_search" href="#;" onclick="totalSearch();"><img src="/images/truck/main/util_search.gif" alt="검색" /></a>
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
					<p class="confirTit"><img src="/images/truck/net/log_con_tit.gif" alt="화물공제조합 방문을 환영합니다 로그인 하시면 마이페이지, 공제계약관련 조회서비스를 보다 편리하게 이용하실 수 있습니다" /></p>
					<div class="conSection">
						<div class="supportCont clfix idpw" >
							<form id="fIdpw" name="fIdpw" action="/actIdpwLogin.do" method="post">
							<fieldset>
							<legend>로그인</legend>
								<p class="consecTit"><img src="/images/truck/net/log_sub_tit01.gif" alt="본인인증으로 안전하고 편리하게 인터넷창구 서비스" /></p>
								<div class="selectLog">
									<input name="agentCd" class="" id="agentCd" type="radio"  value="1"/><label for="user1">조합원</label>
									<input name="agentCd" class="" id="agentCd" type="radio" value="2"/><label for="user2">차량관리자</label>
									<input name="agentCd" class="" id="agentCd" type="radio" value="3"/><label for="user3" class="mR0">거래처</label>
								</div>
								<div class="roundBox">
									<div class="round"><span class="rtL"></span><span class="rtR"></span></div><!-- 상단라운드 -->
									<!-- 웹사이트 로그인 s -->
									<div class="supportArea clfix">
										<br/>
										<label for="userId">주민번호</label>
										<label for="id" class="hide">주민번호앞자리</label><input name="id" class="txt" id="id" type="text" value="mrae9564"/>&#45;<label for="password" class="hide">주민번호뒷자리</label><input name="password" class="txt" id="password" type="password" value="dldudgh"/>
										<a href="#;">공인인증서 로그인</a> 
										<br/>
									</div>
									<div class="round"><span class="rbL"></span><span class="rbR"></span></div><!-- 하단라운드 -->
								</div>
							</fieldset>
							</form>
						</div><!--// 웹사이트 로그인 e -->
					</div><!--// conSection e -->
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