<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<!-- meta, title, css, javascript -->
<c:import url="/common/include/subGlobal.do"></c:import>
<script type="text/javascript">
$(document).ready(function(){
	$(".borderSt01").click();
	<%-- 검색박스 엔터키 설정--%>
	$('input[name="searchKeywordTotal"]').on('keydown',function(event){
		if( event.keyCode == 13) {
			searchForm();
			return false;
		}
	});
});
function searchForm(){
	var keyword = document.searchForm.searchKeywordTotal.value;
	if(keyword == ""){
		alert("검색어를 입력해주십시오.");
		return false;
	}else{
	document.searchForm.searchKeywordT.value = keyword;
	document.searchForm.action = "<c:url value='/main/totalSearch.do'/>";
	document.searchForm.submit();
	}
}
/* index function */
function goIndex() {
	document.location.href = "/main/index.do";
}
</script>
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
				<div class="conTitle">
					<div class="title">
						<h2><img src="/images/truck/dedu/term_tit.gif" alt="공제약관" /></h2>
						<p>차와 고객만을 생각하는 화물공제조합 입니다&#46;</p>
					</div>
					<div class="location">
						<a class="ico_home" href="#;" onclick="goIndex(); return false;">HOME</a>						
						<a href="/deductProduct/carDeductInfo.do" >공제약관</a>
						<span>자동차공제약관</span>
					</div>
				</div><!--// conTitle e -->
				<div class="conaArea">
					<p class="confirTit"><img src="/images/truck/dedu/carDed_con_tit.gif" alt="화물공제조합 자동차공제약관입니다. 약관제목을 선택하시면, 다운로드 가능합니다." /></p>				
					<div class="conSection">
						<!-- 자동차공제약관 -->
						<h3 class="deduh3Tit termBg">자동차공제약관</h3>
						<div class="list01">
							<h4 class="deduH4 borderSt01"><span>자동차공제 약관 쉽게 찾는 법</span></h4>
							<div class="deduDiv borderSt01">
								<p class="txtPoint01">공제계약 시 꼭 알아야 할 사항</p>
								<ol class="txtListst03">
									<li>공제계약의 성립&#40;제4편 제1장 제40조&#41;</li>
									<li>약관교부 및 설명의무 등&#40;제4편 제1장 제41조&#41;</li>
									<li>공제기간&#40;제4편 제1장 제44조&#41;</li>
									<li>조합원 등의 의무사항&#40;제4편 제2장&#41;</li>
									<li>공제계약의 취소&#40;제4편 제3장 제52조&#41;</li>
									<li>공제계약의 효력 상실&#40;제4편 제3장 제53조&#41;</li>
									<li>조합의 개인정보이용 및 공제계약 정보의 제공&#40;제4편 제4장 제58조&#41;</li>
								</ol>
								<p class="txtPoint01">자동차 사고로 다른 사람에게 피해를 주었을 경우</p>
								<ol class="txtListst03">
									<li>대인배상&#8544;&#44; 대인배상&#8545;&#44; 대물배상&#40;제2편 제1장 제1절&#44; 제2절&#41;</li>
									<li>보상하지 않는 손해&#40;제2편 제1장 제5조&#44; 제8조&#41;</li>
									<li>조합원의 공제금 청구&#40;제3편 제1장&#41;</li>
									<li>사고발생시 의무&#40;제4편 제2장 제48조&#41;</li>
								</ol>
								<p class="txtPoint01">자동차 사고로 자신 또는 가족이 피해를 입었을 경우</p>
								<ol class="txtListst03">
									<li>자기신체사고&#40;제2편 제2장 제1절&#41;</li>
									<li>종사자재해&#40;제2편 제2장 제2절&#41;</li>
									<li>자기차량손해&#40;제2편 제2장 제3절&#41;</li>
									<li>보상하지 않는 손해&#40;제2편 제2장 제14조&#44; 제19조&#44; 제25조&#41;</li>
									<li>조합원의 공제금 청구&#40;제3편 제1장&#41;</li>
									<li>사고발생시 의무&#40;제4편 제2장 제48조&#41;</li>
								</ol>
							</div><!--// 자동차공제 약관 쉽게 찾는 법 -->
							<h4 class="deduH4 borderSt02 "><span>자동차공제 개정연혁</span></h4>
							<div class="deduDiv borderSt02">
								<p class="txtPoint01">자동차공제 약관 개정 연혁</p>
								<table class="tbDetail_st01" summary="자동차공제 개정연혁정보 테이블 입니다">
									<caption>자동차공제 개정연혁에 대해서 나타낸 표</caption>
									<colgroup>
										<col style="width:18%;" />
										<col style="width:20%;" />
										<col style="width:47%;" />
										<col style="width:15%;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col">구분</th>
											<th scope="col">승인일자</th>
											<th scope="col">승인번호</th>
											<th scope="col">비고</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;정</td>
											<td>&#39;81&#46; 06&#46; 30</td>
											<td>운수 1510 &#45; 10888호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;1차 개정</td>
											<td>&#39;81&#46; 12&#46; 24</td>
											<td>육지 1519 &#45; 18888호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;2차 개정</td>
											<td>&#39;82&#46; 07&#46; 09</td>
											<td>육지 1519 &#45; 7635호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;3차 개정</td>
											<td>&#39;83&#46; 12&#46; 13</td>
											<td>육지 1519 &#45; 14888호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;4차 개정</td>
											<td>&#39;85&#46; 07&#46; 25</td>
											<td>운수 33191 &#45; 7368호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;5차 개정</td>
											<td>&#39;86&#46; 10&#46; 24</td>
											<td>운수 33191 &#45; 11059호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;6차 개정</td>
											<td>&#39;87&#46; 10&#46; 15</td>
											<td>운수 33191 &#45; 10195호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;7차 개정</td>
											<td>&#39;88&#46; 04&#46; 07</td>
											<td>운수 33110 &#45; 3576호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;8차 개정</td>
											<td>&#39;88&#46; 06&#46; 27</td>
											<td>운수 33110 &#45; 6691호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;&nbsp;&nbsp;9차 개정</td>
											<td>&#39;89&#46; 09&#46;&nbsp;19</td>
											<td>운수 33110 &#45; 8750호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;10차 개정</td>
											<td>&#39;90&#46; 05&#46; 10</td>
											<td>운수 33110 &#45; 1698호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;11차 개정</td>
											<td>&#39;91&#46; 09&#46; 06</td>
											<td>운수 33110 &#45; 10164호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;12차 개정</td>
											<td>&#39;91&#46; 12&#46; 24</td>
											<td>지도 33110 &#45; 14480호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;13차 개정</td>
											<td>&#39;92&#46; 12&#46; 02</td>
											<td>지도 33191 &#45; 455호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;14차 개정</td>
											<td>&#39;95&#46; 02&#46; 10</td>
											<td>지도 91107 &#45; 52호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;15차 개정</td>
											<td>&#39;95&#46; 09&#46; 20</td>
											<td>지도 91107 &#45; 360호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;16차 개정</td>
											<td>&#39;96&#46; 05&#46; 09</td>
											<td>지도 91107 &#45; 211호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;17차 개정</td>
											<td>&#39;96&#46; 07&#46; 24</td>
											<td>지도 91107 &#45; 346호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;18차 개정</td>
											<td>&#39;96&#46; 08&#46; 27</td>
											<td>지도 91110 &#45; 408호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;19차 개정</td>
											<td>&#39;96&#46; 10&#46; 30</td>
											<td>지도 91107 &#45; 507호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;20차 개정</td>
											<td>&#39;97&#46; 09&#46; 23</td>
											<td>지도 91107 &#45; 369호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;21차 개정</td>
											<td>&#39;98&#46; 03&#46; 10</td>
											<td>화물 91107 &#45; 132호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;22차 개정</td>
											<td>&#39;98&#46; 05&#46; 06</td>
											<td>화운 91120 &#45; 329호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;23차 개정</td>
											<td>&#39;'98&#46; 07&#46; 30</td>
											<td>화운 91120 &#45; 564호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;24차 개정</td>
											<td>&#39;99&#46; 12&#46; 24</td>
											<td>화운 91120 &#45; 822호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;25차 개정</td>
											<td>&#39;00&#46; 10&#46; 06</td>
											<td>화운 91120 &#45; 521호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;26차 개정</td>
											<td>&#39;01&#46; 05&#46; 28</td>
											<td>화운 91120 &#45; 355호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;27차 개정</td>
											<td>&#39;01&#46; 09&#46; 24</td>
											<td>화운 91120 &#45; 731호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;28차 개정</td>
											<td>&#39;02&#46; 12&#46; 02</td>
											<td>화운 91120 &#45; 627호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;29차 개정</td>
											<td>&#39;03&#46; 07&#46; 14</td>
											<td>화운 91120 &#45; 429호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;30차 개정</td>
											<td>&#39;04&#46; 07&#46; 31</td>
											<td>물류산업과 &#45; 1334호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;31차 개정</td>
											<td>&#39;06&#46; 03&#46; 13</td>
											<td>물류산업팀 &#45; 465호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;32차 개정</td>
											<td>&#39;06&#46; 09&#46; 06</td>
											<td>물류산업팀 &#45; 1891호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;33차 개정</td>
											<td>&#39;07&#46; 05&#46; 02</td>
											<td>물류산업팀 &#45; 1268호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;34차 개정</td>
											<td>&#39;09&#46; 10&#46; 13</td>
											<td>자동차생활과 &#45; 2365호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;35차 개정</td>
											<td>&#39;11&#46; 06&#46; 03</td>
											<td>자동차생활과 &#45; 2360호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;36차 개정</td>
											<td>&#39;12&#46; 04&#46; 10</td>
											<td>자동차운영과 &#45; 1106호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;37차 개정</td>
											<td>&#39;13&#46; 10&#46; 14</td>
											<td>자동차운영과 &#45; 2646호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;38차 개정</td>
											<td>&#39;14&#46; 10&#46; 29</td>
											<td>자동차운영과 &#45; 4272호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;39차 개정</td>
											<td>&#39;15&#46; 06&#46; 29</td>
											<td>자동차운영과 &#45; 2446호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;40차 개정</td>
											<td>&#39;15&#46; 10&#46; 01</td>
											<td>자동차운영과 &#45; 3898호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;41차 개정</td>
											<td>&#39;16&#46; 05&#46; 09</td>
											<td>자동차운영과 &#45; 2037호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;42차 개정</td>
											<td>&#39;17&#46; 01&#46; 05</td>
											<td>자동차운영보험과 &#45; 95호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;43차 개정</td>
											<td>&#39;17&#46; 04&#46; 06</td>
											<td>자동차운영보험과 &#45; 1852호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;44차 개정</td>
											<td>&#39;17&#46; 09&#46; 14</td>
											<td>자동차운영보험과 &#45; 5044호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;45차 개정</td>
											<td>&#39;18&#46; 05&#46; 03</td>
											<td>자동차운영보험과 &#45; 2448호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;46차 개정</td>
											<td>&#39;18&#46; 05&#46; 31</td>
											<td>자동차운영보험과 &#45; 2920호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;47차 개정</td>
											<td>&#39;18&#46; 12&#46; 11</td>
											<td>자동차운영보험과 &#45; 7093호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;48차 개정</td>
											<td>&#39;19&#46; 5&#46; 1</td>
											<td>자동차운영보험과 &#45; 2675호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;49차 개정</td>
											<td>&#39;20&#46; 6&#46; 1</td>
											<td>자동차운영보험과 &#45; 3404호</td>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td>제&nbsp;50차 개정</td>
											<td>&#39;20&#46; 12&#46; 10</td>
											<td>자동차운영보험과 &#45; 8511호</td>
											<td>&nbsp;</td>
										</tr>
									</tbody>
								</table>
							</div><!--// 자동차공제 개정연혁 -->
						</div>
						<p class="tbRbtn"><img src="/images/truck/btn/btn_dreader.gif" alt="Get ADOBE READER 공제약관을 보시려면 Acrobat Reader를 설치하셔야 합니다." /></p>
						<table class="tbDetail_st01 mB0 tbTerm" summary="자동차공제약관 상세정보 테이블 입니다.">
							<caption>자동차공제약관에 대해서 나타낸 표</caption>
							<colgroup>
								<col style="width:40%;" />
								<col style="width:*;" />
								<col style="width:15%;" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" ><span>자동차공제약관</span></th>
									<td class="bB2"></td>
									<td class="alC bB2"><span class="btn_pack btn_type07 icon"><span class="acrob"></span><a href="/cmm/fms/FileDown.do?atchFileId=FILE_000000000008793&fileSn=0">다운로드</a></span></td>
								</tr>
							</tbody>
						</table><!--// 자동차공제약관표 e -->
					</div><!--// conSection e -->
				</div><!--// conaArea e -->
			</div><!--// contents e -->
			<!-- quick s --><c:import url="/common/include/quickMenu.do"></c:import><!--// quick e -->
		</div>
		<!--// container e -->
		<hr />
		<!-- footer s --><c:import url="/common/include/footer.do"></c:import><!--// footer e -->
	</div>
	<!-- //wrap e -->
</body>
</html>