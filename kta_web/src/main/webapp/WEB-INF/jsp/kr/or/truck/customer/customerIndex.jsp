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
				<div class="custSub clfix">
					<h2 class="hide">화물공제조합 고객광장 입니다</h2>
					<div class="custIntro">
						<ul>
							<!-- 문의안내 -->
							<li class="liSty01">
								<dl>
									<dt><a href="/customer/qnaInfo.do">문의안내</a></dt>
									<dd>문의 하기 전에 문의 안내를 꼭 필독하세요&#46;</dd>
								</dl>
							</li>
							<!-- 자료실 -->
							<li class="liSty02">
								<dl>
									<dt><a href="/customer/formDataIndex.do">자료실</a></dt>
									<dd>다양하게 제공되는 관련양식과<br />전문자료를 열람하세요&#46;</dd>
								</dl>
							</li>
							<!-- 자주하는 질문과 답변 -->
							<li class="liSty03">
								<p><a href="/customer/faqNoticeIndex.do">자주하는<br />질문과 답변</a></p>
							</li>
							<!-- 고객문의 -->
							<li class="liSty04">
								<dl>
									<dt><a href="/customer/inquiry/oaoInquiryIndex.do">고객문의</a></dt>
									<dd>고객님의 궁금증에 친절하고<br />알기 쉽게 알려드려요&#46;</dd>
								</dl>
							</li>
							<!-- 칭찬합시다 -->
							<li class="liSty05">
								<dl>
									<dt><a href="/customer/praise/praiseListIndex.do">칭찬합시다</a></dt>
									<dd>고객님들의 따뜻한 한 말씀 입니다&#46;</dd>
								</dl>
							</li>
						</ul>
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
