<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<c:if test="${param.code == 'regist.success' }">
<script type="text/javascript">
$(document).ready(function(){
	alert('글등록이 완료되었습니다.');
});
</script>
</c:if>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path02">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/customer/index.do">고객광장</a></li>
			<li><a href="/m/customer/cleanCenter/view.do">클린센터</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i02"><img alt="클린센터" src="/images/m_truck/subtop/02top_3.png" /></li>
				<li class="txt01">클린신고센터는 화물공제조합 감사실에 직접 제보하는 기능이며, 언제나 누구든지 이용이 가능합니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont01">
			<!-- 제보 대상 -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>제보 대상</h3>
				<ul class="pt14">
					<li><span class="bulSt01">윤리 위반 행위, 임.직원의 부정, 비리행위,<br/>불공정 거래 행위, 건의, 제안사항 등</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<!-- 제보 대상 -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>제보 방법</h3>
				<ul class="pt14">
					<li><span class="bulSt01">전화 : 02-3483-3780<a href="tel:02-3483-3780" class="btn_call"><img src="/images/m_truck/com/btn_call.png" alt-="전화연결" /></a></span></li>
					<li><span class="bulSt01">팩스 : 02-3483-3799</span></li>
					<li><span class="bulSt01">서면 : 화물공제조합 감사실</span><span class="txtSt05">137-828 서울시 서초구<br/>방배본동 753-5 화련회관 8층 감사실</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article><!--// basicCont01 -->
		<article class="basicCont03">
			<p class="bulSt03"><span class="txtBlod">제보자 및 제보내용은</span> 철저히 비밀이 보장되며, 제보내용으로 어떠한 불이익도 받지 않습니다.</p>
			<p class="bulSt03"><span class="txtBlod">단, </span>타인의 비방이나 음해 목적으로 이용해서는 아니 되며, 실명으로 제보하셔야 합니다.</p>
			<p class="registBox"><a href="/m/customer/cleanCenter/regist.do">제보하기</a></p>
		</article>
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>