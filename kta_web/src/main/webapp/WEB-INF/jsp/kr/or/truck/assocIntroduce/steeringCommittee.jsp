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
 						<h2><img src="/images/truck/asso/steering_tit.gif" alt="운영위원회" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">공제조합 소개</a>
						<span>운영위원회</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/steering_con_tit.gif" alt="운영위원회의 주요 업무 입니다" /></p>
					<div class="conSection">
						<p><img src="/images/truck/asso/steering_txt.gif" alt="운영위원회는 공제사업에 관하여 다음 각호의 사항을 심의 결의하며 그 업무집행을 감독한다 " /></p>
						<div class="steeringArea">
							<h3 class="h3Tit"><img src="/images/truck/asso/steering_bg_tit.gif" alt="운영위원회" /></h3>
							<ol>
								<li class="pL17">사업계획&#46;운영 및<br />관리에 관한<br />기본 방침</li>
								<li>예산 및 결산에<br />관한 사항</li>
								<li>차입금에<br />관한 상항</li>
								<li>주요 예산집행에<br />관한 사항</li>
								<li>임원의 임면에<br />관한 사항</li>
								<li>공제약관&#46;공제규정의<br />변경과 각종 내부규정의<br />제정&#46;개정 및 폐지에<br />관한 사항</li>
								<li class="pL93">공제금&#44; 공제 가입금&#44;<br />분담금 및 요율에<br />관한 사항</li>
								<li>추가분담금의<br />부과 및 징수에<br />관한 사항</li>
								<li>사업장의 설치 및<br />변경에 관한 사항</li>
								<li>보증수수료&#44; 사용료 및<br />이용료에 관한 사항</li>
								<li>그 밖에 위원장이<br />필요하다고 인정하여<br />회의에 부치는 사항</li>
							</ol>
						</div>
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