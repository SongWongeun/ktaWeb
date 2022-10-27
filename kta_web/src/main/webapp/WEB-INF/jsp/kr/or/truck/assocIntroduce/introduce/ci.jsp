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
 						<h2><img src="/images/truck/asso/ci_tit.gif" alt="CI소개" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">공제조합 소개</a>
						<span>CI소개</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/ci_con_tit.gif" alt="화물공제조합의 두 개의 원을 형상화한 CI는 운송사업연합회와 공제조합의 하나 됨을 무한대로 표현하여 영원함을 상징합니다" /></p>
					<div class="conSection">
						<div class="ciArea">
							<div class="ciRight">
								<p><img src="/images/truck/asso/ci_img01.gif" alt="화물공제조합 Symbol & Concept" /></p>
								<div class="btnboxC"><span class="btn_pack btn_type06 icon"><span class="illust"></span><a href="/exploded/CI/CI.zip">CI 다운로드</a></span></div>
							</div>
							<div class="ciLeft">
								<div class="subTit"><img src="/images/truck/asso/ci_txt.gif" alt="물류중심으로서의 무한질주, 하나됨을 무한대로 표현" /></div>
								<h3 class="h3Tit"><img src="/images/truck/asso/ci_sub_tit01.gif" alt="Symbol & Concept" /></h3>
								<p class="txt02">뫼비우스띠를 형상화한 두 개의 원의 의미를 글로벌시대를 맞이하여 물류중심으로서의 무한 질주의 끊임없이 이어지는 전국의 도로를 상징하고
								있으며 또한&#44; 두 원을 각각 운송사업연합회와 공제조합으로 나타내어 16개 시도지부가 &#34;하나&#34;됨을 무한대로 표현하여 영원함을 상징하고 있습니다&#46;<br />
								색상표현에 있어서 Blue는 조합의 젊은 사고와 청렴한 행동을&#44; Green은 조합과 고객의 안정과 평화를 상징함으로써 전체가 융합되어 기업의 강인하고 건강한
								결속력을 의미 합니다&#46;</p>
								<p class="mT40"><img src="/images/truck/asso/ci_img02.gif" alt="젊은 사고와 청렴한 행동<=>조합과 고객의 안정과 평화를 상징" /></p>
							</div>
						</div>
						<div class="ciArea">
							<h3 class="h3Tit"><img src="/images/truck/asso/ci_sub_tit02.gif" alt="Font" /></h3>
							<p class="txt02">국문로고 &#45; 태고딕&#44; 중고딕&#44; 태명조&#44; 중명조</p>
							<p class="txt02">영문로고 &#45; Helvetica Medium&#44; Charcoal Regulr&#44; Time New Roman&#44; Courier Medium</p>
						</div>
						<div class="ciArea">
							<h3 class="h3Tit"><img src="/images/truck/asso/ci_sub_tit03.gif" alt="Logo" /></h3>
							<p><img src="/images/truck/asso/ci_img03.gif" alt="국문로고타입,영문로고타입" /></p>
						</div>
						<div class="ciArea">
							<h3 class="h3Tit"><img src="/images/truck/asso/ci_sub_tit04.gif" alt="signature" /></h3>
							<p><img src="/images/truck/asso/ci_img04.gif" alt="국문조합형시그니처,영문조합형시그니처" /></p>
						</div>
						<div class="ciArea">
							<p><img src="/images/truck/asso/kta_ci.gif" alt="KTA는 Korea Trucking Association 약어 입니다" /></p>
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