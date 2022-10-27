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
				<div class="assoSub clfix">
					<h2 class="hide">화물공제조합 조합소개 입니다</h2>
					<ul>
						<!-- 인사말 -->
						<li>
							<dl>
								<dt class="topSty01"><a href="/assocIntroduce/presidentGreeting.do">인사말</a></dt>
								<dd>화물업계를 굳건히 지켜온 화물공제조합&#46;</dd>
							</dl>
						</li>
						<!-- 윤리경영 -->
						<li>
							<dl>
								<dt class="topSty02"><a href="/customer/cleanCenter/charter.do">윤리경영</a></dt>
								<dd>화물공제조합은 윤리경영을 실천합니다&#46;</dd>
							</dl>
						</li>
						<!-- 채용안내 -->
						<li>
							<dl>
								<dt class="topSty01"><a href="/assocIntroduce/recruit/recruitInfo.do">채용안내</a></dt>
								<dd>인재와 함께 크는 기업이 되겠습니다&#46;</dd>
							</dl>
						</li>
						<!-- 지부안내 -->
						<li>
							<dl>
								<dt class="topSty02"><a href="/assocIntroduce/office/officeInfo.do">지부안내</a></dt>
								<dd>전국망에 걸친 지부 안내 정보입니다&#46;</dd>
							</dl>
						</li>
					</ul>
					<!-- 공제조합소개 -->
					<div class="liSty01">
						<h3><a href="/assocIntroduce/introduce/vision.do">공제조합소개</a></h3>
						<p>조합원을 먼저 생각하고<br />사람과 정성을 다하고자 노력하는<br />우리조합을 소개합니다&#46;</p>
					</div>
					<!-- 본부안내 -->
					<div class="liSty02">
						<a href="/assocIntroduce/allRoughMap.do"><img src="/images/truck/subindex/icon_map.png" art="본부안내" /></a>
					</div>
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