<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path05">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/compensationInfo/index.do">보상안내</a></li>
			<li><a href="/m/compensationInfo/amountCharge/view.do">공제금청구안내</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i05"><img alt="보상안내" src="/images/m_truck/subtop/05top_1.png" /></li>
				<li class="txt01">사고 발생 시 신속히 보상 받을 수 있는 절차 등 상세한 내용을 제공해 드립니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<article class="basicCont04">
			<h2 class="txtTit01 mt0">공제금 청구안내 (손해배상 청구권자)</h2>
			<!-- 교통사고 처리시 제출해야 할 서류  -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>교통사고 처리시 제출해야 할 서류</h3>
				<ul>
					<li><em>대인(Ⅰ·Ⅱ)사고 제출서류</em><span class="bulSt01">교통사고 발생 사실을 확인할 수 있는 서류</span></li>
					<li><span class="bulSt01">공제금 지급 청구서</span></li>
					<li><span class="bulSt01">손해액을 증명하는 서류(진단서, 소득입증자료 등)</span></li>
					<li class="line"><span class="bulSt01">기타 조합이 꼭 필요하여 요청하는 서류 또는 증거</span></li>
					<li><em>대물사고 제출서류</em><span class="bulSt01">교통사고 발생사실을 확인할 수 있는 서류</span></li>
					<li><span class="bulSt01">공제금 지급 청구서</span></li>
					<li><span class="bulSt01">손해액을 증명하는 서류(견적서, 수리비 영수증 등)</span></li>
					<li><span class="bulSt01">기타 조합이 꼭 필요하여 요청하는 서류 또는 증거</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
			<p class="bulSt05">사고처리 담당자에게 직접 전달하시거나 팩스로 송부하시면 됩니다.</p>
			<!-- 공제처리 하지 않는 사고의 처리절차 -->
			<div class="txtGrabox">
				<h3 class="txtTit02"><i class="icon-chevron-right"></i>교통사고 합의서 작성 요령</h3>
				<ul class="pt14">
					<li><span class="bulSt01">가. 합의서 양식을 별도로 필요하지 않으나 가능한 경찰서 교통계(사고처리반)에 비치되어 있는 양식을 사용하며 사고 당사자 간에 합의 문구를 작성하실 필요 없이 편리하게 사용할 수 있습니다.</span></li>
					<li><span class="bulSt01">나. 별도의 양식이 없이 일반 용지 등에 합의서를 작성하실 경우에는 사고일시 및 사고차량번호, 사고운전자 성명을 기재한 후 가해자 및 피해자를 구분하고 합의내역을 작성하시면 됩니다.</span></li>
				</ul>
			</div><!--// 라운드 박스 컨텐츠 -->
		</article><!--// basicCont01 -->
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>