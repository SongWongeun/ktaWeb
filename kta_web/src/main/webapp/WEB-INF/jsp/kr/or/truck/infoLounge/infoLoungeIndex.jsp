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
				<div class="infoSub">
					<h2 class="hide">화물공제조합 정보마당 입니다</h2>
					<ul>
						<!-- 공제소식 -->
						<li>
							<dl>
								<dt><a href="/infoLounge/deductNewsIndex.do">공제소식</a></dt>
								<dd>화물공제조합의<br />최신 소식을 만나보실 수 있습니다&#46;</dd>
							</dl>
						</li>
						<!-- 장학사업 -->
						<!-- <li>
							<dl>
								<dt><a href="/infoLounge/encourInfo.do">장학사업</a></dt>
								<dd>화물공제조합은 매년 상반기 &#183; 하반기에<br />장학금을 지원해 드리고 있습니다&#46;</dd>
							</dl>
						</li> -->
						<!-- 업계소식 -->
						<li>
							<dl>
								<dt><a href="/infoLounge/insuranceNewsIndex.do">보험소식</a></dt>
								<dd>관련 업계 소식이 궁금하시죠&#63;<br />많은 정보들을 한눈에 확인 하실 수 있습니다&#46;</dd>
							</dl>
						</li>
						<!-- 관련사이트 -->
						<li>
							<dl>
								<dt><a href="/infoLounge/dataCenter/recommandSite.do">관련사이트</a></dt>
								<dd>한눈에 보실 수 있는<br />관련사이트 안내 정보 입니다&#46;</dd>
							</dl>
						</li>
						<!-- 입찰공고 -->
						<li>
							<dl>
								<dt><a href="/infoLounge/bidNoticeIndex.do">입찰공고</a></dt>
								<dd>분야별 검색기능으로<br />입찰 공고 내용을 확인 하실 수 있습니다&#46;</dd>
							</dl>
						</li>
						<!-- 우수협력업체 -->
						<li>
							<dl>
								<dt><a href="/infoLounge/dataCenter/recommandCompanyDirect.do">우수협력정비업체</a></dt>
								<dd>정비사업소 정보를<br />편리하게 검색 하실 수 있습니다&#46;</dd>
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