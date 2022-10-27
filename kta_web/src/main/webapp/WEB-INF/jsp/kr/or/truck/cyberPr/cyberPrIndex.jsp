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
				<div class="cyberSub clfix">
					<h2 class="hide">화물공제조합 사이버홍보관 입니다</h2>
					<ul>
						<!-- 사고예방활동 -->
						<li>
							<dl>
								<dt><a href="/cyberPr/accIndex.do">사고예방활동</a></dt>
								<dd>교통사고 감소를 위한<br />다각적인 캠페인을<br />실시하고 있습니다&#46;</dd>
							</dl>
						</li>
						<!-- 운전자의 날 -->
						<li>
							<dl>
								<dt><a href="/cyberPr/driversDayIndex.do">운전자의 날</a></dt>
								<dd>화물자동차운전자의<br />노고와 사기진작을 위한<br />기념행사 입니다&#46;</dd>
							</dl>
						</li>
						<!-- 행사안내 -->
						<li>
							<dl>
								<dt><a href="/cyberPr/eventIndex.do">행사안내</a></dt>
								<dd>화물공제조합의<br />다양한 행사 갤러리 입니다&#46;</dd>
							</dl>
						</li>
						<!-- 홍보영상 -->
						<li>
							<dl>
								<dt><a href="/cyberPr/prMovieIndex.do">홍보영상</a></dt>
								<dd>화물공제조합의<br />다양한 홍보영상입니다&#46;</dd>
							</dl>
						</li>
						<!-- 트럭메아리 -->
						<li>
							<dl>
								<dt><a href="/cyberPr/echoIndex.do">트럭메아리</a></dt>
								<dd>화물공제조합 소식을<br />보다 알차게 만날 수 있는<br />웹진 서비스 입니다&#46;</dd>
							</dl>
						</li>
						<!-- 화물공제 30년사 -->
						<li>
							<dl>
								<dt><a href="/cyberPr/thirtyHistory.do">화물공제 30년사</a></dt>
								<dd>30년의 오랜 역사를 가지고 있는<br />화물공제조합 역사관입니다&#46;</dd>
							</dl>
						</li>
					</ul>
				</div>
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