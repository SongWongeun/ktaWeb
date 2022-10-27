<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/kr/or/truck/m/common/include/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/m/common/include/global.do" /><!--// meta, title, css, js -->
<script type="text/javascript">


function downpdf(url){
	
	/* if(!confirm("3G/4G로 이용 시 데이터 요금이 부과되실 수 있습니다. 다운받으시겠습니까?")){
		return false;
	} */	
	location.href=url;
};

</script>
</head>
<body>
<div id="wrap">	
	<!-- header s --><c:import url="/m/common/include/header.do" /><!--// header e -->
	<!--  location s  -->
	<section id="location" class="path09">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/cyberPr/index.do">사이버홍보관</a></li>
			<li><a href="/m/cyberPr/thirty/list.do">화물공제 30년사</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i09"><img alt="화물공제 30년사" src="/images/m_truck/subtop/09top_1.png" /></li>
				<li class="txt01">30년의 오랜 역사를 가지고 있는 화물공제조합 역사관입니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<p class="prPoint"><span class="bulSt02">3G/4G로 이용 시 데이터 요금이 부과되실 수 있습니다.</span></p>
		<article class="defaultList">
			<ul class="cyber">
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=0');return false;">
						<span class="title">화물공제발자취30년</span>
						<span class="txtDesc">page 1 - 35</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=1');return false;">
						<span class="title">사진으로 보는 화물공제30년사 발자취</span>
						<span class="txtDesc">page 36 - 131</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=2');return false;">
						<span class="title">화물공제발자취30년_목차</span>
						<span class="txtDesc">page 132 - 139</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=4');return false;">
						<span class="title">화물공제조합의 태동기</span>
						<span class="txtDesc">page 130 - 179</span>
					</a>
				</li>
				<!-- <li>
					<a href="">
						<span class="title">화물공제조합의 태동기 2</span>
						<span class="txtDesc">page 1 - 35</span>
					</a>
				</li> -->
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=5');return false;">
						<span class="title">화물공제조합의 결손기</span>
						<span class="txtDesc">page 180 - 235</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=6');return false;">
						<span class="title">화물공제조합의 도약기</span>
						<span class="txtDesc">page 236 - 265</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=7');return false;">
						<span class="title">화물공제조합의 시련기</span>
						<span class="txtDesc">page 266 - 291</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=8');return false;">
						<span class="title">화물공제조합의 안정기</span>
						<span class="txtDesc">page 292 - 321</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003498&fileSn=9');return false;">
						<span class="title">화물자동차운송사업의 History</span>
						<span class="txtDesc">page 322 - 355</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003499&fileSn=0');return false;">
						<span class="title">화물공제조합으로 가는길_부문사</span>
						<span class="txtDesc">page 356 - 407</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003499&fileSn=1');return false;">
						<span class="title">기타부대사업</span>
						<span class="txtDesc">page 408 - 429</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003499&fileSn=2');return false;">
						<span class="title">화물공제조합의 오늘과 내일</span>
						<span class="txtDesc">page 430 - 473</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003499&fileSn=3');return false;">
						<span class="title">조합의 미래 발전방향</span>
						<span class="txtDesc">page 474 - 501</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003499&fileSn=4');return false;">
						<span class="title">본부_지부편</span>
						<span class="txtDesc">page 502 - 629</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003499&fileSn=5');return false;">
						<span class="title">부록</span>
						<span class="txtDesc">page 630 - 714</span>
					</a>
				</li>
				<li>
					<a href="#;" onclick="downpdf('downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000003499&fileSn=9');return false;">
						<span class="title">화물공제 30년사 전체</span>
						<span class="txtDesc">page 1 - 714</span>
					</a>
				</li>
			</ul>
		</article><!--// 게시판목록 -->
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>