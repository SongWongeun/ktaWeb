<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
</head>
<c:if test="${param.code == 'regist.success' }">
	<script type="text/javascript">
	jQuery(document).ready(function(){
		alert("글 등록이 완료되었습니다. 담당자 배정시 빠른 시간안에 연락드리겠습니다.");
	});
	</script>
</c:if>
<body>
<div id="wrap">
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!-- content s -->
	<section id="subIndex">
		<article class="subbgTop">
			<div class="subTit03"><h2>가입안내</h2></div>
		</article>
		<article class="subbgBot">
			<div class="subliBox mb185">
				<ul class="subLi02">
					<li><a href="/m/joinInfo/productInfo/main.do">상품안내</a></li>
					<li><a href="/m/joinInfo/deductTerms/car/view.do">공제약관</a></li>
					<li><a href="/m/joinInfo/contractGuide/car/view.do">계약시 유의사항</a></li>
					<li><a href="/m/deductProduct/privateHwamul/mHwamulInfo.do">개인화물 가입안내 및 상담신청</a></li>
				</ul>
			</div>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>