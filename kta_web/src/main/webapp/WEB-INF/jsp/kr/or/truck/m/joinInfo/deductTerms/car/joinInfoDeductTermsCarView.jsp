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
					<li class="on"><a href="/m/joinInfo/deductTerms/car/view.do">자동차 공제</a></li>
					<li><a href="/m/joinInfo/deductTerms/carry/view.do">적재물 공제</a></li>
				</ul>
			</div>
			<div class="basicCont02">
				<div class="list01">
					<h3 class="listTIt "><span>자동차공제 약관 쉽게 찾는 법</span></h3>
					<div class="listDiv">
						<p class="txtTit05">공제계약 시 꼭 알아야 할 사항</p>
						<ol class="txtList01">
							<li>공제계약의 성립&#40;제4편 제1장 제40조&#41;</li>
							<li>약관교부 및 설명의무 등&#40;제4편 제1장 제41조&#41;</li>
							<li>공제기간&#40;제4편 제1장 제43조&#41;</li>
							<li>조합원 등의 의무사항&#40;제4편 제2장&#41;</li>
							<li>공제계약의 취소&#40;제4편 제3장 제51조&#41;</li>
							<li>공제계약의 효력 상실&#40;제4편 제3장 제52조&#41;</li>
							<li>조합의 개인정보이용 및 공제계약 정보의 제공&#40;제4편 제3장 제52조&#41;</li>
						</ol>
						<p class="txtTit05">자동차 사고로 다른 사람에게 피해를 주었을 경우</p>
						<ol class="txtList01">
							<li>대인배상&#8544;&#44; 대인배상&#8545;&#44; 대물배상&#40;제2편 제1장 제1절&#44; 제2절&#41;</li>
							<li>보상하지 않는 손해&#40;제2편 제1장 제5조&#44; 제8조&#41;</li>
							<li>조합원의 공제금 청구&#40;제3편 제1장&#41;</li>
							<li>사고발생시 의무&#40;제4편 제2장 제47조&#41;</li>
						</ol>
						<p class="txtTit05">자동차 사고로 자신 또는 가족이 피해를 입었을 경우</p>
						<ol class="txtList01">
							<li>자기신체사고&#40;제2편 제2장 제1절&#41;</li>
							<li>종사자재해&#40;제2편 제2장 제2절&#41;</li>
							<li>자기차량손해&#40;제2편 제2장 제3절&#41;</li>
							<li>보상하지 않는 손해&#40;제2편 제2장 제14조&#44; 제19조&#44; 제25조&#41;</li>
							<li>조합원의 공제금 청구&#40;제3편 제1장&#41;</li>
							<li>사고발생시 의무&#40;제4편 제2장 제47조&#41;</li>
						</ol>
					</div><!--// 자동차공제 약관 쉽게 찾는 법 -->
					<h3 class="listTIt "><span>자동차공제 개정연혁</span></h3>
					<div class="listDiv">
						<p class="txtTit05">자동차공제 약관 개정 연혁</p>
						<table class="tbSt01" summary="자동차공제 개정연혁정보 테이블 입니다">
							<caption>자동차공제 개정연혁에 대해서 나타낸 표</caption>
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
									<td>&#39;81&#46; 06&#46; 30</td>
									<td>운수 1510&#45;10888호</td>
								</tr>
								<tr>
									<td class="lineNo">제1차 개정</td>
									<td>&#39;81&#46; 12&#46; 24</td>
									<td>육지 1519&#45;18888호</td>
								</tr>
								<tr>
									<td class="lineNo">제2차 개정</td>
									<td>&#39;82&#46; 07&#46; 09</td>
									<td>육지 1519&#45;7635호</td>
								</tr>
								<tr>
									<td class="lineNo">제3차 개정</td>
									<td>&#39;83&#46; 12&#46; 13</td>
									<td>육지 1519&#45;14888호</td>
								</tr>
								<tr>
									<td class="lineNo">제4차 개정</td>
									<td>&#39;85&#46; 07&#46; 25</td>
									<td>운수 33191&#45;7368호</td>
								</tr>
								<tr>
									<td class="lineNo">제5차 개정</td>
									<td>&#39;86&#46; 10&#46; 24</td>
									<td>운수 33191&#45;11059호</td>
								</tr>
								<tr>
									<td class="lineNo">제6차 개정</td>
									<td>&#39;87&#46; 10&#46; 15</td>
									<td>운수 33191&#45;10195호</td>
								</tr>
								<tr>
									<td class="lineNo">제7차 개정</td>
									<td>&#39;88&#46; 04&#46; 07</td>
									<td>운수 33110&#45;3576호</td>
								</tr>
								<tr>
									<td class="lineNo">제8차 개정</td>
									<td>&#39;88&#46; 06&#46; 27</td>
									<td>운수 33110&#45;6691호</td>
								</tr>
								<tr>
									<td class="lineNo">제9차 개정</td>
									<td>&#39;89&#46; 09&#46; 19</td>
									<td>운수 33110&#45;8750호</td>
								</tr>
								<tr>
									<td class="lineNo">제10차 개정</td>
									<td>&#39;90&#46; 05&#46; 10</td>
									<td>운수 33110&#45;1698호</td>
								</tr>
								<tr>
									<td class="lineNo">제11차 개정</td>
									<td>&#39;91&#46; 09&#46; 06</td>
									<td>운수 33110&#45;10164호</td>
								</tr>
								<tr>
									<td class="lineNo">제12차 개정</td>
									<td>&#39;91&#46; 12&#46; 24</td>
									<td>지도 33110&#45;14480호</td>
								</tr>
								<tr>
									<td class="lineNo">제13차 개정</td>
									<td>&#39;92&#46; 12&#46; 02</td>
									<td>지도 33191&#45;455호</td>
								</tr>
								<tr>
									<td class="lineNo">제14차 개정</td>
									<td>&#39;95&#46; 02&#46; 10</td>
									<td>지도 91107&#45;52호</td>
								</tr>
								<tr>
									<td class="lineNo">제15차 개정</td>
									<td>&#39;95&#46; 09&#46; 20</td>
									<td>지도 91107&#45;360호</td>
								</tr>
								<tr>
									<td class="lineNo">제16차 개정</td>
									<td>&#39;96&#46; 05&#46; 09</td>
									<td>지도 91107&#45;211호</td>
								</tr>
								<tr>
									<td class="lineNo">제17차 개정</td>
									<td>&#39;96&#46; 07&#46; 24</td>
									<td>지도 91107&#45;346호</td>
								</tr>
								<tr>
									<td class="lineNo">제18차 개정</td>
									<td>&#39;96&#46; 08&#46; 27</td>
									<td>지도 91110&#45;408호</td>
								</tr>
								<tr>
									<td class="lineNo">제19차 개정</td>
									<td>&#39;96&#46; 10&#46; 30</td>
									<td>지도 91107&#45;507호</td>
								</tr>
								<tr>
									<td class="lineNo">제20차 개정</td>
									<td>&#39;97&#46; 09&#46; 23</td>
									<td>지도 91107&#45;369호</td>
								</tr>
								<tr>
									<td class="lineNo">제21차 개정</td>
									<td>&#39;98&#46; 03&#46; 10</td>
									<td>화물 91107&#45;132호</td>
								</tr>
								<tr>
									<td class="lineNo">제22차 개정</td>
									<td>&#39;98&#46; 05&#46; 06</td>
									<td>화운 91120&#45;329호</td>
								</tr>
								<tr>
									<td class="lineNo">제23차 개정</td>
									<td>&#39;'98&#46; 07&#46; 30</td>
									<td>화운 91120&#45;564호</td>
								</tr>
								<tr>
									<td class="lineNo">제24차 개정</td>
									<td>&#39;99&#46; 12&#46; 24</td>
									<td>화운 91120&#45;822호</td>
								</tr>
								<tr>
									<td class="lineNo">제25차 개정</td>
									<td>&#39;00&#46; 10&#46; 06</td>
									<td>화운 91120&#45;521호</td>
								</tr>
								<tr>
									<td class="lineNo">제26차 개정</td>
									<td>&#39;01&#46; 05&#46; 28</td>
									<td>화운 91120&#45;355호</td>
								</tr>
								<tr>
									<td class="lineNo">제27차 개정</td>
									<td>&#39;01&#46; 09&#46; 24</td>
									<td>화운 91120&#45;731호</td>
								</tr>
								<tr>
									<td class="lineNo">제28차 개정</td>
									<td>&#39;02&#46; 12&#46; 02</td>
									<td>화운 91120&#45;627호</td>
								</tr>
								<tr>
									<td class="lineNo">제29차 개정</td>
									<td>&#39;03&#46; 07&#46; 14</td>
									<td>화운 91120&#45;429호</td>
								</tr>
								<tr>
									<td class="lineNo">제30차 개정</td>
									<td>&#39;04&#46; 07&#46; 31</td>
									<td>물류산업과&#45;1334호</td>
								</tr>
								<tr>
									<td class="lineNo">제31차 개정</td>
									<td>&#39;06&#46; 03&#46; 13</td>
									<td>물류산업팀&#45;465호</td>
								</tr>
								<tr>
									<td class="lineNo">제32차 개정</td>
									<td>&#39;06&#46; 09&#46; 06</td>
									<td>물류산업팀&#45;1891호</td>
								</tr>
								<tr>
									<td class="lineNo">제33차 개정</td>
									<td>&#39;07&#46; 05&#46; 02</td>
									<td>물류산업팀&#45;1268호</td>
								</tr>
								<tr>
									<td class="lineNo">제34차 개정</td>
									<td>&#39;09&#46; 10&#46; 13</td>
									<td>자동차생활과&#45;2365호</td>
								</tr>
								<tr>
									<td class="lineNo">제35차 개정</td>
									<td>&#39;11&#46; 06&#46; 03</td>
									<td>자동차생활과&#45;2360호</td>
								</tr>
								<tr>
									<td class="lineNo">제36차 개정</td>
									<td>&#39;12&#46; 04&#46; 10</td>
									<td>자동차운영과&#45;1106호</td>
								</tr>
								<tr>
									<td class="lineNo">제37차 개정</td>
									<td>&#39;13&#46; 10&#46; 14</td>
									<td>자동차운영과&#45;2646호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;38차 개정</td>
									<td>&#39;14&#46; 10&#46; 29</td>
									<td>자동차운영과 &#45; 4272호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;39차 개정</td>
									<td>&#39;15&#46; 06&#46; 29</td>
									<td>자동차운영과 &#45; 2446호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;40차 개정</td>
									<td>&#39;15&#46; 10&#46; 01</td>
									<td>자동차운영과 &#45; 3898호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;41차 개정</td>
									<td>&#39;16&#46; 05&#46; 09</td>
									<td>자동차운영과 &#45; 2037호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;42차 개정</td>
									<td>&#39;17&#46; 01&#46; 05</td>
									<td>자동차운영보험과 &#45; 95호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;43차 개정</td>
									<td>&#39;17&#46; 04&#46; 06</td>
									<td>자동차운영보험과 &#45; 1852호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;44차 개정</td>
									<td>&#39;17&#46; 09&#46; 14</td>
									<td>자동차운영보험과 &#45; 5044호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;45차 개정</td>
									<td>&#39;18&#46; 05&#46; 03</td>
									<td>자동차운영보험과 &#45; 2448호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;46차 개정</td>
									<td>&#39;18&#46; 05&#46; 31</td>
									<td>자동차운영보험과 &#45; 2920호</td>
								</tr>
								<tr>
									<td class="lineNo">제&nbsp;47차 개정</td>
									<td>&#39;18&#46; 12&#46; 11</td>
									<td>자동차운영보험과 &#45; 7093호</td>
								</tr>
							</tbody>
						</table>
					</div><!--// 자동차공제 개정연혁 -->
				</div>
				<div class="textTitle"><h2 class="txtTit03">자동차 공제약관</h2></div>
				<table class="tbSt03" summary="약관 다운로드">
					<colgroup>
						<col width="85%">
						<col width="15%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><a href="#;" onclick="downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000007949&fileSn=0'); return false;">자동차 공제약관 다운로드</a></th>
							<td><a href="#;" onclick="downpdf('/cmm/fms/FileDown.do?atchFileId=FILE_000000000007949&fileSn=0'); return false;"><img src="/images/m_truck/com/btn_pdf.png" alt="pdf보기" /></a></td>
						</tr>
					</tbody>
				</table><!-- 용어의 정의 및 자동차공제의 구성 -->
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