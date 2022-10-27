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
 						<h2><img src="/images/truck/asso/law_tit.gif" alt="관련법령" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">조합소개</a>
						<a href="/assocIntroduce/assocIntroduceIndex.do">공제조합 소개</a>
						<span>관련법령</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/asso/law_con_tit.gif" alt="클릭하시면 관련법령정보를 보실 수 있습니다" /></p>
					<div class="conSection">
						<div class="lawArea">
							<h3 class="hide">관련법령</h3>
							<ul>
								<li class="lawLi01">
									<a href="http://www.law.go.kr/법령/도로교통법" title="새창열림" target="_blank">
									<img src="/images/truck/asso/law_img01.png" alt="도로교통법 " /></a>
								</li>
								<li class="lawLi02">
									<a href="http://www.law.go.kr/법령/교통사고처리특례법" title="새창열림" target="_blank">
									<img src="/images/truck/asso/law_img02.png" alt="교통사고처리 특례법 " /></a>
								</li>
								<li class="lawLi03">
									<a href="http://www.law.go.kr/법령/자동차손해배상보장법" title="새창열림" target="_blank">
									<img src="/images/truck/asso/law_img03.png" alt="자동차손해배상 보장법 " /></a>
								</li>
								<li class="lawLi04">
									<a href="http://www.law.go.kr/법령/화물자동차운수사업법" title="새창열림" target="_blank">
									<img src="/images/truck/asso/law_img04.png" alt="화물자동차 운수사업법 " /></a>
								</li>
								<li class="lawLi05">
									<a href="http://www.law.go.kr/법령/보험업법" title="새창열림" target="_blank">
									<img src="/images/truck/asso/law_img05.png" alt="보험업법 " /></a>
								</li>
								<li class="lawLi06">
									<a href="http://www.law.go.kr/법령/민법" title="새창열림" target="_blank">
									<img src="/images/truck/asso/law_img06.png" alt="민법 " /></a>
								</li>
								<li class="lawLi07">
									<a href="http://www.law.go.kr/법령/상법" title="새창열림" target="_blank">
									<img src="/images/truck/asso/law_img07.png" alt="상법 " /></a>
								</li>
							</ul>
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
