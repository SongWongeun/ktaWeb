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
	<section id="location" class="path03">
		<ul>
			<li class="depth01"><a href="/m/main.do"><img alt="홈으로가기" src="/images/m_truck/com/icon_home.png" /></a></li>
			<li class="depth02"><a href="/m/joinInfo/index.do">가입안내</a></li>
			<li><a href="/m/joinInfo/deductTerms/car/view.do">공제약관</a></li>
		</ul>
	</section>
	<!--//  location e -->
	<!-- content s -->
	<section id="content">
		<article class="contentSubTitle">
			<ul class="subTitBox">
				<li class="subtit_i03"><img alt="공제약관" src="/images/m_truck/subtop/03top_2.png" /></li>
				<li class="txt01">화물공제조합 공제약관입니다. 약관제목을 선택하시면, 다운로드가 가능합니다.</li>
			</ul>
		</article><!--// 텍스트타이틀 -->
		<p class="prPoint"><span class="bulSt02">3G/4G로 이용 시 데이터 요금이 부과되실 수 있습니다.</span></p>
		<article class="tabWrap">
			<!-- tab -->
			<div class="tabBox03">
				<ul >
					<li><a href="/m/joinInfo/deductTerms/car/view.do">자동차 공제</a></li>
					<li class="on"><a href="/m/joinInfo/deductTerms/carry/view.do">적재물 공제</a></li>
				</ul>
			</div>
			<div class="basicCont02">
				<div class="list01">
					<h3 class="listTIt "><span>계약자께서 아셔야 할 사항</span></h3>
					<div class="listDiv">
						<p class="txtTit05">약관은 꼭 한번 이상 읽어보십시오&#46;</p>
						<p class="bulSt11">이 약관은 계약자 여러분께서 체결한 적재물배상책임공제 계약의 권리 의무와 중요 내용에 관한 규정이므로 꼭 읽어보시기 바랍니다&#46;</p>
						<p class="txtTit05">청약서는 본인이 정확히 작성하여 주십시요&#46;</p>
						<p class="bulSt11">청약서상의 등록번호&#44; 차종&#44; 보상한도액&#44; 자기부담금&#44; 년간 매출액 등 기재사항을 정확히 작성하고 반드시 확인하신 후 계약자가 직접 서명&#44; 날인하여 주십시요&#46;</p>
						<p class="txtTit05">청약서 기재사항의 변동사항은 알려 주십시요&#46;</p>
						<p class="bulSt11">청약서상에 질문한 사항에 대하여 변동이 있는 경우 사실대로 상세히 알려 주십시요&#46; 만약 계약 후 알릴의무 사항에 대하여 알리지 아니하였거나 알리신 내용이 사실과 다른 경우에는 계약이 해지되고 공제금 등이 지급되지 않는 경우가 있습니다&#46;</p>
						<p class="txtTit05">사고발생 시 다음 사항을 즉시 알려주십시요&#46;</p>
						<p class="bulSt11">사고발생의 때&#44; 곳&#44; 피해자의 주소와 성명&#44; 사고상황 및 이들의 증인이 있을 경우 그 주소와 성명</p>
						<p class="bulSt11">제3자로부터 손해배상 청구를 받았을 경우 또는 손해배상책임에 관한 소송을 제기 받았을 경우에는 조합에 곧 알려 주십시요&#46;</p>
					</div><!--// 계약자께서 아셔야 할 사항 -->
					<h3 class="listTIt "><span>적재물 공제약관 개정연혁</span></h3>
					<div class="listDiv">
						<p class="txtTit05">적재물배상책임공제 약관 개정 연혁</p>
						<table class="tbSt01" summary="적재물 공제약관 개정연혁정보 테이블 입니다">
							<caption>적재물 공제약관 개정연혁에 대해서 나타낸 표</caption>
							<colgroup>
								<col style="width:27%;" />
								<col style="width:24%;" />
								<col style="width:49%;" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="lineNo">구분</th>
									<th scope="col">승인일자</th>
									<th scope="col">승인번호</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="lineNo">제정</td>
									<td>'04&#46; 12&#46; 30</td>
									<td>물류산업과&#45;2480호</td>
								</tr>
								<tr>
									<td class="lineNo">제1차 개정</td>
									<td>'05&#46; 03&#46; 23</td>
									<td>물류산업과&#45;683호</td>
								</tr>
								<tr>
									<td class="lineNo">제2차 개정</td>
									<td>'05&#46; 12&#46; 07</td>
									<td>물류산업팀&#45;702호</td>
								</tr>
								<tr>
									<td class="lineNo">제3차 개정</td>
									<td>'09&#46; 03&#46; 25</td>
									<td>자동차손해보장팀&#45;675호</td>
								</tr>
								<tr>
									<td class="lineNo">제4차 개정</td>
									<td>'11&#46; 06&#46; 03</td>
									<td>자동차생활과&#45;2360호</td>
								</tr>
								<tr>
									<td class="lineNo">제5차 개정</td>
									<td>'12&#46; 04&#46; 10</td>
									<td>자동차생활과&#45;1106호</td>
								</tr>
								<tr>
									<td class="lineNo">제 6차 개정</td>
									<td>2017&#46; 01&#46; 05</td>
									<td>자동차운영보험과 &#45; 95호</td>
								</tr>
								<tr>
									<td class="lineNo">제 7차 개정</td>
									<td>2017&#46; 09&#46; 14</td>
									<td>자동차운영보험과 &#45; 5044호</td>
								</tr>
							</tbody>
						</table>
					</div><!--// 적재물 공제약관 개정연혁 -->
				</div>
				<div class="textTitle"><h2 class="txtTit03">적재물공제약관</h2></div>
				<table class="tbSt03" summary="보통약관">
					<colgroup>
						<col width="85%">
						<col width="15%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><a href="#;" onclick="downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000007815&fileSn=0'); return false;">적재물공제약관 다운로드</a></th>
							<td><a href="#;" onclick="downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000007815&fileSn=0'); return false;"><img src="/images/m_truck/com/btn_pdf.png" alt="pdf보기" /></a></td>
						</tr>
					</tbody>
				</table><!-- 보통약관 -->
			</div>
		</article><!--// tabWrap -->
	</section>
	<!--// content e -->
	<!-- footer s --><c:import url="/m/common/include/footer.do" /><!--// footer e -->
</div>
<!--// wrap e -->
<!-- 사이트맵 --><c:import url="/m/sitemap.do" /><!--// 사이트맵 e -->
</body>
</html>